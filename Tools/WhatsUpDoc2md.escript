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
var refFile = false;
while(!args.empty()) {
	var arg = args.popFront().trim();
	if(arg.beginsWith("-")) {
		if(arg == "-o") {
			outDir = args.popFront();
		} else if(arg == "-ref") {
			refFile = args.popFront();
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

var refs = void;
if(refFile) {
	try {
		refs = parseJSON(IO.loadTextFile(refFile));
	} catch(e) {
		Runtime.warn("Could not read file '" + refFile + "': " + e);
		return false;
	}
}

static WUDConverter = load(__DIR__ + "/lib/WUDConverter.escript");
if(!WUDConverter) {
	outln("Failed to load WUDConverter.");
	return;
}

var parser = new WUDConverter;

if(refs)
	parser.setRefs(refs);

// parse JSON
out("Parsing JSON...");
var files = IO.dir(inDir, IO.DIR_FILES | IO.DIR_RECURSIVE);
foreach(files as var file) {
	if(!file.endsWith(".json"))
		continue;
	parser.parseFile(file);
}
outln("done");

out("generating Markdown...");
parser.writeMarkdown(outDir);
outln("done");

return;