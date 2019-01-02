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

if(!loadLibrary("libE_XML"))
	return false;
load(__DIR__ + "/lib/Utils.escript");

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
if(!DoxygenParser) {
	outln("Failed to load DoxygenConverter.");
	return;
}

var parser = new DoxygenParser;

var compounds = [
	"namespace",
	"class",
	"struct",
	"union",
];

// parse XML
out("Parsing XML...");
parser.initSchema(inDir + "/compound.xsd");
var files = IO.dir(inDir, IO.DIR_FILES | IO.DIR_RECURSIVE);
foreach(files as var file) {
	if(!file.endsWith(".xml"))
		continue;
	var fileName = file.split("/").back().split("\\").back().replace(".xml","");
	var valid = false;
	foreach(compounds as var c) {
		if(fileName.beginsWith(c))
			valid = true;
	}
	if(!valid)
		continue;
	parser.parseFile(file);
}
outln("done");

out("generating Markdown...");
parser.writeMarkdown(outDir);
outln("done");

return;