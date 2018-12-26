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

//----------------------

static assureAttr = fn(obj, name, def) {
  if(!obj.isSet(name))
    obj.setAttribute(name, def);
};

//----------------------

static assureArrayAttr = fn(obj, name) {
  if(!obj.isSet(name))
    obj.setAttribute(name, []);
  if(!obj.getAttribute(name).isA(Array))
    obj.setAttribute(name, [obj.getAttribute(name)]);
};

//----------------------

static Element = new Type(ExtObject);
Element._data := void;
Element._name := void;
Element._type := void;
Element._mixed := false;
Element._constructor ::= fn(name, attr=new Map) {
	this._data = [];
  this._name = name;
  foreach(attr as var key, var value) {
    this.setAttribute(key, value);
  }
};
Element._get ::= fn(Number key) { return _data[key]; };
Element._set ::= fn(Number key, value) { _data[key] = value; };
Element."+=" ::= fn(data) {
  if(_mixed || data.isA(String) || !data.isSet($_name) || !isSet(data._name)) {
    _data += data;
  } else if(this.getAttribute(data._name).isA(Array)) {
    this.getAttribute(data._name) += data;
  } else {
    this.setAttribute(data._name, data);
  }
};
Element.type ::= fn() { return _type; };
Element.name ::= fn() { return _name; };
Element.getIterator ::= fn() { return _data.getIterator(); };

//----------------------

static SchemaUtil = new Type;

SchemaUtil.types @(init) := Map;
SchemaUtil.root := void;
SchemaUtil.activeType := void;
SchemaUtil.stack @(init) := Array;

//----------------------

SchemaUtil.parseSchema ::= fn(file) {
  var reader = new XML.MicroXMLReader;
  
  root = new ExtObject({
    $name : "root",
    $attributes : new Map,
    $elements : new Map,
    $mixed : false,
  });
  activeType = root;
  stack.clear();
  stack.pushBack(root);
  static groups = new Map;
  
  reader.enter = this->fn(tag) {
    switch(tag.name) {
      case "xsd:choice":
        activeType.mixed = true;
        break;
      case "xsd:complexType":
      case "xsd:simpleType":
        stack.pushBack(activeType);
        activeType = new ExtObject(tag.attributes);
        activeType.attributes := new Map;
        activeType.elements := new Map;
        assureAttr(activeType, $mixed, false); 
        activeType.mixed = activeType.mixed == "true";
        types[activeType.name] = activeType;
        break;
      case "xsd:element":
        var elt = new ExtObject(tag.attributes);
        assureAttr(elt, $type, "xsd:string");
        elt.isArray := tag.attributes["maxOccurs"] ? true : false;
        activeType.elements[elt.name] = elt;
        break;
      case "xsd:attribute":
        var attr = new ExtObject(tag.attributes);
        assureAttr(attr, $type, "xsd:string");
        activeType.attributes[attr.name] = attr;
        break;
      case "xsd:group":
        stack.pushBack(activeType);
        var grp = new ExtObject(tag.attributes);
        if(grp.isSet($ref)) {
          var g = groups[grp.ref];
          if(!g) {
            outln("Unknown group: ", grp.ref);
            break;
          }
          activeType.attributes.merge(g.attributes);
          activeType.elements.merge(g.elements);     
          activeType.mixed |= g.mixed;
        } else {
          grp.attributes := new Map;
          grp.elements := new Map;
          grp.mixed := false;
          groups[grp.name] = grp;
          activeType = grp;
        }
        break;
      default:
        // ignore?
    }
    return true;
  };
  
  reader.leave = this->fn(tagname) {
    switch(tagname) {
      case "xsd:complexType":
      case "xsd:simpleType":
      case "xsd:group":
        activeType = stack.popBack();
        break;
      default:
        // ignore?
    }
    return true;
  };
  
  reader.parse(file);
  stack.clear();
};

//----------------------

SchemaUtil.pushType ::= fn() {
  stack.pushBack(activeType);
};

//----------------------

SchemaUtil.popType ::= fn() {
  activeType = stack.popBack();
};

//----------------------

SchemaUtil.createFromSchema ::= fn(name, attributes=new Map) {
  var obj = new Element(name, attributes);
  var attr = activeType.elements[name];
  if(attr && attr.isSet($type)) {
    //outln(name, " has type ", attr.type);
    //outln(objToJSON(activeType));
    obj._type = attr.type;
    var type = types[attr.type];
    if(type) {
      activeType = type;
      obj._mixed := type.mixed;
      foreach(type.attributes as var attr)
        assureAttr(obj, attr.name, void);
      
      if(!type.mixed) {
        foreach(type.elements as var elt) {
          if(elt.isArray)
            assureArrayAttr(obj, elt.name);
          else
            assureAttr(obj, elt.name, void);
        }
      }
    }
  } else {
    outln("Could not find attr ", name);
    outln(objToJSON(activeType));
  }
  return obj;
};

//----------------------

return SchemaUtil;