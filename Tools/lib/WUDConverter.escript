/*
* This file is part of the open source part of the
* Platform for Algorithm Development and Rendering (PADrend).
* Web page: http://www.padrend.de/
* Copyright (C) 2018-2019 Sascha Brandt <sascha@brandt.graphics>
* 
* PADrend consists of an open source part and a proprietary part.
* The open source part of PADrend is subject to the terms of the Mozilla
* Public License, v. 2.0. You should have received a copy of the MPL along
* with this library; see the file LICENSE. If not, you can obtain one at
* http://mozilla.org/MPL/2.0/.
*/
static T = new Type;

//----------------------

static mdLink = fn(link, name) {
	if(!link)
		return name;
	return "[" + name + "](" + link.replaceAll("__","%5F%5F") + ")";
};

//----------------------

static mdNote = fn(note) {
	return "> **Note**: " + note;
	//return "{% include note.html content=\"" + note + "\" %}";
};

//----------------------

static mdWarn = fn(note) {
	return "> **Warning**: " + note;
	//return "{% include warning.html content=\"" + note + "\" %}";
};

//----------------------

static quoted = fn(s) {
	return "\"" + s + "\"";
};

//----------------------

static unescape = fn(s) {
	return s.replaceAll({
		"&amp;" : "\&",
		"&lt;" : "\<",
		"&gt;" : "\>",
		"&quot;" : "\"",
		"&apos;" : "\'",
	});
};

static escape = fn(s) {
	return s.replaceAll({
		"\&" : "&amp;",
		"\<" : "&lt;",
		"\>" : "&gt;",
		"\"" : "&quot;",
		"\'" : "&apos;",
		"\n" : "<br/>",
		"|" : "\\|",
		"*" : "\\*",
	});
};

//----------------------

static containsAny = fn(s, param...) {
	foreach(param as var p) {
		if(s.contains(p))
			return true;
	}
	return false;
};

//----------------------

static createParamList = fn(min, max) {
	var p = "";
	for(var i=0; i<min; ++i)
		p += ", p" + i;
	p = p.substr(2);
	if(max < min) {
		p = min <= 0 ? "..." : p + ", ...";
	} else if(max > min) {
		var o = "";
		for(var i=max-1; i>=min; --i)
			o = " [, p" + i + o + "]";
		if(min <= 0)
			o = "[" + o.substr(4);
		p += o;
	}
	return p;
};

//----------------------

T.compounds @(init) := Map;
T.members @(init) := Map;
T.apiRefs @(init) := Map;

//----------------------

T.resolveRef ::= fn(ref) {
	var id = ref.refid;
	var c = compounds[id];
	var m = members[id];
	if(c) {
		id = "escript_" + c.compoundname.replaceAll("::",".").toLower();
		if(!typeObjects.containsKey(id))
			return false;
	} else if(m) {
		return false;
	}
	return id;
};

//----------------------

T.collectKeywords ::= fn(to) {
	var keywords = [];
	foreach(to.functions as var f)
		if(XML.search(f.name, "\\w+"))
			keywords += f.name;
	foreach(to.constants as var a)
		if(XML.search(a.name, "\\w+"))
			keywords += a.name;
	return keywords;
};

//----------------------

T.writeCompound ::= fn(c) {	
	var keywords = collectKeywords(c);
	
	var top_ns = c;
	var sec_ns = false;
	var breadcrumbs = [];
	while(!top_ns.parent.empty() && compounds[top_ns.parent]) {
		sec_ns = top_ns;
		top_ns = compounds[top_ns.parent];
		breadcrumbs.pushFront(top_ns.name + ":" + top_ns.permalink);
	}
	var category = top_ns.name;
	if(top_ns.location.contains("/EScript/"))
		category = "EScript";
	
	var group;
		
	var header = {
		"title" : quoted(c.name),
		"permalink" : c.permalink,
		"author" : "Generated using <a href=\"https://github.com/MeisterYeti/WhatsUpDoc\">WhatsUpDoc</a>",
		"category" : quoted(category),
		"show_in_toc" : true,
		"sidebar" : "e_api_sidebar",
		"layout" : "e_api",
		"api_type" : c.kind,
		"breadcrumbs" : quoted(breadcrumbs.implode("|")),
		"toc" : false,
		"keywords" : keywords.implode(", "),
	};
	
	if(group)
		header["subcategory"] = quoted(group);
	else if(sec_ns && (sec_ns != c || !sec_ns.children.empty()))
		header["subcategory"] = quoted(sec_ns.name);
		
	if(c == top_ns)
		header["order"] = 0;
	else if(c == sec_ns && !c.children.empty())
		header["order"] = 1;
	
	header["api_location"] = quoted(c.location);
		
	var content = "---\n";
	foreach(header as var key, var value) {
		content += key + ": " + value + "\n";
	}
	content += "---\n\n";
	
	/*if(c.ref) {
		content += "**Wrapped Object**: " + mdLink(c.ref, c.shortname) + ".\n\n";
	}*/
	
	/*if(c.inherits) {
		content += "#### Inherits\n\n";
		content += "* " + mdLink(c.inherits.id, c.inherits.name) + "\n";
		content += "\n\n";
	}*/
	
	/*if(!c.inherited.empty()) {
		content += "#### Inherited\n\n";
		foreach(c.inherited as var obj) {
			content += "* " + mdLink(obj.id, obj.name) + "\n";
		}
		content += "\n\n";
	}*/
		
	if(!c.children.empty()) {
		content += "## Types & Namespaces\n\n";
		content += "|\n| ------- | ----------------- |\n";
		foreach(c.children as var ref) {
			var child = compounds[ref.ref];
			if(child)
				content += "| " + child.kind + " | " + mdLink(child.permalink, child.name) + " |\n";
		}
		content += "{: .nohead }\n\n";
	}
	
	if(!c.constants.empty()) {
		content += "## Attributes\n\n";		
		content += "|\n";
		content += "| ------: | ----------------- |\n";
		foreach(c.constants as var m) {
			var ref = m.cpp.empty() ? void : apiRefs[m.cpp];
			if(ref)
				content += "| **" + mdLink(ref, m.name) + "** | |\n";
			else
				content += "| **" + m.name + "** | |\n";
		}
		content += "{: .nohead }\n";
	}
		
	if(!c.functions.empty()) {
		content += "## Functions\n\n";		
		content += "|\n";
		content += "| ------: | ----------------- |\n";
		foreach(c.functions as var f) {
			var p = createParamList(f.minParams, f.maxParams);
			var ref = f.cpp.empty() ? void : apiRefs[f.cpp];
			if(ref)
				content += "| **" + mdLink(ref, f.name) + "**(" + p + ") | " + escape(f.comment) + " |\n";
			else
				content += "| **" + f.name + "**(" + p + ") | " + escape(f.comment) + " |\n";
		}
		content += "{: .nohead .nowrap1 }\n";
	}
	
	return content;
};

//----------------------

T.writeMarkdown ::= fn(path) {
	if(!IO.isDir(path)) {
		Runtime.warn("Invalid path: " + path);
		return false;
	}
	if(!path.endsWith("/"))
		path += "/";
	foreach(compounds as var id, var c) {
		var md = writeCompound(c);
		if(md)
			IO.saveTextFile(path + c.permalink + ".md", md);
	}
};


//----------------------

T.parseFile ::= fn(file) {
	static rootObj;
	var compound;
	
	try {
		compound = mapToObj(parseJSON(IO.loadTextFile(file)));
	} catch(e) {
		Runtime.warn("Could not parse file '" + file + "': " + e);
		return false;
	}
	var fileName = file.split("/").back().split("\\").back().replace(".json","");
	compound.permalink := "escript_" + fileName;
	compounds[compound.id] = compound;
	return compound;
};

//----------------------

T.setRefs ::= fn(refs) {
	this.apiRefs = refs;
};

return T;