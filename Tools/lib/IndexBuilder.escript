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
 
static IndexBuilder = new Type();

static Visitor = new Type();
Visitor.visit := fn(node, data){return [];};
Visitor.getInitData := fn(){return [];};

Visitor.doTraversal := fn(rootNode){
	var data = this.getInitData();
	rootNode.traverse(this, data);
};

IndexBuilder._Visitor ::= Visitor;
//---------------------------------------------------------------

static PrintVisitor = new Type(Visitor);

PrintVisitor.getInitData := fn(){
	return [0, ""];
};

PrintVisitor.visit := fn(node, data){
	if(!data || data.size() != 2)
		return;
		
	var indent = data[0];
	var prefix = data[1];

	var space = "  " * indent;
	var entry = space + prefix + ((prefix == "")?"":".") + node.chapterNumber + " " + node.chapterName;
	outln(entry);
	
	return [indent + 1, prefix + ((prefix == "")?"":".") +  node.chapterNumber];
};

//---------------------------------------------------------------

static IndexListBuilderVisitor = new Type(Visitor);

IndexListBuilderVisitor._constructor := fn(createRelativePath = false, currentDir = void, rootFolder = void){
	this.createRelative := createRelativePath;
	this.currentDir := currentDir;
	this.rootFolder := rootFolder;
	
	this.indexList := [];
};

IndexListBuilderVisitor.getInitData := fn(){
	return [0, ""];
};

IndexListBuilderVisitor.makeIndexEntry := fn(number, name, indent, mdFile = void){
	var entry = "";
	
	if(mdFile){
		if(this.createRelative)
			entry = "    "*indent + "* " + number + " [" + name + "](" + IndexBuilder.absoluteToRelativePath(mdFile, this.currentDir, this.rootFolder) + ")";
		else
			entry = "    "*indent + "* " + number + " [" + name + "](" + mdFile + ")";//for files
	}
	else
		entry = "    "*indent + "* " + number + " " + name;//for folders
	
	return entry; 
};

IndexListBuilderVisitor.visit := fn(node, data){
	if(!data || data.size() != 2)
		return;
		
	var indent = data[0];
	var prefix = data[1];
	var number = prefix + ((prefix == "")?"":".") + node.chapterNumber;
	
	this.indexList += this.makeIndexEntry(number, node.chapterName, indent, node.markDownPath;);
	
	return [indent + 1, number];
};

//---------------------------------------------------------------

static AddChapterIndexVisitor = new Type(Visitor);

AddChapterIndexVisitor._constructor := fn(createRelativePath = false, rootFolder = void){
	this.createRelative := createRelativePath;
	this.rootFolder := rootFolder;
	
	this.startTag := "<!---BEGINN_INDEXSECTION--->";
	this.endTag := "<!---END_INDEXSECTION--->"; 
};

AddChapterIndexVisitor.getInitData := fn(){
	return [""];
};

AddChapterIndexVisitor.makeIndexEntry := fn(number, name, indent, mdFile = void, currentFile = void){
	var entry = "";
	
	if(mdFile){
		if(this.createRelative)
			entry = "    "*indent + "* " + number + " [" + name + "](" + IndexBuilder.absoluteToRelativePath(mdFile, currentFile, this.rootFolder) + ")";
		else
			entry = "    "*indent + "* " + number + " [" + name + "](" + mdFile + ")";//for files
	}
	else
		entry = "    "*indent + "* " + number + " " + name;//for folders
	
	return entry; 
};

AddChapterIndexVisitor.replaceOldIndex := fn(newIndex, file){
		var inDocument = "";
		var outDocument = "";
		
		var oldIndex = "";
		
		var skip = false;
		var accumulator = [];
		var linesBeforeOldIndex = [];
		var linesAfterOldIndex = [];
			
		try{
			inDocument = IO.loadTextFile(file);
		}catch(e){
			Runtime.warn("Could not load file" + file);
			return;
		}
		
		var lines = inDocument.split("\n");
		
		foreach(lines as var line){
			if(line.beginsWith(this.startTag)){
				skip = true;
				linesBeforeOldIndex = accumulator;
				accumulator = [];	
			}
			
			if(skip){
				oldIndex += line + "\n";
			}
			else{
				accumulator += line;
			}
			
			if(line.beginsWith(this.endTag))
				skip = false;
		}
		
		linesAfterOldIndex = accumulator;
		
		//do not change file if not changed
		if(oldIndex == newIndex)
			return;
			
		//TODO we may still need to find correct position for index here (if no previouse)
		if(oldIndex == ""){
			var i = 0;
			accumulator = [];
			var commentStartFound = false;
			var commentEndFound = false;
			var fileCorrupt = false;
			
			//in the beginning of a file there should be empty lines and a comment including the licence agreement
			for(i = 0; i < lines.size() && !fileCorrupt && !commentEndFound; i++){
				if(lines[i] != "" && !commentStartFound && !lines[i].contains("<!---"))
					fileCorrupt = true;
				else{
					if(lines[i].contains("<!---"))
						commentStartFound = true;
					if(lines[i].contains("--->"))
						commentEndFound = true;
					accumulator += lines[i];
				}	
			};
			
			if(!fileCorrupt){
				linesBeforeOldIndex = accumulator;
				accumulator = [];
				
				for(var j = i; j < lines.size(); j++)
					accumulator += lines[j];	
				
				linesAfterOldIndex = accumulator;
			}else{
				linesBeforeOldIndex = [];
				linesAfterOldIndex = lines;
			}
		}
			
		foreach(linesBeforeOldIndex as var line)
			outDocument += line + "\n";	
		
		outDocument += newIndex + "\n";
		
		foreach(linesAfterOldIndex as var line)
			outDocument += line + "\n";
			
		outDocument = outDocument.substr(0, outDocument.length() - 1);//remove last line break 
		
		IO.saveTextFile(file, outDocument);
};

AddChapterIndexVisitor.visit := fn(node, data){
	var prefix = data[0];
	var number = "";
	
	//tutorial node
	if(node.markDownPath){
		var subIndexList = [];
		
		var parent = node.parent;
		
		var entry = makeIndexEntry(prefix, parent.chapterName, 0, parent.markDownPath);
		subIndexList += entry;
		
		foreach(parent.children as var child){
			number = prefix + ((prefix == "")?"":".") + child.chapterNumber;
			var entry = void;
			if(node == child)
				entry = makeIndexEntry(number, "**" + child.chapterName + "**", 1);
			else
				entry = makeIndexEntry(number, child.chapterName, 1, child.markDownPath, node.markDownPath);
			subIndexList += entry;
		}
		
		var subIndex = this.startTag + "\n";
		subIndex += "<!---Automaticly generated section. Do not edit!!!--->\n";
		subIndex += "# Overview\n";
		
		foreach(subIndexList as var idxEntry){
			subIndex += idxEntry + "\n";
		}
		subIndex += this.endTag;
	
		this.replaceOldIndex(subIndex, node.markDownPath);
	}
	
	number = prefix + ((prefix == "")?"":".") + node.chapterNumber;
	
	return[number];
};

//----------------------------------------------------------------

static CollectLeafNodesVisitor = new Type(Visitor);

CollectLeafNodesVisitor._constructor := fn(){
	this.leafNodes := [];
};

CollectLeafNodesVisitor.visit := fn(node, data){
	if(node.isLeaf()){
		this.leafNodes += node;
	}
	return[];
};
IndexBuilder.CollectLeafNodesVisitor ::= CollectLeafNodesVisitor;

//---------------------------------------------------------------

static CollectHTMLFilesVisitor = new Type(Visitor);

CollectHTMLFilesVisitor._constructor := fn(){
	this.htmlFiles := [];
};

CollectHTMLFilesVisitor.visit := fn(node, data){
	if(node.htmlPath){
		this.htmlFiles += node.htmlPath;
	}
	return[];
};
IndexBuilder.CollectHTMLFilesVisitor ::= CollectHTMLFilesVisitor;

//---------------------------------------------------------------

static ChapterTree = new Type();
IndexBuilder._ChapterTree ::= ChapterTree;

ChapterTree._constructor := fn(name, number, path, mdPath, htmlPath, isFolder){
	this.chapterName := name;
	this.chapterNumber := number;
	
	this.folderPath := path;
	this.markDownPath := mdPath;
	this.htmlPath := htmlPath;
	
	this.isFolder := isFolder;
	this.parent := void;
	this.children := void;
	
	this.isNewTutorial := false;
};

ChapterTree.addChild := fn(ChapterTree node){
	if(!node)
		return;
		
	if(!this.children)
		this.children = [];
		
	this.children += node;
	this.children.sort(fn(a, b){
		return new Number(a.chapterNumber) <= new Number(b.chapterNumber);
	});
	
	node.parent = this;
};

ChapterTree.removeChild := fn(ChapterTree node){
	if(!this.children)
		return;
	
	this.children.removeValue(node);
	
	if(this.children.size() == 0)
		this.children = void;
};

ChapterTree.findNodeByPath := fn(path){
	if(!path)
		return void;

	//root node is only stub and does not contain any information;
	if(!this.isRoot() && this.folderPath == path)
		return this;
	
	if(!this.isLeaf()){
		foreach(this.children as var child){
			var node = child.findNodeByPath(path);
			if(node)
				return node;	
		}
	}
	
	return void;
};

ChapterTree.indexOfChild := fn(child){
	if(!child)
		return -1;
		
	foreach(children as var idx, var c)
		if(c == child)
			return idx;
	
	return -1;
};


ChapterTree.isRoot := fn(){
	return this.parent == void;
};

ChapterTree.isLeaf := fn(){
	return (this.children == null||this.children.size() == 0);
};

ChapterTree._traverse := fn(visitor, data){
	
	var newData = visitor.visit(this, data);

	if(!this.isLeaf()){
		foreach(this.children as var child)
			child._traverse(visitor, newData);
	}
};

//Here we skip the root node in the output
ChapterTree.traverse := fn(visitor, initData){
	if(!this.isLeaf())
		foreach(this.children as var child)
			child._traverse(visitor, initData);
};

ChapterTree.print := fn(){
	var printVisitor = new PrintVisitor;
	printVisitor.doTraversal(this);
};

ChapterTree.printNodeInfo := fn(){
	outln("Node Info:");
	outln("Chapter: " + this.chapterNumber + " " + this.chapterName);
	outln("Is a folder: " + this.isFolder);
	outln("Folder: " + this.folderPath);
	outln("Mark Down File: " + this.markDownPath);
	outln("HTML File: " + this.htmlPath + "\n");
};

//---------------------------------------------------------------------------------------------
//Index Builder

//TODO remove this
//static rootFolder = Std.DataWrapper.createFromEntry( PADrend.configCache,'IndexBuilder.rootFolder', __DIR__ );
 
IndexBuilder.extractNumber ::= fn(file){
	var numbers = ["0","1","2","3","4","5","6","7","8","9"];

	if(!file)
		return void;
	
	var split = file.split("_");
	if(split.size() <= 1)
		return void;
		
	var number = split[0];
	
	foreach(numbers as var num)
		if(number.beginsWith(num))
			return number;
	
	return void;
}; 

IndexBuilder.hasNumber ::= fn(str){
	var numbers = ["0","1","2","3","4","5","6","7","8","9"];
	
	if(str.endsWith("/"))
		str = str.substr(0, str.length()-1);
	
	var split = str.split("/"); 
	split = split[split.size()-1].split("_");
	
	foreach(numbers as var num){
		if(split[0].beginsWith(num)){
			return true;
		}	
	}
			
	return false;
};

IndexBuilder.removeNumber ::= fn(str){
	var numbers = ["0","1","2","3","4","5","6","7","8","9"];
	
	var split = str.split("_");
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

IndexBuilder.createNode ::= fn(file, root){
	var number = void;			
	var split = file.split("/");
	var fileName = split[split.size()-1];
	
	if(IO.isFile(file)){
		if(file.endsWith(".md")){
			number = extractNumber(fileName);
		
			var htmlFile = file.replace(".md", ".html");
			fileName = fileName.replace(".md", "");
			
			if(number){				
				var node = new ChapterTree(removeNumber(fileName).replaceAll("_", " "), number, file, file, htmlFile, false);
				return node;
			}
			else{	
				//find node and add info to it
				var path = "";
				for(var i = 0; i < split.size()-2; i++)
					path += split[i] + "/";
				path += split[split.size() - 2];
				
				var parent = root.findNodeByPath(path);
				if(!parent){
					//this is okay for the root node, since it does not have a parent
					//for each other node output a warning, since the tutorial structure may be corrupt
					if(root.folderPath != (path + "/")) 
						outln("WARNING: parent node with path " + path + " could not be found!" + root.folderPath);
					return void;
				}
				
				parent.markDownPath = file;
				parent.htmlPath = htmlFile;
				parent.chapterName = fileName.replaceAll("_", " ");
				
				return void;
			}
		}
	}
	else if(IO.isDir(file)){	
		number = extractNumber(fileName);
		if(number){	
			var node = new ChapterTree(removeNumber(fileName).replaceAll("_", " "), number, file, void, void, true);
			return node; 
		}					
	}
	
	return void;
};

IndexBuilder.recurseFolderDFSBuildTree ::= fn(file, parentNode, rootNode, recurseRootFiles){
 	//process currentFile, rootNode is needed for node search
 	var node = void;
 	if(!recurseRootFiles){
	 	if(!parentNode)
	 		return;

	 	node = createNode(file, rootNode);
	 	
	 	if(node)
	 		parentNode.addChild(node);
 	}
 	
 	//recurse in depth first order
 	if(IO.isDir(file)){
 		 var folderContent = IO.dir(file, IO.DIR_BOTH);
 		 
 		 foreach(folderContent as var f){
 		 	//this may create // delimiters in the path (e.g. if the roots path ends with a /)
 		 	//we need to remove this since we may get problems when converting to relative path
 		 	var file = f.replace("//", "/");
 		 	recurseFolderDFSBuildTree(file, (recurseRootFiles) ? rootNode : node, rootNode, false);
 		 }
 	}
};

IndexBuilder.absoluteToRelativePath ::= fn(absolute, currentDir, rootFolder){
	var absoluteNoRoot = absolute.replace(rootFolder.endsWith("/") ? rootFolder : rootFolder + "/", "");
	var currentNoRoot = currentDir;
	
	if(currentNoRoot.endsWith("/"))
		currentNoRoot = currentNoRoot.substr(0, currentNoRoot.length()-1);
	else{
		 if(IO.isFile(currentNoRoot) || currentNoRoot.endsWith(".md") || currentNoRoot.endsWith(".html")){
			var split = currentNoRoot.split("/");
			currentNoRoot = split[0];
			for(var i = 1; i < split.size()-1; i++)
				currentNoRoot += "/" + split[i];
		}
	}
	
	currentNoRoot = currentNoRoot.replace(rootFolder.endsWith("/") ? rootFolder.substr(0, rootFolder.length()-1) : rootFolder, "");
	
	var stepsUpCount = currentNoRoot.split("/").size()-1;
	
	if(stepsUpCount <= 0)
		return absoluteNoRoot;
	
	var relativePath = ("../" * stepsUpCount) + absoluteNoRoot;
	
	return relativePath;
};

IndexBuilder.createTree ::= fn(rootFolder){
	var rootNode = new ChapterTree("__ROOT__", -1, rootFolder, void, void, true);
	recurseFolderDFSBuildTree(rootFolder, rootNode, rootNode, true);
	return rootNode;
};

IndexBuilder.getIndex ::= fn(rootNode, createRelative = false, currentFolder = void){
	if(!rootNode)
		return null;
	
	if(createRelative && !currentFolder)
		currentFolder = rootNode.folderPath;
	
	var idxVisitor = new IndexListBuilderVisitor(createRelative, currentFolder, rootNode.folderPath);
	idxVisitor.doTraversal(rootNode);
	
	var indexDoc = "";
	foreach(idxVisitor.indexList as var entry){
		indexDoc += entry + "\n";
	}
	
	return indexDoc;
};

IndexBuilder.createAndSaveIndex ::= fn(rootNode, createRelative = false, currentFolder = void){
	var index = IndexBuilder.getIndex(rootNode, createRelative, currentFolder);	
	
	static indexPrequel = 
	"<link rel=\"stylesheet\" type=\"text/css\" href=\"main.css\"/>\n<div class = \"index\"\n>";
	

	var welcomeText = "";
	if(rootNode){
		var welcomeFile = rootNode.folderPath + "/welcome.txt";
		try{
			welcomeText = IO.loadTextFile(welcomeFile) + "\n";
		}
		catch(e){
			Runtime.warn("Could not find welcome file: " + welcomeFile +"\nThere will be no welcome section in the index file." );
		}
	}
	
	welcomeText += "\n# Tutorial Index\n";
	
	index = indexPrequel + welcomeText + index + "<\div>";

	if(index)
		IO.saveTextFile(rootNode.folderPath + "/index.md", index);
	
	//Add chapter index to markdown files
	var subIdxAddVisitor = new AddChapterIndexVisitor(createRelative, rootNode.folderPath);
	subIdxAddVisitor.doTraversal(rootNode);
};

return IndexBuilder;
