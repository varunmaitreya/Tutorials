 /*
 * This file is part of the open source part of the
 * Platform for Algorithm Development and Rendering (PADrend).
 * Web page: http://www.padrend.de/
 * Copyright (C) 2016 Florian Pieper <fpieper@mail.upb.de>
 * 
 * PADrend consists of an open source part and a proprietary part.
 * The open source part of PADrend is subject to the terms of the Mozilla
 * Public License, v. 2.0. You should have received a copy of the MPL along
 * with this library; see the file LICENSE. If not, you can obtain one at
 * http://mozilla.org/MPL/2.0/.
 */
 
 static codesectionBeginTag = "<!---BEGINN_CODESECTION--->";
 static codesectionEndTag = "<!---END_CODESECTION--->";
 static includeTag = "<!---INCLUDE";
 static	fileAttribute = "src=";
 static startLineAttribute = "start=";
 static	endLineAttribute = "end=";
 static endTag = "--->";
 
 static rootFolder = Std.DataWrapper.createFromEntry( PADrend.configCache,'MarkdownParser.rootFolder', __DIR__ );
 static parseToHTML = Std.DataWrapper.createFromEntry( PADrend.configCache, 'MarkdownParser.parseHTML', true);
 
 var plugin = new Plugin({
		Plugin.NAME : 'Markdown Parser',
		Plugin.DESCRIPTION : 'Converts Markdown to HTML and replaces code tags.',
		Plugin.VERSION : 0.1,
		Plugin.AUTHORS : "Florian Pieper",
		Plugin.OWNER : "All",
		Plugin.LICENSE : "Public Domain",
		Plugin.REQUIRES : ['PADrend/GUI']
});

Traits.addTrait(plugin,Util.ReloadablePluginTrait);

plugin.init := fn(){
	module.on('PADrend/gui', creatGUI);
	return true;
};

static creatGUI = fn(_gui){
	static gui = _gui;
	
	gui.register('PADrend_PluginsMenu.MarkdownParser',[
	{
		GUI.TYPE : GUI.TYPE_BUTTON,
		GUI.LABEL : "Markdown Parser",
		GUI.ON_CLICK : fn(){
			gui.openDialog({
				GUI.TYPE : GUI.TYPE_POPUP_DIALOG,
				GUI.LABEL : "Markdown Parser",
				GUI.SIZE : [400, 125],
				GUI.ACTIONS : [
					[ "Close",fn(){;}]
				],
				GUI.OPTIONS : 'MarkDownParserWindow'
			});
		}
	}
	]);
	
	static panel = gui.createPanel(400, 55, GUI.AUTO_LAYOUT);
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
			GUI.LABEL : "Create HTML Files",
			GUI.DATA_WRAPPER : parseToHTML
		},
		{GUI.TYPE : GUI.TYPE_NEXT_ROW	},
		{
		
			GUI.TYPE : GUI.TYPE_BUTTON,
			GUI.LABEL : "Parse Documents",
			GUI.TOOLTIP : "Parse Documents",
			GUI.ON_CLICK : fn(){	
				//parseDocument(__DIR__+"/test.md" );
				recurseFolderAndParse(rootFolder());
			},
			GUI.WIDTH : 355,
		}

	];
	
	gui.register('MarkDownParserWindow.file',[ 
		panel
	]);	
};

static removeWasteSpaces = fn(lines){
	var minSpaces = -1;
	var linesWOTabs = [];
	var returnText = "";

	foreach(lines as var line){
		var totalSpaces = 0;
		
		while(line.beginsWith("\t")||line.beginsWith(" ")){
			if(line.beginsWith("\t")){
				line = line.replace("\t", "");
				totalSpaces += 4;
			}
			
			if(line.beginsWith(" ")){
				line = line.replace(" ", "");
				totalSpaces++;
			}
		}
		
		if(minSpaces < 0)
			minSpaces = totalSpaces;
		else if(totalSpaces < minSpaces)
			minSpaces = totalSpaces;
		
		linesWOTabs +=  (" " * totalSpaces + line);
	}
	
	if(minSpaces < 0)
		minSpaces = 0;
		
	foreach(linesWOTabs as var line){
		//throwing away waste spaces and adding four spaces to indicate a codesection (MarkDown convention) 
		returnText += "    " + line.substr(minSpaces) +"\n"; 
	}
	
	return returnText;
};

static collectLinesFromSourceCodeFile = fn(file, start = 0, end = -1){	
	if(end == 0 || (end > 0 && start > end))
		return "";
		
	var readLines = codesectionBeginTag + "\n<!---Automaticly generated section. Do not edit!!!--->\n";

	var src = "";
	try{
		src = IO.loadTextFile(file);
	}catch(e){
		Runtime.warn("Could not load file" + file);
		return "";
	}
	
	var lines = src.split("\n");
	
	var firstLine = (start > 0) ? start - 1 : start;
	var lastLine = (end > 0) ? end - 1 : lines.size()-1;
	var lineList = [];
	
	if(lastLine >= lines.size()){
		outln("WARNING: Source file " + file + " has does not contain lines " + firstLine + " to " + lastLine);
		return "";
 	}
		
	for(var i = firstLine; i <= lastLine; i++){
		lineList += lines[i];
	}
	
	readLines += removeWasteSpaces(lineList);
	
	readLines += codesectionEndTag + "\n";
	return readLines;
};

static ParameterStruct = new Type();
ParameterStruct.srcFile := "";
ParameterStruct.startLine := 0;
ParameterStruct.endLine := -1;

static parseIncludeTag = fn(String line, lineNumber){
	line = line.replaceAll(" ", "");
	line = line.replaceAll("\t", "");
			
	var split = line.split(",");
	var parameterSet = new ParameterStruct();
			
	if(!split[0].beginsWith(includeTag))
		throw new Exception("Error in line " + (lineNumber) + ": Include tag could not be found");
	else{
		split[0] = split[0].replace(includeTag, "");//remove the include tag

		if(!split[0].beginsWith(fileAttribute))
			throw new Exception("Error in line " + (lineNumber) + ": File attribute could not be found or is corrupt");
		else{
			split[0] = split[0].replace(fileAttribute, "");

			if(split.size() == 1){//include the hole file
				parameterSet.srcFile = split[0].replace(endTag, "");
				parameterSet.srcFile = parameterSet.srcFile.trim();//somehow there is a strange empty character on the end of the string
								
				return parameterSet;
			}
			else 
				parameterSet.srcFile = split[0];
		}	
	}
			
	if(split.size() > 1 && (split[1].beginsWith(startLineAttribute) || split[1].beginsWith(endLineAttribute))){
		var startTagSet = false;
		if(split[1].beginsWith(startLineAttribute)){
			split[1] = split[1].replace(startLineAttribute, "");
			
			if(split.size() == 2)
				parameterSet.startLine = new Number(split[1].replace(endTag, ""));	
			else
				parameterSet.startLine = new Number(split[1]);
			
			startTagSet = true;
		}
		
		var endStr = (split.size() == 2) ? split[1] : split[2];
		if((split.size() == 3 && !endStr.beginsWith(endLineAttribute)) || 
			(split.size() == 2 && !endStr.beginsWith(endLineAttribute) && !startTagSet)){
			
			throw new Exception("Error in line " + (lineNumber) + ": Line attribute could not be found or is corrupt");
		}
		else if(!endStr.beginsWith(startLineAttribute)&&endStr.beginsWith(endLineAttribute)){
			endStr = endStr.replace(endLineAttribute, "");
			parameterSet.endLine = new Number(endStr.replace(endTag, ""));
		}
	}
	else
		throw new Exception("Error in line " + (lineNumber) + ": Line attribute could not be found or is corrupt");

	return parameterSet;
};

static parseDocument = fn(file){
	if(!file.endsWith(".md"))
		return;
	
	var inDocument = "";
	var outDocument = "";
	var folder = file.substr(0, file.rFind("/"));
	
	outln("Parsing " + file + "...");
	
	try{
		inDocument = IO.loadTextFile(file);
	}catch(e){
		Runtime.warn("Could not load file" + file);
		return;
	}
	
	var lines = inDocument.split("\n");
	var skipOldCode = false;
	var checkNextLineForOldCodeSection = false;
	var changeFound = false;
	var oldCode = "";
	var codeSection = "";
	var lineNumber = 0;
	
	foreach(lines as var line){
		lineNumber ++;
		
		if(line.contains(codesectionBeginTag)){
			skipOldCode = true;
			oldCode = "";
			checkNextLineForOldCodeSection = false;
		}else if(checkNextLineForOldCodeSection){
			outDocument += codeSection;
			changeFound = true;
			checkNextLineForOldCodeSection = false;
			codeSection = "";
		}
		
		if(!skipOldCode)
			outDocument += line + "\n";
		else
			oldCode += line + "\n";
		
		if(line.contains(includeTag)){
			checkNextLineForOldCodeSection = true;
			try{
				var includeTag = parseIncludeTag(line, lineNumber);
				
				if(!includeTag.srcFile.empty()){
					//src files have to be given relative to the markdown file
					codeSection = collectLinesFromSourceCodeFile(folder + "/" + includeTag.srcFile, includeTag.startLine, includeTag.endLine); 
				}else{
					codeSection = "";
				}
			}
			catch(e){
				outln(e);
			}
		}
		
		if(line.contains(codesectionEndTag)){
			
			if(codeSection != oldCode){
				changeFound = true;	
			}
			
			outDocument += codeSection;
				
			skipOldCode = false;	
		}
	}
	
	if(changeFound){
		outln("File "+ file + " has changed. Writing file...");
		try{
			IO.saveTextFile(file, outDocument);
		}catch(e){
			Runtime.warn("Could not load file" + file);
			return;
		}
	}else{
		outln("File "+ file + ":no changes found.");
	}
	
	
	if(!parseToHTML())
		return;
	
	static Parser = Std.module('MarkDownCodeParser/MarkdownParser');
	if(!Parser)
		return;
		
	var parser = new Parser();
	var html = parser.convertDocument(outDocument);
	var htmlFilePath = file.replace(".md", ".html");
	var oldHtml = void;
		
	try{
		oldHtml = IO.loadTextFile(htmlFilePath);
	}catch(e){
		oldHtml = "";
	}
	
	if(oldHtml != html && html != ""){
		try{
			IO.saveTextFile(htmlFilePath, html);
			outln("Wrote HTML file: " + htmlFilePath);
		}catch(e){
			Runtime.warn("Could not save html file" + htmlFilePath);
			return;
		}
	}
};

static recurseFolderAndParse = fn(root){

	var stack = [root];
	
	while(!stack.empty()){
		var currentFolder = stack.popFront();
		
		outln(currentFolder +", " + IO.isDir(currentFolder));
		
		if(IO.isDir(currentFolder)){
			var folderContent = IO.dir(currentFolder, IO.DIR_BOTH);
			foreach(folderContent as var file){
				if(IO.isFile(file)){
					if(file.endsWith(".md"))
						parseDocument(file);
				}
				else if(IO.isDir(file))
					stack.pushBack(file);
			} 
		}
	}
	outln("Parsing done");
};

return plugin;