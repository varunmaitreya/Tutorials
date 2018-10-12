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

static CodeSectionParser = load(__DIR__ + "/lib/CodeSectionParser.escript");
if(!CodeSectionParser) {
  outln("ERROR: Could not find 'CodeSectionParser.escript' at " + __DIR__ + "/lib");
  return;
}

static parseFolder = fn(rootFolder, buildTOC, buildCodeSections) {
  if(!rootFolder || rootFolder.empty()) {
  	outln("ERROR: invalid root folder");
    return;
  }
  
  var files = collectMarkdownFiles(rootFolder);  
  var tocBuilder = new TOCBuilder;
	var codeSectionParser = new CodeSectionParser;
  
  outln("Parsing...");
  
  foreach(files as var file) {    
    if(buildTOC)
      tocBuilder.addToTOC(file);
			
		if(buildCodeSections)
			codeSectionParser.parseDocument(file);
  }
  
  if(buildTOC) {
		// ------------------
		// add static links
		tocBuilder.addEntry("EScript", "API Reference@99999", "API/EScript");
		tocBuilder.addEntry("Geometry", "API Reference@99999", "API/Geometry");
		tocBuilder.addEntry("GUI", "API Reference@99999", "API/GUI");
		tocBuilder.addEntry("MinSG", "API Reference@99999", "API/MinSG");
		tocBuilder.addEntry("Rendering", "API Reference@99999", "API/Rendering");
		tocBuilder.addEntry("Utils", "API Reference@99999", "API/Utils");
		// ------------------
		
    var toc = tocBuilder.buildTOC();
    var yaml = tocBuilder.toYAML(toc);
		IO.saveTextFile("./_data/sidebars/home_sidebar.yml", yaml);
  }
  	
  outln("done.");
};
  
static createGUI = fn(gui) {
  static rootFolder = Std.DataWrapper.createFromEntry( PADrend.configCache,'MarkdownParser.rootFolder', __DIR__);
  static buildTOC = Std.DataWrapper.createFromEntry( PADrend.configCache, 'MarkdownParser.buildTOC', true);
  static buildCodeSections = Std.DataWrapper.createFromEntry( PADrend.configCache, 'MarkdownParser.buildCodeSections', true);
  
	static panel = gui.createPanel(400, 100, GUI.AUTO_LAYOUT);
	panel.setMargin(0);

	panel += [
		{
			GUI.TYPE : GUI.TYPE_TEXT,
			GUI.LABEL : "Tutorial Folder:",
			GUI.DATA_WRAPPER : rootFolder,
			GUI.WIDTH : 300,
		},
		{
		
			GUI.TYPE : GUI.TYPE_BUTTON,
			GUI.LABEL : "...",
			GUI.TOOLTIP : "Choose Tutorial Root Folder",
			GUI.ON_CLICK : fn(){	
				gui.openDialog({
					GUI.TYPE :		GUI.TYPE_FOLDER_DIALOG,
					GUI.LABEL :		"Choose Root Folder",
					GUI.FILENAME : 	rootFolder(),
					GUI.ON_ACCEPT : [] => fn(folder){
						rootFolder(folder);
					}
				});
			},
			GUI.WIDTH : 50,
		},
		{GUI.TYPE : GUI.TYPE_NEXT_ROW	},
		{
			GUI.TYPE : GUI.TYPE_BOOL,
			GUI.LABEL : "Build TOC",
			GUI.DATA_WRAPPER : buildTOC
		},
		{GUI.TYPE : GUI.TYPE_NEXT_ROW	},
		{
			GUI.TYPE : GUI.TYPE_BOOL,
			GUI.LABEL : "Build code sections",
			GUI.DATA_WRAPPER : buildCodeSections
		},
		{GUI.TYPE : GUI.TYPE_NEXT_ROW	},
		{
		
			GUI.TYPE : GUI.TYPE_BUTTON,
			GUI.LABEL : "Parse Documents",
			GUI.TOOLTIP : "Parse Documents",
			GUI.ON_CLICK : [rootFolder(), buildTOC(), buildCodeSections()] => parseFolder,
			GUI.WIDTH : 355,
		}
	];
	
	gui.openDialog({
		GUI.TYPE : GUI.TYPE_POPUP_DIALOG,
		GUI.LABEL : "Markdown Parser",
		GUI.SIZE : [400, 175],
		GUI.ACTIONS : [
			[ "Close",fn(){;}]
		],
		GUI.OPTIONS : panel
	});	
};

if(GLOBALS.isSet($PADrend)) {
  Std.module.on('PADrend/gui', createGUI);
  return;
};

if(args.size() <= 2){ //std arguments, no file
	outln("\nToo few arguments. Enter --help for more information\n");
	return;
}

if(args.size() > 6){
	outln("\nToo many arguments. Enter --help for more information\n");
	return;
}

if(args[2] == "--help" || args[2] == "-h") {
	outln(
		"\n----MarkDownTool----\n\n"+
		"Usage: escript MarkDownTool.escript [options] folder\n\n"+
		"Options:\n"+
		"\t-t\tgenerate TOC for navigation\n" + 
		"\t-c\tupdate code sections\n" +
		"\t-h\tshow this information.\n" +
	);
  return;
}

var buildTOC = false;
var buildCodeSections = false;
var rootFolder = void;

for(var i = 2; i < args.size(); i++){
	if(args[i] == "-t")
		buildTOC = true;
	else if(args[i] == "-c")
		buildCodeSections = true;
	else if(IO.isDir(args[i]))
		rootFolder = args[i];
	else{
		outln("ERROR: Unkown argument " + args[i]);
		return;
	}
}

parseFolder(rootFolder, buildTOC, buildCodeSections);
