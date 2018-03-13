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

T.parseFrontmatter ::= fn(String filename, String input) {
  if(!input.beginsWith("---"))
    return;
  
  var start = 4;
  var end = input.find("---", start);
  if(!end) {
    outln("TOCBuilder: missing final '---' in frontmatter.");
    return;
  }
  
  var lines = input.substr(start, end-start).trim().split("\n");
  var frontmatter = new Map;
  frontmatter["file"] = filename;
  // simple yaml parsing. Only supports "key: value" entries.
  foreach(lines as var line) {
    line = line.trim();
    if(line.empty() || !line.contains(":"))
      continue;
    [var key, var value] = line.split(":");
    frontmatter[key.trim()] = value.trim();
  }  
  entries += new ExtObject(frontmatter);
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
  if(!entry.isSet($order))
    entry.order := 1e+50;
  if(!entry.isSet($subcategory))
    entry.subcategory := void;
  if(!entry.isSet($published))
    entry.published := true;
  else
    entry.published := entry.published.toLower() == "true";
  return true;
};

T.buildTOC ::= fn() {
  var toc = [];
  var categories = new Map;
  var subcategories = new Map;
  
  foreach(entries as var entry) {
    if(!checkFields(entry))
      continue;
    
    if(!entry.published)
      continue;
    
    var catOrder = 1e+50;
    var category = entry.category;
    if(category.contains("@")) {
      [category, catOrder] = category.split("@");
      catOrder = catOrder.toNumber();
    }
  
    var subCatOrder = 1e+50;
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
        $entries : []
      });
      categories[category] = catEntry;
      toc += catEntry;
    }
    catEntry.order = [catEntry.order, catOrder].min();
    
    if(subcategory) {
      var subCatEntry = subcategories[subcategory];
      if(!subCatEntry) {
        subCatEntry = new ExtObject({
          $title : subcategory,
          $order : subCatOrder,
          $entries : []
        });
        subcategories[subcategory] = subCatEntry;
        catEntry.entries += subCatEntry;
      }
      subCatEntry.order = [subCatEntry.order, subCatOrder].min();
      subCatEntry.entries += entry;
    } else {
      catEntry.entries += entry;
    }
  }
  toc.sort(fn(a,b) { return a.order < b.order; });
  foreach(toc as var cat) {
    cat.entries.sort(fn(a,b) { return a.order < b.order; });
    foreach(cat.entries as var entry) {
      if(entry.isSet($entries))
        entry.entries.sort(fn(a,b) { return a.order < b.order; });
    }
  }
  
  return toc;
};

T.toYAML ::= fn(toc) {
  var yaml = "entries:\n- product: PADrend Tutorials\n  levels: one\n  folders:\n";
  foreach(toc as var cat) {
    yaml += "  - title: " + cat.title + "\n";
    yaml += "    output: web\n";
    yaml += "    folderitems:\n";
    foreach(cat.entries as var subcat) {
      yaml += "    - title: " + subcat.title + "\n";
      yaml += "      output: web\n";
      if(subcat.isSet($entries)) {
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