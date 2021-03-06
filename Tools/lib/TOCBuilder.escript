/*
* This file is part of the open source part of the
* Platform for Algorithm Development and Rendering (PADrend).
* Web page: http://www.padrend.de/
* Copyright (C) 2018 Sascha Brandt <sascha@brandt.graphics>
* 
* PADrend consists of an open source part and a proprietary part.
* The open source part of PADrend is subject to the terms of the Mozilla
* Public License, v. 2.0. You should have received a copy of the MPL along
* with this library; see the file LICENSE. If not, you can obtain one at
* http://mozilla.org/MPL/2.0/.
*/
static T = new Type;

T.entries @(init) := Array;

T.addToTOC ::= fn(String file) {
	var fileContents;
	try{
		fileContents = IO.loadTextFile(file);
	}catch(e){
		Runtime.warn("TOCBuilder: Could not load file '" + file + "'");
		return false;
	}
	var frontmatter = parseFrontmatter(fileContents);
	if(!frontmatter)
		return false;
	
	frontmatter["file"] = file;
	entries += new ExtObject(frontmatter);
	return true;
};

T.addEntry ::= fn(title, category, link, subcategory=void, order=void, published=void) {
	var entry = new ExtObject({
			$title : title,
			$category : category,
			$permalink : link
	});
	if(subcategory)
		entry.subcategory := subcategory;
	if(order)
		entry.order := order;
	if(published!=void)
		entry.published := published;
	entries += entry;
};

T.parseFrontmatter @(private) ::= fn(String input) {
	if(!input.beginsWith("---"))
		return false;
	
	var start = 4;
	var end = input.find("---", start);
	if(!end) {
		outln("TOCBuilder: missing final '---' in frontmatter.");
		return false;
	}
	
	var lines = input.substr(start, end-start).trim().split("\n");
	var frontmatter = new Map;
	// simple yaml parsing. Only supports "key: value" entries.
	foreach(lines as var line) {
		line = line.trim();
		var splitPos = line.find(":");
		if(!splitPos)
			continue;
		var key = line.substr(0, splitPos);
		var value = line.substr(splitPos+1);
		frontmatter[key.trim()] = value.trim();
	}
	return frontmatter;
};

T.checkFields @(private) ::= fn(entry) {
	// required fields
	foreach([$title, $permalink, $category] as var field) {
		if(!entry.isSet(field)) {
			outln("WARNING: missing required field '", field ,"' in frontmatter of file '", entry.file, "'");
			return false;
		}
	}
	// update optional fields	
	if(!entry.isSet($entries))
		entry.entries := [];
	if(entry.isSet($order))
		entry.order = entry.order.toNumber();
	else
		entry.order := 10000;
	if(!entry.isSet($subcategory))
		entry.subcategory := void;
	if(!entry.isSet($published))
		entry.published := true;
	else
		entry.published := entry.published.toLower() == "true";
	if(!entry.isSet($show_in_toc))
		entry.show_in_toc := true;
	else
		entry.show_in_toc := entry.show_in_toc.toLower() == "true";
	if(!entry.isSet($sidebar))
		entry.sidebar := "home_sidebar";
	return true;
};

T.buildTOC ::= fn(sidebar="home_sidebar") {
	var toc = [];
	var categories = new Map;
	var subcategories = new Map;
	
	foreach(entries as var entry) {
		if(!checkFields(entry))
			continue;
		
		if(!entry.published || !entry.show_in_toc)
			continue;
			
		if(entry.sidebar != sidebar)
			continue;
		
		var catOrder = 10000;
		var category = entry.category;
		if(category.contains("@")) {
			[category, catOrder] = category.split("@");
			catOrder = catOrder.toNumber();
		}
	
		var subCatOrder = 10000;
		var subcategory = entry.subcategory;
		if(subcategory && subcategory.contains("@")) {
			[subcategory, subCatOrder] = subcategory.split("@");
			subCatOrder = subCatOrder.toNumber();
		}
				
		var catEntry = categories[category];
		if(!catEntry) {
			catEntry = new ExtObject({
				$title : category,
				$order : catOrder,
				$entries : [],
				$permalink : void,
			});
			categories[category] = catEntry;
			toc += catEntry;
		}
		catEntry.order = [catEntry.order, catOrder].min();
		
		if(subcategory) {
			var subCatEntry = subcategories[category+subcategory];
			if(!subCatEntry) {
				subCatEntry = new ExtObject({
					$title : subcategory,
					$order : subCatOrder,
					$entries : [],
					$permalink : void,
				});
				subcategories[category+subcategory] = subCatEntry;
				catEntry.entries += subCatEntry;
			}
			subCatEntry.order = [subCatEntry.order, subCatOrder].min();
			subCatEntry.entries += entry;
		} else {
			catEntry.entries += entry;
		}
	}
	
	toc.sort(fn(a,b) { return a.order < b.order || (a.order == b.order && a.title < b.title); });
	foreach(toc as var cat) {
		cat.entries.sort(fn(a,b) { return a.order < b.order || (a.order == b.order && a.title < b.title); });
		if(cat.entries.front().title == cat.title)
			cat.entries.front().title = '"<b>Overview</b>"';
		foreach(cat.entries as var entry) {
			if(entry.entries.count() > 0) {
				entry.entries.sort(fn(a,b) { return a.order < b.order || (a.order == b.order && a.title < b.title); });
				if(entry.entries.count() == 1) {
					entry.permalink = entry.entries.front().permalink;
					entry.entries.clear();
				} else if(entry.entries.front().title == entry.title) {
					entry.entries.front().title = '"<b>Overview</b>"';
				}
			}
		}
	}
	
	return toc;
};

T.toYAML ::= fn(toc, product="PADrend Tutorials") {
	var yaml = "entries:\n- product: " + product + "\n  levels: one\n  folders:\n";
	foreach(toc as var cat) {
		yaml += "  - title: " + cat.title + "\n";
		yaml += "    output: web\n";
		yaml += "    folderitems:\n";
		foreach(cat.entries as var subcat) {
			yaml += "    - title: " + subcat.title + "\n";
			yaml += "      output: web\n";
			if(subcat.entries.count() > 0) {
				yaml += "      subfolderitems:\n";
				foreach(subcat.entries as var entry) {
					yaml += "      - title: " + entry.title + "\n";
					yaml += "        output: web\n";
					yaml += "        url: /" + entry.permalink + "\n";
				}
			} else {
				yaml += "      url: /" + subcat.permalink + "\n";
			}
		}
	}
	return yaml;
};


return T;