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

IndexListBuilderVisitor.makeIndexEntry := fn(number, name, indent, htmlFile = void){
	var entry = "";
	
	if(htmlFile){
		if(this.createRelative)
			entry = "    "*indent + "* " + number + " [" + name + "](" + IndexBuilder.absoluteToRelativePath(htmlFile, this.currentDir, this.rootFolder) + ")";
		else
			entry = "    "*indent + "* " + number + " [" + name + "](" + htmlFile + ")";//for files
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
	
	this.indexList += this.makeIndexEntry(number, node.chapterName, indent, node.htmlPath;);
	
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

AddChapterIndexVisitor.makeIndexEntry := fn(number, name, indent, htmlFile = void, currentFile = void){
	var entry = "";
	
	if(htmlFile){
		if(this.createRelative)
			entry = "    "*indent + "* " + number + " [" + name + "](" + IndexBuilder.absoluteToRelativePath(htmlFile, currentFile, this.rootFolder) + ")";
		else
			entry = "    "*indent + "* " + number + " [" + name + "](" + htmlFile + ")";//for files
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
		
		var entry = makeIndexEntry(prefix, parent.chapterName, 0, parent.htmlPath);
		subIndexList += entry;
		
		foreach(parent.children as var child){
			number = prefix + ((prefix == "")?"":".") + child.chapterNumber;
			var entry = makeIndexEntry(number, child.chapterName, 1, child.htmlPath, node.markDownPath);
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


//---------------------------------------------------------------

static CloneTreeVisitor = new Type(Visitor);

CloneTreeVisitor._constructor := fn(toClone){
	this.rootNode := new ChapterTree(toClone.chapterName, toClone.chapterNumber, toClone.folderPath, toClone.markDownPath, toClone.htmlPath, toClone.isFolder);
};

CloneTreeVisitor.getInitData := fn(){
	return [this.rootNode];
};

CloneTreeVisitor.visit := fn(node, data){
	var parent = data[0];
	
	var clone = new ChapterTree(node.chapterName, node.chapterNumber, node.folderPath, node.markDownPath, node.htmlPath, node.isFolder);
	clone.originalNode := node;
	parent.addChild(clone);
	
	return[clone];
};
IndexBuilder.CloneTreeVisitor ::= CloneTreeVisitor;

//----------------------------------------------------------------

static BuildUiTreeVisitor = new Type(Visitor);

BuildUiTreeVisitor._constructor := fn(markNode){
	this.itemList := [];
	this.markedItemIndex := -1;
	this.toMark := markNode;
};

BuildUiTreeVisitor.getInitData := fn(){
	return ["", 0];
};

BuildUiTreeVisitor.visit := fn(node, data){
	if(!data || !node || data.size()!=2)
		return;

	var prefix = data[0];
	var indent = data[1];
	var number = prefix + ((prefix == "") ? "" : ".") + node.chapterNumber;
	var item = ("  " * indent) + number + " " + node.chapterName;
	var entry = [node, item];
	this.itemList += entry;
	
	if(this.toMark && node == this.toMark)
		this.markedItemIndex = itemList.size()-1;
		
	return [number, indent + 1];
};
IndexBuilder.BuildUiTreeVisitor ::= BuildUiTreeVisitor;

//---------------------------------------------------------------

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

static CollectChangedNodesVisitor = new Type(Visitor);

CollectChangedNodesVisitor._constructor := fn(){
	this.collectedNodes := [];
	this.newTutorials := [];
};

CollectChangedNodesVisitor.visit := fn(node, data){

	if(node.isNewTutorial)
		this.newTutorials += node;
	else{
		var wasChanged = false;
		
		if(node.chapterName != node.originalNode.chapterName)
			wasChanged = true;

		if(new Number(node.chapterNumber) != new Number(node.originalNode.chapterNumber))
			wasChanged = true;

		if(node.folderPath != node.originalNode.folderPath)
			wasChanged = true;

		if(node.markDownPath != node.originalNode.markDownPath)
			wasChanged = true;
		
		if(wasChanged)
			this.collectedNodes += node;
	}

	return[];
};

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

ChapterTree.correctPathes := fn(){
	//we evaluate parents path
	//extract last part of url
	//remove the number
	//add the new number

	if(this.isRoot())
		return;

	//For all nodes we need to adapt the folder path only
	var ending = this.folderPath.substr(this.folderPath.rFind("/")+1, this.folderPath.length());
	ending = IndexBuilder.removeNumber(ending);
	ending = ending.replaceAll(" ", "_");
	var basePath = this.parent.folderPath;
		
	this.folderPath = basePath + (basePath.endsWith("/") ? "" : "/") + this.chapterNumber + "_" + ending;
	
	if(this.isFolder){
		//Only leaf nodes have html/md path
		//The md file has to be included in the folder directly
		if(this.isLeaf()){
			var mdFile = this.markDownPath.substr(this.markDownPath.rFind("/")+1, this.markDownPath.length());
			this.markDownPath = this.folderPath + (this.folderPath.endsWith("/") ? "" : "/") + mdFile;
			this.htmlPath = this.markDownPath.replace(".md", ".html");
		}
	}else{
		//otherwise we have a markdown file
		//we need to change all three, where it should hold folderpath == markDown path
		this.markDownPath = this.folderPath;
		this.htmlPath = this.folderPath.replace(".md", ".html");
	}
};

ChapterTree.correctSubTreePathes := fn(){
	var stack = [this];

	while(!stack.empty()){
		var node = stack.popFront();
		node.correctPathes();
		
		if(!node.isLeaf())
			foreach(node.children as var child)
				stack.pushBack(child);
	}
};

//Creates tutorial by name, either markdown file only or folder to add resources
//Inserts new tutorial after this node or as First Child of this node depending on
//node is leaf or not 
ChapterTree.createNewTutorial := fn(name, markDownFileOnly){
	if(this.isRoot())
		return this;
	
	var chapterNum = void;
	var idx = this.parent.indexOfChild(this);
	var node = void;
	
	if(this.isFolder && !this.markDownPath){
		node = this;
		
		if(!node.children || node.children.size() == 0)
			chapterNum = 1;
		else
			chapterNum = new Number(node.children[0].chapterNumber);
		
		if(node.children){
			for(var i = 0; i < node.children.size(); i++){
				node.children[i].chapterNumber = new Number(node.children[i].chapterNumber) + 1;
				node.children[i].correctSubTreePathes();
			}
		}
	}
	else{
		node = this.parent;	
		//if this node is last node, no problem just add after it
		//else we have to shift, new tut gets number of successor
		if(node.children.size()-1 == idx){
			chapterNum = new Number(this.chapterNumber) + 1;
		}
		else{
			chapterNum = node.children[idx+1].chapterNumber;
			for(var i = idx+1; i < node.children.size(); i++){
				node.children[i].chapterNumber = new Number(node.children[i].chapterNumber) + 1;
				node.children[i].correctSubTreePathes();
			}
		}
	}
	
	var basePath = node.folderPath + (node.folderPath.endsWith("/") ? "" : "/") + chapterNum + "_" + name;
	basePath = basePath.replaceAll(" ", "_");
	
	var md = void;
	var html = void;
	
	if(markDownFileOnly){
		md = basePath + ".md";
		html = basePath + ".html";
		basePath = md;
	}
	else{
		md = basePath + "/" + name + ".md";
		html = basePath + "/" + name + ".html";
		
		md = md.replaceAll(" ", "_");
		html = html.replaceAll(" ", "_");
	}
	
	var newTut = new ChapterTree(name, chapterNum, basePath, md, html, !markDownFileOnly);
	newTut.isNewTutorial = true;
	node.addChild(newTut);
	
	return newTut;
};


ChapterTree.addNewFolder := fn(name){
	if(this.isRoot())
		return this;
	
	var chapterNum = void;
	var idx = this.parent.indexOfChild(this);
	var node = void;
	
	if(this.isFolder && !this.markDownPath){
		node = this;
		
		if(!node.children || node.children.size() == 0)
			chapterNum = 1;
		else
			chapterNum = new Number(node.children[0].chapterNumber);
		
		if(node.children){
			for(var i = 0; i < node.children.size(); i++){
				node.children[i].chapterNumber = new Number(node.children[i].chapterNumber) + 1;
				node.children[i].correctSubTreePathes();
			}
		}
	}
	else{
		node = this.parent;	
		//if this node is last node, no problem just add after it
		//else we have to shift, new tut gets number of successor
		if(node.children.size()-1 == idx){
			chapterNum = new Number(this.chapterNumber) + 1;
		}
		else{
			chapterNum = node.children[idx+1].chapterNumber;
			for(var i = idx+1; i < node.children.size(); i++){
				node.children[i].chapterNumber = new Number(node.children[i].chapterNumber) + 1;
				node.children[i].correctSubTreePathes();
			}
		}
	}
	
	var basePath = node.folderPath + (node.folderPath.endsWith("/") ? "" : "/") + chapterNum + "_" + name;
	basePath = basePath.replaceAll(" ", "_");
	
	var newTut = new ChapterTree(name, chapterNum, basePath, void, void, true);
	newTut.isNewTutorial = true;
	node.addChild(newTut);
	
	return newTut;
};

ChapterTree.changeName := fn(name){
	foreach(this.parent.children as var child) //ensure unique filename in same folder
		if(child.chapterName == name)
			return this;

	this.chapterName = name;
	var nameSpaceReplaced = name.replaceAll(" ", "_");
	
	var split = this.folderPath.split("/");
	this.folderPath = this.folderPath.replace(split[split.size()-1], nameSpaceReplaced);
	
	if(!this.isFolder)
		this.folderPath = this.folderPath + ".md";
	
	if(this.markDownPath){
		split = this.markDownPath.split("/");
		this.markDownPath = this.markDownPath.replace(split[split.size()-1], nameSpaceReplaced + ".md");
		split = this.htmlPath.split("/");
		this.htmlPath = this.htmlPath.replace(split[split.size()-1], nameSpaceReplaced + ".html");
	}
	
	return this;
};

ChapterTree.getChapterNumber := fn(){
	if(this.isRoot())
		return void;

	var number = "" + this.chapterNumber;
	var node = this.parent;
	
	while(!node.isRoot()){
		number = "" + node.chapterNumber + "." + number;
		node = node.parent;
	}
	
	return number;
};

ChapterTree.changeNumber := fn(newNumber){
	//1 validy check
	//2 insert chapter
	//first we need to find the root
	//than we follow the path of the new number
	//only the last subchapter of the number is allowed to not exist

	//Valid numbers:
	//do not start or end with a dot
	//the single chapters do not start with a zero
	//in the single chapters only numbers from 0 to 9 are allowed as chars
	var allowed = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
	if(newNumber.beginsWith(".") || newNumber.endsWith("."))
		return void;
	
	var split = newNumber.split(".");
	foreach(split as var num){
		if(num.beginsWith("0"))
			return void;
			
		for(var i = 0; i < num.length(); i++){
			var isValid = false;
			foreach(allowed as var c){
				if(num[i] == c)
					isValid = true;			
			}
			
			if(!isValid)
				return void;
		}
	}
	
	//2 insert
	var root = this;
	while(!root.isRoot())
		root = root.parent;
	
	var newParent = root;
	for(var i = 0; i < split.size()-1; i++){
		if(newParent.isLeaf()) //too few nodes to cover the number
			return void;
	
		var nextNode = void;
		foreach(newParent.children as var child){
			if(new Number(child.chapterNumber) == new Number(split[i])){
				nextNode = child;	
				break;
			}
		}
		
		if(!nextNode)//next node in search path could not be found
			return void;
		
		newParent = nextNode;
	}
	
	//we have to cope with last item of the number
	//first of all we can not insert into a leaf node, if it is a tutorial
	if(newParent.isLeaf() && !newParent.markDownPath)
		return void;
	
	if(newParent.isLeaf()){//empty folder that does not contain a tutorial
		this.chapterNumber = split[split.size()-1];
		newParent.addChild(this);
		return this;
	}
	
	var idx = 0;
	//check, whether chapter already exists
	for(idx = 0; idx < newParent.children.size(); idx++){
		if(new Number(newParent.children[idx].chapterNumber) == new Number(split[split.size()-1]))
			break;
	}
	
	if(idx < newParent.children.size()){
		for(var i = idx; i < newParent.children.size(); i++){
			newParent.children[i].chapterNumber = new Number(newParent.children[i].chapterNumber) + 1; 
			newParent.children[i].correctSubTreePathes();
		}
	}
	
	this.chapterNumber = split[split.size()-1];
	this.parent.removeChild(this);
	newParent.addChild(this);
	this.correctSubTreePathes();
	
	return this;
};

ChapterTree.shiftNodeDown := fn(){
	if(parent.children[parent.children.size()-1] == this){
		if(this.parent.isRoot())//we can not go further down than last child of the root node
			return this;
		
		//last child, we need to insert the node on parents level
		//inbetween the parent and the parents successor
		//-> find successor, give this node its number
		//and shift all by one, than insert the node and
		//correct subtrees pathes for node and all predecessors
		var idx = this.parent.parent.indexOfChild(this.parent);
		var chapterNum = void;
		
		if(this.parent.parent.children.size()-1 == idx){
			chapterNum = new Number(this.parent.chapterNumber) + 1;
		}
		else{
			var successor = this.parent.parent.children[idx+1];
			chapterNum = successor.chapterNumber;
		
			//shift all up
			for(var i = idx+1; i < this.parent.parent.children.size(); i++){
				this.parent.parent.children[i].chapterNumber = new Number(this.parent.parent.children[i].chapterNumber) + 1;
				this.parent.parent.children[i].correctSubTreePathes();
			}
		}
		
		//since we are last child, nothing to do for parents children
		this.parent.removeChild(this);
		this.chapterNumber = chapterNum;
		this.parent.parent.addChild(this);
		this.correctSubTreePathes();
	}
	else{
		//every other node
		var idx = this.parent.indexOfChild(this);
		var successor = this.parent.children[idx+1];
		
		if(successor.isLeaf()){
			//leaf level, but not last child
			//simply swap node and adapt path for node and successor
			var tempNum = successor.chapterNumber;
			successor.chapterNumber = this.chapterNumber;
			this.chapterNumber = tempNum;
			
			this.parent.children[idx] = successor; 
			this.parent.children[idx].correctSubTreePathes();
			this.parent.children[idx+1] = this; 
			this.parent.children[idx+1].correctSubTreePathes();
			
		}
		else{
			//other wise we have some higher level node, that is not last child
			//we need to insert the node in the successor subtree as first child
			for(var i = idx+1; i < this.parent.children.size(); i++){
				this.parent.children[i].chapterNumber = new Number(this.parent.children[i].chapterNumber) - 1;
				this.parent.children[i].correctSubTreePathes(); 
			}
			
			this.parent.removeChild(this);
			var chapterNum = successor.children[0].chapterNumber;
			
			for(var i = 0; i < successor.children.size(); i++){
				successor.children[i].chapterNumber = new Number(successor.children[i].chapterNumber) + 1;
				successor.children[i].correctSubTreePathes();
			}
			
			this.chapterNumber = chapterNum;
			successor.addChild(this);
			this.correctSubTreePathes();			
		}
	}
	
	return this;
};

ChapterTree.shiftNodeUp := fn(){
	//1 try to shift node within child nodes of parent
	//2 if not possible (e.g. first node in child list) shift node one level up and append before parent
	//maybe it is needed to go down in child list
	
	var parent = this.parent;
	
	if(parent.children[0] == this){
		//first child
		//we need to add before parent node and shift all nodes by one
		//important: do not push the node above root level
		if(parent.isRoot())
			return this;
		
		var idx = parent.parent.indexOfChild(parent);
		var parentsNumber = parent.chapterNumber;
		for(var i = idx; i < parent.parent.children.size(); i++){
			parent.parent.children[i].chapterNumber = new Number(parent.parent.children[i].chapterNumber) + 1;
			parent.parent.children[i].correctSubTreePathes();
		}
		
		for(var i = 1; i < parent.children.size(); i++){
			parent.children[i].chapterNumber = new Number(parent.children[i].chapterNumber) - 1;
			parent.children[i].correctSubTreePathes();
		}
		
		this.chapterNumber = parentsNumber;
		parent.parent.addChild(this);
		parent.removeChild(this);	
		this.correctSubTreePathes();
	}
	else{
		var idx = parent.indexOfChild(this);
		var predecessor = parent.children[idx-1];
		
		if(predecessor.isLeaf()){
			//simply switch both here
			var tempNum = predecessor.chapterNumber;
			predecessor.chapterNumber = this.chapterNumber;
			this.chapterNumber = tempNum;
			
			parent.children[idx] = predecessor;
			parent.children[idx].correctSubTreePathes();
			parent.children[idx-1] = this;
			parent.children[idx-1].correctSubTreePathes();
			
			//here we need also to adapt the pathes of all child nodes
		}
		else{
			//we need to fetch last node in predecessors subtree
			//therefore we take a path along the last child of every node
			//since the children lists are sorted by chapter number, this is sufficient 
			var lastChild = predecessor;
			while(!lastChild.isLeaf())
				lastChild = lastChild.children[lastChild.children.size()-1];
				
			this.chapterNumber = new Number(lastChild.chapterNumber) + 1;
			this.parent.removeChild(this);
			lastChild.parent.addChild(this);
			this.correctSubTreePathes();
		}
	}
	
	return this;
};

ChapterTree.copyResources := fn(srcFolder, destFolder, skipFile){
	if(!Util.isDir(srcFolder))
		return;
		
	var stack = [];
	var content = Util.dir(srcFolder, IO.DIR_BOTH);
	var skipMD = skipFile;
	var skipHTML = (skipFile)?skipFile.replace(".md", ".html"):void;
	
	foreach(content as var file){
		if(Util.isFile(file)){
			if(!(skipMD && file.endsWith(skipMD)) && !(skipHTML && file.endsWith(skipHTML)) 
			&& !(IndexBuilder.hasNumber(file) && (file.endsWith(".md") || file.endsWith(".html"))))
				stack += file;
		}
		else{
			if(!IndexBuilder.hasNumber(file))
				stack += file;
		}
	}
	
	while(!stack.empty()){
		var file = stack.popFront();
		
		if(Util.isFile(file)){
			if(!IndexBuilder.hasNumber(file)){
				Util.copyFile(file, file.replace(srcFolder, destFolder));
			}
		}
		else{
			if(!IndexBuilder.hasNumber(file)){
				content = Util.dir(file, IO.DIR_BOTH);
				Util.createDir(file.replace(srcFolder, destFolder));
				foreach(content as var f){
					if(!IndexBuilder.hasNumber(f))
						stack += f;
				}
			}
		}
	}
};

ChapterTree.storeToDisk := fn(){
	//What we have to do:
	//1 Find changes
	//2 store changes in a temp folder
	//3 remove old files bottom to top, maybe recursive version, we have to check whether file exists
	//4 copy from temp folder to actual folder
	//5 remove temp folder
	//6 add new tutorials
	
	if(!this.isRoot())
		return; //we can only start from a root node
	
	var rootFolder = this.folderPath;
	var tempFolder = rootFolder + "/_temp_";
	
	var visitor = new CollectChangedNodesVisitor();
	visitor.doTraversal(this);
	var changedNodes = visitor.collectedNodes;
	
	var stack = [];
	stack.append(changedNodes);
	
	if(!stack.empty()){
		Util.createDir(tempFolder);
	}
	
	while(!stack.empty()){
		var node = stack.popFront();
	
		var original = node.originalNode;
		var destFolder = node.folderPath.replace(rootFolder, "");
		
		var folders = destFolder.split("/");
		var path = tempFolder;
		foreach(folders as var folder){
			if(folder != "" && !folder.endsWith(".md")){
				path += (path.endsWith("/") ? "" : "/") + folder;
				
				if(!Util.isDir(path))
					Util.createDir(path);
			}
		}
		//to here we have created the folder path to our
		//how to go on depends on the actual node
		//if we have a structural folder only, we need to copy resource files/folders
		//if we have a md file only, we need to copy it and its html file
		//if we have a folder chapter we need to copy md/html and resources
		//html file may not exist
		
		if(node.isFolder && !node.markDownPath){ //inner folder
			if(!node.isNewTutorial){
				this.copyResources(original.folderPath, node.folderPath.replace(rootFolder, tempFolder), void);
			}
		}
		else if(node.isFolder){
			if(node.isNewTutorial){
				Util.saveFile(node.markDownPath, "");
			}
			else{
				Util.copyFile(original.markDownPath, node.markDownPath.replace(rootFolder, tempFolder));
				if(Util.isFile(original.htmlPath))
					Util.copyFile(original.htmlPath, node.htmlPath.replace(rootFolder, tempFolder));
					
				this.copyResources(original.folderPath, node.folderPath.replace(rootFolder, tempFolder), original.markDownPath);
			}
		}
		else{
			if(node.isNewTutorial){
				Util.saveFile(node.markDownPath, "");
			}
			else{
				Util.copyFile(original.markDownPath, node.markDownPath.replace(rootFolder, tempFolder));
				if(Util.isFile(original.htmlPath))
					Util.copyFile(original.htmlPath, node.htmlPath.replace(rootFolder, tempFolder));
			}
			
			if(!node.isLeaf()){
				foreach(node.children as var child){
					var containsOrProcessed = false;
					foreach(stack as var n){ // in stack?
						if(n == child)
							containsOrProcessed = true;
					}
					foreach(changedNodes as var n){ //processed before?
						if(n == child)
							containsOrProcessed = true;
					}
					if(!containsOrProcessed)
						stack += child; //adds the child nodes since they may be changed too.
				}
			}	
		}
	}
	
	//step 3: remove old files
	foreach(changedNodes as var node){
		if(node.isFolder && Util.isDir(node.originalNode.folderPath)){ //folder and still exists
			var rmpath = node.originalNode.folderPath;
			rmpath = rmpath.endsWith("/") ? rmpath : (rmpath+"/");
			Util.removeFile(rmpath, true); //remove the whole folder and content recursively
		}
		else if(!node.isFolder && Util.isFile(node.originalNode.markDownPath)){//remove simple projects
			Util.removeFile(node.originalNode.markDownPath); 

			if(Util.isFile(node.originalNode.htmlPath)){//if there is a html file also remove it
				Util.removeFile(node.originalNode.htmlPath);	
			}
		}//Otherwise the files may be removed recursively before
	}
	
	//step 4: copy the files from the temp folder into the tutorial folder
	//walk through the new path folder by folder, if any does not exist
	//start copying files recursively
	foreach(changedNodes as var node){
		var path = node.folderPath;
		path = path.replace(rootFolder, "");
		var folders = path.split("/");
		path = rootFolder;
		
		while(Util.isDir(path) && !folders.empty()){
			path += (path.endstWith("/") ? "" : "/") + folders.popFront();
		}
		
		//now path points to the first folder, which is not in the tutorials folder
		//this is the destination folder
		
		var srcPath = path.replace(rootFolder, tempFolder);
		//take everything from the source and copy it to the destination
		if(!node.isFolder && path.endsWith(".md")){ //only copy md and html file
			Util.copyFile(srcPath, path);
			if(Util.isFile(srcPath.replace(".md", ".html")))
				Util.copyFile(srcPath.replace(".md", ".html"), path.replace(".md", ".html"));
		}
		else{//recursive copy of everything
			var stack = [srcPath];
			while(!stack.empty()){
				var src = stack.popFront();
				var dst = src.replace(tempFolder, rootFolder);
				
				if(Util.isFile(src)){
					if(!Util.isFile(dst)){
						Util.copyFile(src, dst);
						if(src.endsWith(".md") && Util.isFile(src.replace(".md", ".html")))
							Util.copyFile(src.replace(".md", ".html"), dst.replace(".md", ".html"));
					}
				}
				else if(Util.isDir(src)){
					var content = Util.dir(src, IO.DIR_BOTH);
					
					stack.append(content);
					
					Util.createDir(dst);
				}
				else{
					outln("Warning could not finde file: " + src);
				}
			}
		}
	}
	
	//step 5: clean up by removing the temp folder
	if(Util.isDir(tempFolder))
		Util.removeFile(tempFolder + "/", true);
		
	//step 6: add new tutorials
	var newTutorials = visitor.newTutorials;
	foreach(newTutorials as var node){
		//prepare folder path
		var folder = node.folderPath;
		if(!node.isFolder)
			folder = node.markDownPath.substr(0,node.markDownPath.rFind("/")) + "/";
		
		Util.createDir(folder);
		
		//create markdown file if tutorial
		if(node.markDownPath)
			Util.saveFile(node.markDownPath, "");
		
	}
	
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

static rootFolder = Std.DataWrapper.createFromEntry( PADrend.configCache,'IndexBuilder.rootFolder', __DIR__ );
 
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
					if(root.folderPath != path) 
						outln("WARNING: parent node with path " + path + " could not be found!");
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
	else if(IO.isFile(currentNoRoot) || currentNoRoot.endsWith(".md") || currentNoRoot.endsWith(".html")){
		var split = currentNoRoot.split("/");
		currentNoRoot = split[0];
		for(var i = 1; i < split.size()-1; i++)
			currentNoRoot += "/" + split[i];
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
	"<link rel=\"stylesheet\" type=\"text/css\" href=\"main.css\"/>\n<div class = \"index\" \n# Tutorial Index\n";
	
	index = indexPrequel + index + "<\div>";

	if(index)
		IO.saveTextFile(rootNode.folderPath + "/index.md", index);
	
	var subIdxAddVisitor = new AddChapterIndexVisitor(createRelative, rootNode.folderPath);
	subIdxAddVisitor.doTraversal(rootNode);
};

return IndexBuilder;
