 /*
 * This file is part of the open source part of the
 * Platform for Algorithm Development and Rendering (PADrend).
 * Web page: http://www.padrend.de/
 * Copyright (C) 2016-2017 Florian Pieper <fpieper@mail.upb.de>
 * Copyright (C) 2018 Sascha Brandt <sascha@brandt.graphics>
 * 
 * PADrend consists of an open source part and a proprietary part.
 * The open source part of PADrend is subject to the terms of the Mozilla
 * Public License, v. 2.0. You should have received a copy of the MPL along
 * with this library; see the file LICENSE. If not, you can obtain one at
 * http://mozilla.org/MPL/2.0/.
 */

static collectMarkdownFiles = fn(rootFolder) {
	var stack = [rootFolder];
  var result = [];
	
	while(!stack.empty()){
		var currentFolder = stack.popBack();
		
		if(IO.isDir(currentFolder)) {
			var folderContent = IO.dir(currentFolder, IO.DIR_BOTH);
			foreach(folderContent as var file){
				if(IO.isFile(file) && file.endsWith(".md")) {
          result += file;
				}
				else if(IO.isDir(file))
					stack.pushBack(file);
			}
		}
	}
  
  return result;
};

static TOCBuilder = load(__DIR__ + "/lib/TOCBuilder.escript");
if(!TOCBuilder) {
  outln("ERROR: Could not find 'BuildTOC.escript' at " + __DIR__ + "/lib");
  return;
}

static HeaderUpdater = load(__DIR__ + "/lib/HeaderUpdater.escript");
if(!HeaderUpdater) {
  outln("ERROR: Could not find 'HeaderUpdater.escript' at " + __DIR__ + "/lib");
  return;
}

static CodeSectionParser = load(__DIR__ + "/lib/CodeSectionParser.escript");
if(!CodeSectionParser) {
  outln("ERROR: Could not find 'CodeSectionParser.escript' at " + __DIR__ + "/lib");
  return;
}


if(args.size() <= 2){ //std arguments, no file
	outln("\nToo few arguments. Enter --help for more information\n");
	return;
}

if(args[2] == "--help" || args[2] == "-h") {
	outln(
		"\n----MarkDownTool----\n\n"+
		"Usage: escript MarkDownTool.escript [options] folder\n\n"+
		"Options:\n"+
		"\t-t\tgenerate TOC for navigation\n" + 
		"\t-o=<file>\tupdate file for toc (.yml)\n" +
		"\t-c\tupdate code sections\n" +
		"\t-h\tshow this information.\n" +
		"\t-s=<file>\tinput timestamp file (.json)\n" +
	);
  return;
}

var buildCodeSections = false;
var rootFolder = void;
var tocFile = void;
var timestampFile = void;
var product = "PADrend Tutorials";

args.popFront(); // escript
args.popFront(); // MarkDownTool.escript

while(!args.empty()) {
	var arg = args.popFront();
	if(arg == "-c")
		buildCodeSections = true;
	else if(arg == "-toc")
		tocFile = args.popFront();
	else if(arg == "-t")
		timestampFile = args.popFront();
	else if(arg == "-p")
		product = args.popFront();
	else if(IO.isDir(arg))
		rootFolder = arg;
	else{
		outln("ERROR: Unkown argument " + arg);
		return;
	}
}

if(!rootFolder || rootFolder.empty()) {
	outln("ERROR: invalid root folder");
  return;
}

var files = collectMarkdownFiles(rootFolder);  
var tocBuilder = new TOCBuilder;
var codeSectionParser = new CodeSectionParser;
var headerUpdater = new HeaderUpdater;

outln("Parsing...");

var timestamps = void;
var updateHeader = false;
if(timestampFile) {
	timestamps = parseJSON(IO.loadTextFile(timestampFile));
	headerUpdater.setTimestamps(timestamps);
	updateHeader = true;
}

foreach(files as var file) {
	if(updateHeader)
		headerUpdater.update(file);
	
  if(tocFile)
    tocBuilder.addToTOC(file);
		
	if(buildCodeSections)
		codeSectionParser.parseDocument(file);
}

if(tocFile) {
	var sidebar = tocFile.split("/").back().split("\\").back().replace(".yml","");
  var toc = tocBuilder.buildTOC(sidebar);
  var yaml = tocBuilder.toYAML(toc, product);
	IO.saveTextFile(tocFile, yaml);
}
	
outln("done.");
return;