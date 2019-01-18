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

static SchemaUtil = load(__DIR__ + "/SchemaUtil.escript");

//----------------------

static TypeObject = new Type(ExtObject);
TypeObject.id := void;
TypeObject.name := void;
TypeObject.shortname := void;
TypeObject.kind := void;
TypeObject.inherits := void;
TypeObject.initFn := void;
TypeObject.ref := void;
TypeObject.parent := void;
TypeObject.category := void;
TypeObject.group := void;
TypeObject.compound := void;
TypeObject.ctor @(init) := Array;
TypeObject.attributes @(init) := Array;
TypeObject.functions @(init) := Array;
TypeObject.subtypes @(init) := Array;
TypeObject.inherited @(init) := Array;
TypeObject._constructor ::= fn(name, kind="type") {
	this.name = name.replace("GLOBALS.","");
	this.shortname = this.name.split(".").back();
	this.kind = kind;
	this.id = "escript_" + this.name.replaceAll(".","_").toLower();
};
TypeObject.toString ::= fn() {
	return id + " : " + name + "";
};

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
T.typeObjects @(init) := Map;
T.compTypes @(init) := Map;
T.initFunctions @(init) := Map;
T.initRoots @(init) := Map;
T.apiRefs @(init) := Map;
T.schema @(init) := SchemaUtil;

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

T.collapse ::= fn(element) {
	if(element === void)
		return '';
	var s = '';
	if(element.isA(String)) {
		s = unescape(element);
	} else if(element.isA(Array)) {
		foreach(element as var value)
			s += collapse(value);
	} else if(element.isA(SchemaUtil.Element)) {
		// recurse on children
		foreach(element as var value)
			s += collapse(value);
	} else {
		s = element.toString();
	}
	return s;
};

//----------------------

T.collapseRef ::= fn(element) {
	if(element === void)
		return '';
	var s = '';
	if(element.isA(String)) {
		s = unescape(element);
	} else if(element.isA(Array)) {
		foreach(element as var value)
			s += collapseRef(value);
	} else if(element.isA(SchemaUtil.Element)) {
		if(element.getName() == 'ref')
			return element.refid;
		foreach(element as var value)
			s += collapseRef(value);
	} else {
		s = element.toString();
	}
	return s;
};

//----------------------

T.toMarkdown ::= fn(element) {
	if(element === void)
		return '';
	var s = '';
	if(element.isA(String)) {
		s = unescape(element.replaceAll("|","\\|"));
	} else if(element.isA(Array)) {
		foreach(element as var value)
			s += toMarkdown(value);
	} else if(element.isA(SchemaUtil.Element)) {
		// opening the element
		switch (element.getName()) {
			case 'ref': return ' ' + mdLink(resolveRef(element), toMarkdown(element.data())) + ' ';
			case 'emphasis': s = '*'; break;
			case 'parametername':
			case 'bold': s = '**'; break;
			case 'computeroutput': s = '`'; break;
			case 'parameterlist':
				if (element.kind == 'exception') {
					s = '\n#### Exceptions\n';
				} else {
					s = '\n#### Parameters\n';
				}
				return s + toMarkdown(element.parameteritem);
			case 'parameteritem': 
				s += toMarkdown(element.parameternamelist) + "\n:  ";
				s += toMarkdown(element.parameterdescription) + "\n"; 
				break;
			case 'parameternamelist': s = toMarkdown(element.parametername); break;
			case 'programlisting': s = '\n\n```cpp\n' + toMarkdown(element.codeline); break;
			case 'codeline': s = toMarkdown(element.highlight); break;
			case 'verbatim': s = '\n\n```\n'; break;
			case 'itemizedlist': s = '\n\n' + toMarkdown(element.listitem); break;
			case 'listitem': s = '* ' + toMarkdown(element.para); break;
			case 'sp': s = ' '; break;
			case 'heading': s = '## '; break;
			case 'xrefsect': s += '\n> '; break;
			case 'simplesect':
				switch(element.kind) {
					case "see": s = '\n\n*See also*: '; break;
					case "return": s = '\n#### Returns\n'; break;
					case "author": s = '\n\n**Author**: '; break;
					case "authors": s = '\n\n**Authors**: '; break;
					case "version": s = '\n\n**Version**: ';  break;
					case "since": s = '\n\n**Since**: ';  break;
					case "date": s = '\n\n**Date**: ';  break;
					case "note":
						return s + "\n" + mdNote(toMarkdown(element.para)) + "\n";
						break;
					case "warning": 
						return s + "\n" + mdWarn(toMarkdown(element.para)) + "\n";
						break;
					case "pre": s = '\n\n**Pre**: '; break;
					case "post": s = '\n\n**Post**: '; break;
					case "copyright": s = '\n\n*(C)*: '; break;
					case "invariant": break;
					case "remark": s = "\n\n> "; break;
					case "attention": s = "\n\n> "; break;
					case "par": s = "\n\n"; break;
					case "rcs": break;
				}
				return s + toMarkdown(element.para);
				break;
			case 'formula':
				s = element.text;
				if (s.beginsWith('$') && s.endsWith('$')) return s;
				if (s.startsWith('\\[') && s.endsWith('\\]'))
					s = s.substring(2, s.length() - 2).trim();
				return '\n$$\n' + s + '\n$$\n';
			case 'note':
				s = "{% include note.html content=\""; break;
		}

		// recurse on children
		foreach(element as var value)
			s += toMarkdown(value);

		// closing the element
		switch (element.getName()) {
			case 'para': s += '\n\n'; break;
			case 'emphasis': s += '*'; break;
			case 'parametername':
			case 'bold': s += '**'; break;
			case 'parameteritem': s += '\n'; break;
			case "computeroutput": s += '`'; break;
			case 'entry': s += ' | '; break;
			case 'verbatim':
			case 'programlisting': s += '\n```\n'; break;
			case 'codeline': s += '\n'; break;
			case 'ulink': s = mdLink(element.url, s); break;
			case 'itemizedlist': s += '\n'; break;
			case 'listitem': s += '\n'; break;
			case 'xreftitle': s += ': '; break;
			case 'row':
				s = '\n' + s;
				/*if (element.$$ && element.$$[0].$.thead == "yes") {
				element.$$.forEach(function (th, i) {
				s += (i ? ' | ' : '\n') + '---------';
				});
				}*/
			case 'note':
				s += "\" %}"; break;
			break;
		}

			
	} else {
		s = element.toString();
	}
	return s;
};

//----------------------

T.collectKeywords ::= fn(to) {
	var keywords = [];
	foreach(to.functions as var f)
		if(XML.search(f.name, "\\w+"))
			keywords += f.name;
	foreach(to.attributes as var a)
		if(XML.search(a.name, "\\w+"))
			keywords += a.name;
	return keywords;
};

//----------------------

T.writeType ::= fn(to) {
	var globals = typeObjects["escript_globals"];
	if(to == globals)
		return false;
	
	var keywords = collectKeywords(to);
	
	var top_ns = to;
	var sec_ns = false;
	var group = to.group;
	var breadcrumbs = [];
	while(top_ns.parent && top_ns.parent != globals) {
		sec_ns = top_ns;
		top_ns = top_ns.parent;
		breadcrumbs.pushFront(top_ns.shortname + ":" + top_ns.id);
	}
	if(!group && sec_ns) group = sec_ns.shortname;
		
	var header = {
		"title" : quoted(to.shortname),
		"permalink" : to.id,
		"author" : "Generated from Doxygen",
		"category" : quoted(to.category),
		"show_in_toc" : true,
		"sidebar" : "e_api_sidebar",
		"layout" : "e_api",
		"api_type" : to.kind,
		"breadcrumbs" : quoted(breadcrumbs.implode("|")),
		"toc" : false,
		"keywords" : keywords.implode(", "),
	};
	
	if(group)
		header["subcategory"] = quoted(group);
	
	if(to == top_ns)
		header["order"] = 0;
	else if(to == sec_ns && !to.subtypes.empty())
		header["order"] = 1;
	
	header["api_location"] = quoted(to.initFn.content.location.bodyfile);
		
	var content = "---\n";
	foreach(header as var key, var value) {
		content += key + ": " + value + "\n";
	}
	content += "---\n\n";
	
	if(to.ref) {
		content += "**Wrapped Object**: " + mdLink(to.ref, to.shortname) + ".\n\n";
	}
	
	if(to.inherits) {
		content += "#### Inherits\n\n";
		content += "* " + mdLink(to.inherits.id, to.inherits.name) + "\n";
		content += "\n\n";
	}
	
	if(!to.inherited.empty()) {
		content += "#### Inherited\n\n";
		foreach(to.inherited as var obj) {
			content += "* " + mdLink(obj.id, obj.name) + "\n";
		}
		content += "\n\n";
	}
		
	if(!to.subtypes.empty()) {
		content += "## Types & Namespaces\n\n";
		content += "|\n| ------- | ----------------- |\n";
		foreach(to.subtypes as var cl) {
			content += "| " + cl.kind + " | " + mdLink(cl.id, cl.name) + " |\n";
		}
		content += "{: .nohead }\n\n";
	}
	
	if(!to.attributes.empty()) {
		content += "## Attributes\n\n";		
		content += "|\n";
		content += "| ------: | ----------------- |\n";
		foreach(to.attributes as var m) {
			content += "| **" + m.name + "** | " + toMarkdown(m.doc) + " |\n";
		}
		content += "{: .nohead }\n";
	}
	
	if(!to.ctor.empty()) {
		content += "## Constructor\n\n";		
		content += "|\n";
		content += "| ------: | ----------------- |\n";
		foreach(to.ctor as var f) {
			var p = createParamList(f.min, f.max);
			if(to.ref)
				content += "| new **" + mdLink(to.ref, to.shortname) + "**(" + p + ") | " + toMarkdown(f.doc) + " |\n";
			else
				content += "| new **" + to.shortname + "**(" + p + ") | " + toMarkdown(f.doc) + " |\n";
		}
		content += "{: .nohead .nowrap1 }\n";
	}
	
	if(!to.functions.empty()) {
		content += "## Functions\n\n";		
		content += "|\n";
		content += "| ------: | ----------------- |\n";
		foreach(to.functions as var f) {
			var p = createParamList(f.min, f.max);
			if(f.ref)
				content += "| **" + mdLink(f.ref, escape(f.name)) + "**(" + p + ") | " + toMarkdown(f.doc) + " |\n";
			else
				content += "| **" + escape(f.name) + "**(" + p + ") | " + toMarkdown(f.doc) + " |\n";
		}
		content += "{: .nohead .nowrap1 }\n";
	}
	
	return content;
};

//----------------------

T.createTypes ::= fn(initFn, initType, d=0) {
	//outln("  "*d, initType.name, ": ");
	// collect used type objects
	var typeVars = new Map;
	foreach(initFn.consts as var c)
		typeVars[c.type] = new ExtObject({ $varName : c.type, $name : void, $to : void, $parentVar : void, $ref : void, $kind : "type"});
	foreach(initFn.functions as var c)
		typeVars[c.type] = new ExtObject({ $varName : c.type, $name : void, $to : void, $parentVar : void, $ref : void, $kind : "type"});
	foreach(initFn.ctor as var c)
		typeVars[c.type] = new ExtObject({ $varName : c.type, $name : void, $to : void, $parentVar : void, $ref : void, $kind : "type"});
	foreach(initFn.types as var c) {
		typeVars[c.type] = new ExtObject({ $varName : c.type, $name : void, $to : void, $parentVar : void, $ref : c.ref, $kind : c.kind});
	}
	typeVars[initFn.inType] = new ExtObject({ $varName : initFn.inType, $name : initType.name, $to : initType, $parentVar : void, $ref : void, $kind : "type"});
	
	// Resolve relations
	foreach(initFn.consts as var c) {
		if(members[c.name]) {
			typeVars[c.value].ref = members[c.name].compound.id;
			c.name = members[c.name].compound.shortname.replace("E_","");
		} else if(c.name == "getClassName()") {
			c.name = initFn.content.compound.shortname.replace("E_","");
		} else if(c.name.endsWith("::getClassName()")) {
			c.name = c.name.replace("::getClassName()", "").split("::").back().replace("E_","");
		}
		if(typeVars.containsKey(c.value)) {
			typeVars[c.value].parentVar = typeVars[c.type];
			typeVars[c.value].name = c.name;
		}
	}
	foreach(initFn.functions as var c) {
		if(members[c.name])
			c.name = members[c.name].name;
	}
	
	foreach(typeVars as var k, var v) {
		if(!v.parentVar) {
			if(v.ref) {
				v.name = compounds[v.ref].shortname.replace("E_","");
				v.to = compTypes[v.ref];
			} else {
				v.name = initType.name;
				v.to = initType;
			}
		}
	}
	
	// create type objects	
	foreach(typeVars as var k, var v) {
		var fullname = v.name;
		var p = v.parentVar;
		while(p) {
			fullname = p.name + "." + fullname;
			p = p.parentVar;
		}		
		if(!v.to) {
			v.to = new TypeObject(fullname, v.kind);
			//outln("  "*d, "  ", fullname);
			v.to.compound = v.ref ? compounds[v.ref] : initFn.content.compound;
			v.to.initFn = initFn;
			// guess category from top namespace
			v.to.category = v.to.compound.compoundname.split("::").front().replace("E_","");
			compTypes[v.to.compound.id] = v.to;
			
			var refName = v.to.name;
			if(v.to.category == "EScript")
				refName = "EScript." + refName;
			v.to.ref = apiRefs[refName];
			typeObjects[v.to.id] = v.to;
		}
		
		foreach(initFn.ctor as var c) {
			if(c.type == v.varName)
				v.to.ctor += c;
		}
		foreach(initFn.functions as var c) {
			if(c.type == v.varName) {
				// try to find corresponding C++ function
				var fnName = v.to.name + "." + c.name;
				if(v.to.category == "EScript")
					fnName = "EScript." + fnName;
				c.ref = apiRefs[fnName];
				v.to.functions += c;
			}
		}
		foreach(initFn.consts as var c) {
			if(c.type == v.varName) {
				if(!typeVars[c.value])
					v.to.attributes += c;
			}
		}
	}
	
	// create hierarchy
	foreach(typeVars as var v) {
		if(v.parentVar) {
			var parent = v.parentVar.to;
			v.to.parent = parent;
			parent.subtypes += v.to;
		}
	}
	
	// recurse
	foreach(initFn.initCalls as var c) {
		var v = typeVars[c.type];
		if(v && v.to && c.call) {
			createTypes(c.call, v.to);
		}
	}
};


//----------------------

T.buildCallGraph ::= fn() {
	foreach(initFunctions as var id, var initFn) {
		foreach(initFn.initCalls as var call) {
			var ref = initFunctions[call.callId];
			if(ref) {
				ref.caller = initFn;
				call.call = ref;
			}
		}
	}	
	foreach(initFunctions as var id, var initFn) {
		if(!initFn.caller)
			initRoots[id] = initFn;
	}
};

//----------------------

T.writeMarkdown ::= fn(path) {
	if(!IO.isDir(path)) {
		Runtime.warn("Invalid path: " + path);
		return false;
	}
	if(!path.endsWith("/"))
		path += "/";
	buildCallGraph();
	var globals = new TypeObject("GLOBALS");
	typeObjects[globals.id] = globals;
	foreach(initRoots as var initFn)
		createTypes(initFn, globals);
	foreach(typeObjects as var id, var to) {
		var md = writeType(to);
		if(md)
			IO.saveTextFile(path + id + ".md", md);
	}
};


//----------------------

T.initSchema ::= fn(file) {
	try {
		schema.parseSchema(file);
	} catch(e) {
		Runtime.warn("Could not parse schema '" + file + "': " + e);
		return false;
	}
};

//----------------------

T.parseInitFunction ::= fn(c) {
	foreach(c.sectiondef as var s) {
		foreach(s.memberdef as var m) {
			m.compound := c;
			if(m.kind == "function" && m.name == "init" && collapse(m.type).trim() == "void" 
						&& m.param.count() == 1 && collapse(m.param[0].type).contains("Namespace")) {
				var inType = m.param[0].defname ? m.param[0].defname : m.param[0].declname;
				//outln("Init ", m.definition, "(", inType ,")");				
				var commentBlock = [];
				var consts = [];
				var ctor = [];
				var functions = [];
				var initCalls = [];
				var types = [];
				foreach(m.inbodydescription as var d) {
					var line = collapseRef(d.data());
					var match = XML.search(line, '\\[(\\w+)\\]\\s*\\{\\{(.*)\\}\\}');
					if(!match) {
						commentBlock += d.data();
					} else {
						var type = match.matches[1];
						var params = match.matches[2].split("$").map(fn(i,v){ return unescape(v).trim().replaceAll({'"' : '', '*' : '', '&' : ''}); });
						switch(type) {
							case "CONST":
								consts += new ExtObject({
									$type : params[0],
									$name : params[1],
									$value : params[2],
									$doc : commentBlock,
								});
								break;
							case "CTOR":
								ctor += new ExtObject({
									$type : params[0],
									$min : params[1].toNumber(),
									$max : params[2].toNumber(),
									$doc : commentBlock,
								});
								break;
							case "FUN":
								functions += new ExtObject({
									$type : params[0],
									$thisObj : void,
									$name : params[1],
									$min : params[2].toNumber(),
									$max : params[3].toNumber(),
									$doc : commentBlock,
									$isStatic : true,
									$ref : false,
								});
								break;
							case "MFUN":
								functions += new ExtObject({
									$type : params[0],
									$thisObj : params[1],
									$name : params[2],
									$min : params[3].toNumber(),
									$max : params[4].toNumber(),
									$doc : commentBlock,
									$isStatic : false,
									$ref : false,
								});
								break;
							case "INIT":
								initCalls += new ExtObject({
									$callId : params[0],
									$type : params[1],
									$call : void,
								});
								break;
							case "TYPE":
								types += new ExtObject({
									$type : params[0],
									$kind : params[1],
									$ref : params[2].empty() ? void : params[2],
								});
								break;
						}
						commentBlock = [];
					}
				}
				
				var initFn = new ExtObject({
					$id : m.id,
					$inType : inType,
					$content : m,
					$scope : c.id,
					$consts : consts,
					$ctor : ctor,
					$functions : functions,
					$types : types,
					$initCalls : initCalls,
					$caller : void,
				});
				initFunctions[initFn.id] = initFn;
			}
		}
	}
	return true;
};

//----------------------

T.parseFile ::= fn(file, outJSON=false) {
	var reader = new XML.MicroXMLReader;
	static rootObj;
	var objStack = [];
	
	reader.enter = [objStack] => this->fn(stack, tag) {
		schema.pushType();
		var obj = schema.createFromSchema(tag.name, tag.attributes);
		stack.pushBack(obj);
		return true;
	};
	
	reader.data = [objStack] => this->fn(stack, tagname, data) {
		var obj = stack.back();
		obj += data;
		return true;
	};
	
	reader.leave = [objStack] => this->fn(stack, tagname) {
		var obj = stack.popBack();
		schema.popType();
		
		if(tagname == "memberdef")
			members[obj.id] = obj;
			
		if(stack.empty()) {
			rootObj = obj;
		} else {
			stack.back() += obj;
		}
		return true;
	};
	
	try {
		reader.parse(file);
	} catch(e) {
		Runtime.warn("Could not parse file '" + file + "': " + e);
		return false;
	}
	
	if(!rootObj.getType() == "doxygen")
		return false;
	
	var compound = rootObj.compounddef;
	switch(compound.kind) {
		case "namespace":
		case "class":
		case "struct":
			break;
		default:
			return false;
	}
	if(outJSON) {
		var filename = outJSON + "/" + compound.id + ".json";
		IO.saveTextFile(filename, objToJSON(compound));
	}
	compounds[compound.id] = compound;
	compound.shortname := compound.compoundname.split("::").back();
	if(!parseInitFunction(compound))
		return false;
	
	return compound;
};

//----------------------

T.setRefs ::= fn(refs) {
	this.apiRefs = refs;
};

return T;