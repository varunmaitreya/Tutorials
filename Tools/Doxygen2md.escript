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
args.popFront(); // escript
args.popFront(); // Doxygen2md.escript

if(args.count() == 0) {
  outln("Usage: escript Doxygen2md.escript [options] <path/to/doxygen/xml>");
  return;
}

var outDir = "md";
var inDir = void;
while(!args.empty()) {
  var arg = args.popFront();
  if(arg.beginsWith("-")) {
    if(arg == "-o") {
      outDir = args.popFront();
    } else {
      outln("Unknown option: ", arg);
      return;
    }
  } else {
    inDir = arg;
  }
}

if(!IO.isDir(inDir)) {
  outln("invalid input dir: ", inDir);
  return;
}

static DoxygenParser = load(__DIR__ + "/lib/DoxygenConverter.escript");

var parser = new DoxygenParser;



var files = IO.dir(inDir, IO.DIR_FILES | IO.DIR_RECURSIVE);

// convert xml to json
out("Converting xml to json...");
foreach(files as var file) {
  if(!file.endsWith(".xml") || file.endsWith("index.xml") || file.endsWith("_8h.xml"))
    continue;
  system("xml2js -ns " + file + " > " + file.replaceAll("xml","json"));
}
outln("done");

// parse & collect compounds
out("Parsing compounds...");
files = IO.dir(inDir.replaceAll("xml","json"), IO.DIR_FILES | IO.DIR_RECURSIVE);
parser.parseFiles(files);
outln("done");

out("generating Markdown...");
parser.writeMarkdown(outDir);
outln("done");

return;