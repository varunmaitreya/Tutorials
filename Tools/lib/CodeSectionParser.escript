 /*
 * This file is part of the open source part of the
 * Platform for Algorithm Development and Rendering (PADrend).
 * Web page: http://www.padrend.de/
 * Copyright (C) 2017 Florian Pieper <fpieper@mail.upb.de>
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
static fileAttribute = "src=";
static startLineAttribute = "start=";
static endLineAttribute = "end=";
static endTag = "--->";
 
static CodeSectionParser = new Type();

static ParameterStruct = new Type();
ParameterStruct.srcFile := "";
ParameterStruct.startLine := 0;
ParameterStruct.endLine := -1;

CodeSectionParser.removeWasteSpaces ::= fn(lines){
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

CodeSectionParser.collectLinesFromSourceCodeFile ::= fn(file, start = 0, end = -1){	
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

CodeSectionParser.parseIncludeTag ::= fn(String line, lineNumber){
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

CodeSectionParser.replaceMarkDownLinksByHTMLLinks ::= fn(document){
	var retDocument = "";
	var lines = document.split("\n");
	
	var findAll = fn(str, searchString){
		var ret = [];
	
		for(var i = 0; i < str.length(); i++)
			if(str.substr(i, searchString.length()) == searchString)
				ret += i;
		
		return ret;
	};
	
	foreach(lines as var line){
		//format:
		//[description](URL) => link
		//![description](URL) => image
		//find all ](
		//last opening bracket [ before ]( is the one belonging to it
		//if char before is ! => image, otherwise it is a link 
		
		var possibleLinks = findAll(line, "](");
		var possibleOpenings = findAll(line, "[");
		var lineCopy = new String(line);
		
		while(possibleLinks.size() > 0){
			var pl = possibleLinks.popFront();
			var pose = -1;
			var found = false;
			
			while(!possibleOpenings.empty() && possibleOpenings[0] < pl)
				pose = possibleOpenings.popFront();
			
			//not am image if: first element in line or char before not !
			if(pose == 0 || (pose > 0 && line.substr(pose-1, 1) != "!")){
				var urlStart = pl+2;
				var urlLength = 0;
				var i = urlStart;
				
				while(i < line.length() && line.substr(i,1) != ")"){
					i++;
					urlLength++;
				}
				
				if(urlStart +urlLength < line.length())
				{
					var linkTarget = line.substr(urlStart, urlLength);
					linkTarget = linkTarget.lTrim();
					var targetSplit = linkTarget.split(" ");
					var url = targetSplit[0];
				
					if(url.endsWith(".md") && !url.contains("://")){ //only replace local urls linking to MarkDown files
						var urlHTML = url.substr(0, url.length()-3);
						urlHTML += ".html";
						lineCopy = lineCopy.replaceAll(url, urlHTML);
					}
				}
			}
		}
		retDocument += lineCopy + "\n";	
	}
	
	
	return retDocument;
};

CodeSectionParser.parseDocument ::= fn(file, parseHTML){
	if(!file.endsWith(".md"))
		return;
	
	var inDocument = "";
	var outDocument = "";
	var folder = file.substr(0, file.rFind("/"));
	
	//outln("Parsing " + file + "...");
	
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
			if(codeSection != ""){
				outDocument += codeSection;
				changeFound = true;
			}
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
					if(codeSection == ""){
						outln("Warning: Code tag in file " + file + " at line " + lineNumber + " may be corrupt!");
					}
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
		if(outDocument[outDocument.length()-1]=="\n")//remove last line break. Otherwise they would accumulate
			outDocument = outDocument.substr(0, outDocument.length()-1); 
			
		outln("File "+ file + " has changed. Writing file...");
		try{
			IO.saveTextFile(file, outDocument);
		}catch(e){
			Runtime.warn("Could not load file" + file);
			return;
		}
	}
	/*else{
		outln("File "+ file + ":no changes found.");
	}*/
	
	
	if(!parseHTML)
		return;
	
	static Parser = load(__DIR__ + "/MarkdownParser.escript");
	if(!Parser){
		outln("Could not load MarkDownParser");
		return;
	}
	
	//replace all markdown links by html ones
	outDocument = replaceMarkDownLinksByHTMLLinks(outDocument);
	
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
		}catch(e){
			Runtime.warn("Could not save html file" + htmlFilePath);
			return;
		}
	}
};

CodeSectionParser.recurseFolderAndParse ::= fn(root, parseHTML){
	var stack = [root];
	
	while(!stack.empty()){
		var currentFolder = stack.popFront();
		
		if(IO.isDir(currentFolder)){
			var folderContent = IO.dir(currentFolder, IO.DIR_BOTH);
			foreach(folderContent as var file){
				if(IO.isFile(file)){
					if(file.endsWith(".md"))
						parseDocument(file, parseHTML);
				}
				else if(IO.isDir(file))
					stack.pushBack(file);
			} 
		}
	}
};

return CodeSectionParser;
