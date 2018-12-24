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

//----------------------

static objToJSON = fn(obj, var d=0) {
  if(!obj) {
    return "void";
  } else if(obj.isA(Number)) {
    return obj;
  } else if(obj.isA(String)) {
    return "\"" + obj + "\"";
  } else if(obj.isA(Array)) {
    var s = "[\n";
    foreach(obj as var v) {
      s += " " * (d+2) + thisFn(v, d+2) + ",\n";
    }
    s += " " * d + "]";
    return s;
  } else if(obj._getAttributes().empty()) {
    return obj;
  } 
  var s = "{\n";
  foreach(obj._getAttributes() as var n, var v) {
    s += " " * (d+2) + "\"" + n + "\": " + thisFn(v, d+2) + ",\n";
  }
  s += " " * d + "}";
  return s;
};

//----------------------

static mdLink = fn(link, name) {
  return "[" + name + "](" + link + ")";
};

//----------------------

static assureArrayAttr = fn(obj, name) {
  if(!obj.isSet(name))
    obj.setAttribute(name, []);
  if(!obj.getAttribute(name).isA(Array))
    obj.setAttribute(name, [obj.getAttribute(name)]);
};

//----------------------

static assureAttr = fn(obj, name, def) {
  if(!obj.isSet(name))
    obj.setAttribute(name, def);
};

//----------------------

static cleanupCompound = fn(c) {
  assureArrayAttr(c, $innernamespace);
  assureArrayAttr(c, $innerclass);
  assureArrayAttr(c, $basecompoundref);
  assureArrayAttr(c, $derivedcompoundref);
  assureArrayAttr(c, $includes);
  assureArrayAttr(c, $sectiondef);
  assureAttr(c, $parentNamespace, false);
  assureAttr(c, $briefdescription, "");
  assureAttr(c, $detaileddescription, "");
  assureAttr(c, $location, false);
  c.shortname := c.compoundname.split("::").back();
  return c;
};

//----------------------

T.compounds @(init) := Map;
T.namespaces @(init) := Map;
T.classes @(init) := Map;
T.structs @(init) := Map;
T.unions @(init) := Map;

//----------------------

T.parseFiles ::= fn(files) {  
  foreach(files as var file) {
    parseFile(file);
  }
  setupHierarchy();
};

//----------------------

T.parseFile ::= fn(file) {
  var json = false;
  try {
    json = IO.loadTextFile(file);
    json = parseJSON(json.replaceAll("@_",""));
  } catch(e) {
    Runtime.warn("Could not parse file '" + file + "': " + e);
    return false;
  }
  if(!json.isA(Map) || !json['doxygen']) {
    Runtime.warn("Could not parse file '" + file + "'.");
    return false;
  }
  
  var obj = buildObjTree(json["doxygen"]);
  if(!obj)
    return false;
    
  var compound = cleanupCompound(obj.compounddef);
  
  if(compound.kind == 'namespace')
    namespaces[compound.id] = compound;
  else if(compound.kind == 'class')
    classes[compound.id] = compound;
  else if(compound.kind == 'struct')
    structs[compound.id] = compound;
  else if(compound.kind == 'union')
    unions[compound.id] = compound;
  else
    return false;
    
  compounds[compound.id] = compound;
  return compound;
};

//----------------------

T.buildObjTree ::= fn(json) {
  if(json.isA(Map)) {
    var tmp = new Map;
    foreach(json as var name, var value) {
      if(name.beginsWith("#"))
        name = name.substr(1);        
      tmp[name] = thisFn(value);
    }
    return new ExtObject(tmp);
  } else if(json.isA(Array)) {
    var tmp = [];
    foreach(json as var value) {
      tmp += thisFn(value);
    }
    return tmp;
  } else {
    return json;
  }
};

//----------------------

T.setupHierarchy ::= fn() {
  foreach(namespaces as var id, var ns) {
    foreach(ns.innernamespace as var e) {
      e.ref := compounds[e.refid];
      if(e.ref)
        e.ref.parentNamespace = ns;
    }
    foreach(ns.innerclass as var e) {
      e.ref := compounds[e.refid];
      if(e.ref)
        e.ref.parentNamespace = ns;
    }
  }
  foreach(classes as var id, var c) {
    foreach(c.innerclass as var e) {
      e.ref := compounds[e.refid];
      if(e.ref)
        e.ref.parentNamespace = c;
    }
  }
};

//----------------------

T.writeDescription ::= fn(obj) {
  var s = "";
  if(obj.isA(String)) {
    s = obj;
  } else if(obj.isA(Array)) {
    foreach(obj as var o)
      s += writeDescription(o) + "\n";
  } else if(obj.isSet($para)) {
    s += writeDescription(obj.para);
  }
  return s;
};

//----------------------

static sectionTitles = {
  "public-func" : "Public Functions",
  "public-static-func" : "Public Static Functions",
  "public-type" : "Public Types",
  "public-static-attrib" : "Public Static Attributes",
  "public-attrib" : "Public Attributes",
  "protected-func" : "Protected Functions",
  "protected-static-func" : "Protected Static Functions",
  "protected-type" : "Protected Types",
  "protected-static-attrib" : "Protected Static Attributes",
  "protected-attrib" : "Protected Attributes",
};

T.writeSection ::= fn(obj) {
  var title = sectionTitles[obj.kind];
  if(!title) {
    if(obj.kind == "user-defined")
      title = obj.header;
    else
      return false;
  }
  assureArrayAttr(obj, $memberdef);
  var s = "## " + title + "\n\n";
  foreach(obj.memberdef as var m) {
    assureAttr(m, $argsstring, "");
    assureAttr(m, $type, "");
    s += "### *" + m.type + "* **" + m.name + "** " + m.argsstring + "\n\n";
    s += writeDescription(m.detaileddescription);
    s += "\n";
  }
  
  return s;
};

//----------------------

T.writeCompound ::= fn(c) {
  if(c.compoundname.beginsWith("std"))
    return false;
  
  var top_ns = c;
  var breadcrumps = [];
  while(top_ns.parentNamespace) {
    top_ns = top_ns.parentNamespace;
    breadcrumps.pushFront(top_ns);
  }
  var header = {
    "title": "\"" + c.shortname + "\"",
    "permalink": c.id,
    "summary" : "\"" + writeDescription(c.briefdescription) + "\"",
    "author" : "Generated from Doxygen",
    "category" : "C++ API@9",
    "subcategory" : top_ns.compoundname,
    "show_in_toc" : c.kind == 'namespace' && (c == top_ns || c.parentNamespace == top_ns),
  };
  
  if(c == top_ns)
    header["order"] = 0;
  
  var content = "---\n";
  foreach(header as var key, var value) {
    content += key + ": " + value + "\n";
  }
  content += "---\n";
  
  if(c.location) {
    content += "<sub>Defined in header `<" + c.location.file + ">`</sub>\n \n";
  }
  
  foreach(breadcrumps as var ns) {
    content += mdLink(ns.id,ns.shortname) + "::";
  }
  content += mdLink(c.id,c.shortname) + "\n\n";
    
  content += writeDescription(c.detaileddescription);
  
  if(!c.innernamespace.empty()) {
    content += "\n## Namespaces\n\n";
    foreach(c.innernamespace as var nsref) {
      var ns = nsref.ref;
      var descr = writeDescription(ns.briefdescription).trim();
      content += "* " + mdLink(ns.id, ns.compoundname) + "  \n";
      if(!descr.empty())
        content += "  " + descr + "\n";
    }
  }
  
  if(!c.innerclass.empty()) {
    content += "\n## Classes\n\n";
    foreach(c.innerclass as var cref) {
      if(cref.isSet($ref)) {
        var cl = cref.ref;
        var descr = writeDescription(cl.briefdescription).trim();
        content += "* " + mdLink(cl.id, cl.compoundname) + "  \n";
        if(!descr.empty())
          content += "  " + descr + "\n";
      } else {
        content += "* " + cref.text + "\n";
      }
    }
  }
  
  foreach(c.sectiondef as var s) {
    var sec = writeSection(s);
    if(sec) {
      content += sec + "\n\n";
    }
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
      IO.saveTextFile(path + id + ".md", md);
  }
};

//----------------------

return T;