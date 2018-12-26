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
GLOBALS.objToJSON := fn(obj, var d=0) {
  if(obj === void) {
    return "void";
  } else if(obj.isA(Number)) {
    return obj;
  } else if(obj.isA(String)) {
    return "\"" + obj + "\"";
  } else if(obj.isA(Array)) {
    if(obj.empty())
      return "[ ]";
    var s = "[\n";
    foreach(obj as var v) {
      s += " " * (d+2) + thisFn(v, d+2) + ",\n";
    }
    s += " " * d + "]";
    return s;
  } else if(obj.isA(Map)) {
    if(obj.empty())
      return "{ }";
    var s = "{\n";
    foreach(obj as var n, var v) {
      s += " " * (d+2) + "\"" + n + "\": " + thisFn(v, d+2) + ",\n";
    }
    s += " " * d + "}";
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