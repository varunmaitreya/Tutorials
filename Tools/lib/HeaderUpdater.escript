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

T.timestamps := void;

T.setTimestamps ::= fn(Map timestamps) {
  this.timestamps = timestamps;
};

T.update ::= fn(String file) {
  var fileContents;
  try{
    fileContents = IO.loadTextFile(file);
  }catch(e){
    Runtime.warn("HeaderUpdater: Could not load file '" + file + "'");
    return false;
  }
  
  var frontmatter = parseFrontmatter(fileContents);
  if(!frontmatter)
    return false;
  
  updateTimestamp(file, frontmatter);
  
  var modifiedContents = updateFrontmatter(fileContents, frontmatter);
  
  if(!modifiedContents) {
    outln("HeaderUpdater: Failed to update header.");
    return false;
  }
  
  try{
    IO.saveTextFile(file, modifiedContents);
  }catch(e){
    Runtime.warn("HeaderUpdater: Could not write file '" + file + "'");
    return false;
  }
  
  return true;
};

T.parseFrontmatter @(private) ::= fn(String input) {
  if(!input.beginsWith("---"))
    return false;
  
  var start = 4;
  var end = input.find("---", start);
  if(!end) {
    outln("HeaderUpdater: missing final '---' in frontmatter.");
    return false;
  }
  
  var lines = input.substr(start, end-start).trim().split("\n");
  var frontmatter = new Map;
  // simple yaml parsing. Only supports "key: value" entries.
  foreach(lines as var line) {
    line = line.trim();
    if(line.empty() || !line.contains(":"))
      continue;
    [var key, var value] = line.split(":");
    frontmatter[key.trim()] = value.trim();
  }
  return frontmatter;
};

T.updateFrontmatter @(private) ::= fn(String input, Map frontmatter) {
  var start = 4;
  var end = input.find("---", start);
  var tail = input.substr(end+start);
  
  var header = "---\n";
  foreach(frontmatter as var key, var value) {
    header += key + ": " + value + "\n";
  }
  header += "---\n";
  
  return header + tail;
};

T.updateTimestamp @(private) ::= fn(String file, Map frontmatter) {
  if(!timestamps || !(var time=timestamps[file]))
    return;
  frontmatter["last_updated"] = time;
};

return T;