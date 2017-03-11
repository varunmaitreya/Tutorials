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
 
static rootFolder = Std.DataWrapper.createFromEntry( PADrend.configCache,'IndexBuilder.rootFolder', __DIR__ );
 
static extractNumber = fn(file){
	var numbers = ["0","1","2","3","4","5","6","7","8","9"];

	if(!file)
		return void;
		
	var split = file.split(" ");
	if(split.size() <= 1)
		return void;
		
	var number = split[0];
	
	foreach(numbers as var num)
		if(number.beginsWith(num))
			return number;
	
	return void;
}; 

static removeNumber = fn(str){
	var numbers = ["0","1","2","3","4","5","6","7","8","9"];
	
	var split = str.split(" ");

	if(split.size() <= 1)
		return str;
	
	foreach(numbers as var num){
		if(split[0].beginsWith(num)){
			var prefixRemoved = split[1];
			
			for(var i = 2; i < split.size(); i++){
				prefixRemoved += " " + split[i];
			}
			
			return prefixRemoved;	
		}	
	}
			
	return str;
};

static makeIndexEntry = fn(number, name, indent, htmlFile = void){
	var entry = "";
	
	if(htmlFile)
		entry = "    "*indent + "* " + number + " [" + name + "](" + htmlFile + ")";//for files
	else
		entry = "    "*indent + "* " + number + " " + name;//for folders
	
	return entry; 
};


static processFile = fn(file, rootFolder, prefix, indent, indexList, chapterList){
	var number = void;			
	var fileName = file.split("/");
	fileName = fileName[fileName.size()-1];
	
	if(IO.isFile(file)){
		if(file.endsWith(".md")){
			number = extractNumber(fileName);
		
			var htmlFile = file.replace(".md", ".html");
			htmlFile = htmlFile.replace(rootFolder, "");
			fileName = fileName.replace(".md", "");
			
			if(number){
				number = prefix + "." + number;
				var indexEntry = makeIndexEntry(number, removeNumber(fileName), indent, htmlFile);
				indexList += indexEntry;
				chapterList += number;
			}
			else{	
				//remove last entry from list and add new one
				number = prefix;
				if(number){
					var indexEntry = makeIndexEntry(number, fileName, indent-1, htmlFile);
					
					indexList.popBack();
					chapterList.popBack();
					indexList += indexEntry;
					chapterList += number;
				}
			}
		}
	}
	else if(IO.isDir(file)){	
		number = extractNumber(fileName);
		if(number){
			if(prefix){
				number = prefix + "." + number;
			}			
			
			var indexEntry = makeIndexEntry(number, removeNumber(fileName), indent);
			indexList += indexEntry;
			chapterList += number;
			indent++;
		}					
	}
	return [number, indent];
};

static recurseFolderDFS = fn(file, rootFolder, currentprefix, indent, indexList, chapterList){
 	//process currentFile
 	var currentData = processFile(file, rootFolder, currentprefix, indent, indexList, chapterList);
 	
 	//recurse in depth first order
 	if(IO.isDir(file)){
 		 var folderContent = IO.dir(file, IO.DIR_BOTH);
 		 var nextprefix = currentData[0];
 		 var nextIndent = currentData[1];
 		 if(!nextprefix)
 		 	nextprefix = currentprefix;
 		 
 		 foreach(folderContent as var f){
 		 	recurseFolderDFS(f, rootFolder, nextprefix, nextIndent, indexList, chapterList);
 		 }
 	}
};

static hasPrefix = fn(toCheck, prefix){
	if(toCheck.size() < prefix.size())
		return false;
	
	for(var i = 0; i < prefix.size(); i++){
		if(toCheck[i] != prefix[i])
			return false;
	}
	
	return true;
};

static getSmallest = fn(chapterList, level, currentPrefix){
	var smallestIndex = -1;

	for(var i = 0; i < chapterList.size(); i++){
		if(chapterList[i] && chapterList[i].size() == level && hasPrefix(chapterList[i], currentPrefix)){
			if(smallestIndex < 0 || chapterList[smallestIndex][level-1] > chapterList[i][level-1])
				smallestIndex = i;
		}
	}

	return smallestIndex;
};

static sortIndex = fn(indexList, chapterList){
	var level = 1;
	var prefix = [];
	var currentIndex = 0;
	
	var chapters = [];
	foreach(chapterList as var chapter){
		var split = chapter.split(".");
		var asNumber = [];
		
		foreach(split as var num)
			asNumber += new Number(num);
		
		chapters += asNumber;
	}
	
	while(level > 0){
		var i = getSmallest(chapters, level, prefix);
		
		if(i < 0){ //no element on level
			level --;
			
			if(!prefix.empty())
				prefix.popBack(); //remove last element from prefix
		}
		else{
			var temp = indexList[currentIndex];
			indexList [currentIndex] = indexList[i];
			indexList[i] = temp;
			
			prefix = chapters[i];
			chapters[i] = chapters[currentIndex];
			chapters[currentIndex] = void; 
		
			level++;
			currentIndex++;
		}
	}
};

static recurseFolder = fn(rootFolder){
	var indexList = [];
	var chapterList = [];
	
	recurseFolderDFS(rootFolder, rootFolder + "/", void, 0, indexList, chapterList);
	sortIndex(indexList, chapterList);
	
	var indexDoc = "";
	foreach(indexList as var entry){
		indexDoc += entry + "\n";
	}

	IO.saveTextFile(rootFolder+"/index.md", indexDoc);
};

static createDialog = fn(){
	var panel = gui.createPanel(450,60);
	
	panel += [{
		GUI.TYPE : GUI.TYPE_TEXT,
		GUI.DATA_WRAPPER : rootFolder
	},
	{
		GUI.TYPE : GUI.TYPE_BUTTON,
		GUI.LABEL : "...",
		GUI.ON_CLICK : fn(){
			gui.openDialog({
				GUI.TYPE :		GUI.TYPE_FOLDER_DIALOG,
				GUI.LABEL :		"Choose Root Folder",
				GUI.FILENAME : 	rootFolder(),
				GUI.ON_ACCEPT : fn(folder){
					rootFolder(folder);
				}
			});
		}
	}];
	
	var diag = gui.createDialog({
		GUI.TYPE : GUI.TYPE_POPUP_DIALOG,
		GUI.LABEL : "Index Builder",
		GUI.SIZE : [470, 130],
		GUI.CONTENTS : [panel],
		GUI.ACTIONS : [
			["Abort",fn(){;}],
			["Build...", fn(){
				if(rootFolder())
					recurseFolder(rootFolder());
			}]
		],
	});
	
	return diag;
};

var diag = createDialog();
diag.init();
