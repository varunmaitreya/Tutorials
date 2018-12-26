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

static SchemaUtil = load(__DIR__ + "/SchemaUtil.escript");

//----------------------

static mdLink = fn(link, name) {
  return "[" + name + "](" + link + ")";
};

//----------------------

static quoted = fn(s) {
  return "\"" + s + "\"";
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

static toMarkdown = fn(element, name) {
  var s = '';
  if(element.isA(String)) {
    s = element;
  } else if(element.isA(Array)) {
    foreach(element as var value)
      s += toMarkdown(value, name);
  } else {    
    // opening the element
    switch (name) {
      case 'ref': return s + element.text;
      case 'emphasis': s = '*'; break;
      case 'bold': s = '**'; break;
      case 'parametername':
      case 'computeroutput': s = '`'; break;
      case 'parameterlist':
        if (element.kind == 'exception') {
          s = '\n#### Exceptions\n';
        } else {
          s = '\n#### Parameters\n';
        }
        break;
      case 'parameteritem': s = '* '; break;
      case 'programlisting': s = '\n```cpp\n'; break;
      case 'itemizedlist': s = '\n\n'; break;
      case 'listitem': s = '* '; break;
      case 'sp': s = ' '; break;
      case 'heading': s = '## '; break;
      case 'xrefsect': s += '\n> '; break;
      case 'simplesect':
        if (element.kind == 'attention') {
          s = '> ';
        } else if (element.kind == 'return') {
          s = '\n#### Returns\n';
        } else if (element.kind == 'see') {
          s = '\n**See also**: ';
        } else {
          Runtime.warn(element.kind + ' not supported.');
        }
        break;
      case 'formula':
        s = element.text;
        if (s.beginsWith('$') && s.endsWith('$')) return s;
        if (s.startsWith('\\[') && s.endsWith('\\]'))
          s = s.substring(2, s.length() - 2).trim();
        return '\n$$\n' + s + '\n$$\n';

      case 'xreftitle':
      case 'entry':
      case 'row':
      case 'ulink':
      case 'codeline':
      case 'highlight':
      case 'table':
      case 'para':
      case 'parameterdescription':
      case 'parameternamelist':
      case 'xrefdescription':
      case 'verbatim':
      case 'hruler':
      break;

      default:
        Runtime.warn(element.name + ' not supported.');
    }

    // recurse on children elements
    foreach(element._getAttributes() as var key, var attr)
      s += toMarkdown(attr, key);
    /*if (element.$$) {
    s += toMarkdown(element.$$, context);
    }*/

    // closing the element
    switch (name) {
      case 'parameterlist':
      case 'para': s += '\n\n'; break;
      case 'emphasis': s += '*'; break;
      case 'bold': s += '**'; break;
      case 'parameteritem': s += '\n'; break;
      case "computeroutput": s += '`'; break;
      case 'parametername': s += '` '; break;
      case 'entry': s = s + '|'; break;
      case 'programlisting': s += '```\n'; break;
      case 'codeline': s += '\n'; break;
      case 'ulink': s = mdLink(element.url, s); break;
      case 'itemizedlist': s += '\n'; break;
      case 'listitem': s += '\n'; break;
      case 'entry': s = ' | '; break;
      case 'xreftitle': s += ': '; break;
      case 'row':
        s = '\n' + s;
        /*if (element.$$ && element.$$[0].$.thead == "yes") {
        element.$$.forEach(function (th, i) {
        s += (i ? ' | ' : '\n') + '---------';
        });
        }*/
      break;
    }

      
  }
  return s;
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

T.schema @(init) := SchemaUtil;

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

T.parseFile ::= fn(file) {
  var reader = new XML.MicroXMLReader;
  static rootObj;
  var objStack = [];
  
  reader.enter = [objStack] => this->fn(stack, tag) {
    var parentObj = stack.empty() ? void : stack.back();
    schema.pushType();
    var obj = schema.createFromSchema(tag.name, tag.attributes);
    if(parentObj)
      parentObj += obj;
    else
      rootObj = obj;
    stack.pushBack(obj);
    return true;
  };
  
  reader.data = [objStack] => this->fn(stack, tagname, data) {
    var obj = stack.back();
    obj += data;
    return true;
  };
  
  reader.leave = [objStack] => this->fn(stack, tagname) {
    stack.popBack();
    schema.popType();
    return true;
  };
  
  try {
    reader.parse(file);
  } catch(e) {
    Runtime.warn("Could not parse file '" + file + "': " + e);
    return false;
  }
  
  if(!rootObj.type() == "doxygen")
    return false;
  
  var compound = rootObj.compounddef;
  switch(compound.kind) {
    case "namespace":
      namespaces[compound.id] = compound; break;
    case "class":
      classes[compound.id] = compound; break;
    case "struct":
      structs[compound.id] = compound; break;
    case "union":
      unions[compound.id] = compound; break;
    default:
      return false;
  }
  compounds[compound.id] = compound;
  IO.saveTextFile(file.replaceAll("xml","json"), objToJSON(compound));
  return compound;
};

//----------------------

T.updateHierarchy ::= fn() {
  /*foreach(namespaces as var id, var ns) {
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
  }*/
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
    assureAttr(m, $definition, "");
    
    s += "### ";
    /*if(!m.type.isA(String)) {
      s += "*" + mdLink(m.type.ref.refid, m.type.ref.text) + "* ";
      //s += toMarkdown(m.type);
    } else if(!m.type.empty()) {
      s += "*" + m.type + "* ";
    }
    s += "**" + m.name + "** " + m.argsstring + "{#" + m.name + "}" + "\n\n";*/
    s += m.definition + m.argsstring + "\n\n";
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
  var sec_ns = false;
  var breadcrumbs = [];
  while(top_ns.parentNamespace) {
    sec_ns = top_ns;
    top_ns = top_ns.parentNamespace;
    breadcrumbs.pushFront(top_ns.shortname + ":" + top_ns.id);
  }
  var show_in_toc = c.kind == 'namespace';// && (c == top_ns || c.parentNamespace == top_ns || c.parentNamespace == sec_ns);
  var header = {
    "title" : quoted(c.shortname),
    "permalink" : c.id,
    "summary" : quoted(writeDescription(c.briefdescription)),
    "author" : "Generated from Doxygen",
    "category" : quoted(top_ns.shortname),
    "show_in_toc" : show_in_toc,
    "sidebar" : "api_sidebar",
    "layout" : "api",
    "api_type" : c.kind,
    "breadcrumbs" : quoted(breadcrumbs.implode("|")),
  };
  
  if(sec_ns)
    header["subcategory"] = quoted(sec_ns.shortname);
    
  if(c == top_ns)
    header["order"] = 0;
  
  if(c.location)
    header["api_location"] = quoted(c.location.file);
  
  var content = "---\n";
  foreach(header as var key, var value) {
    content += key + ": " + value + "\n";
  }
  content += "---\n";
    
  /*foreach(breadcrumbs as var ns) {
    content += mdLink(ns.id,ns.shortname) + "::";
  }
  content += mdLink(c.id,c.shortname) + "\n\n";*/
    
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
  updateHierarchy();
  /*foreach(compounds as var id, var c) {
    var md = writeCompound(c);
    if(md)
      IO.saveTextFile(path + id + ".md", md);
  }*/
};

//----------------------

return T;