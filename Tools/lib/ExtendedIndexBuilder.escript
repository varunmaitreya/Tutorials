static IndexBuilder = load(__DIR__ + '/IndexBuilder.escript');
static ChapterTree = IndexBuilder._ChapterTree;
static Visitor = IndexBuilder._Visitor;

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

//---------------------------------------------------------------

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
		if(this.isLeaf() && this.markDownPath){
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
	var tempFolder = rootFolder + "/_temp_/";
	
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
			path += (path.endsWith("/") ? "" : "/") + folders.popFront();
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

return IndexBuilder;

