 static codesectionBeginTag = "<!---BEGINN_CODESECTION--->";
 static codesectionEndTag = "<!---END_CODESECTION--->";
 static includeTag = "<!---INCLUDE";
 static	fileAttribute = "src=";
 static startLineAttribute = "start=";
 static	endLineAttribute = "end=";
 static endTag = "--->";
 
 static rootFolder = Std.DataWrapper.createFromEntry( PADrend.configCache,'MarkdownParser.rootFolder', __DIR__ );
 
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
	
	
	static panel = gui.createPanel(400, 50, GUI.AUTO_LAYOUT);
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
		
	for(var i = firstLine; i <= lastLine; i++){
		readLines += "    " + lines[i] + "\n"; //four spaces indent at the begin of each line, so that the text is noticed as code section by Markdown
	}
	
	readLines += codesectionEndTag + "\n";
	return readLines;
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
	
	foreach(lines as var line){
		if(line.contains(codesectionBeginTag))
			skipOldCode = true;
			
		if(!skipOldCode)
			outDocument += line +"\n";
		
		if(line.contains(includeTag)){
			line = line.replaceAll(" ", "");
			line = line.replaceAll("\t", "");
			
			var split = line.split(",");
			var srcFile = "";
			var startLine = 0;
			var endLine = -1;
			
			if(!split[0].beginsWith(includeTag))
				outln("Error in line " + (outDocument.size() + 1) + ": Include tag could not be found");
			else{
				split[0] = split[0].replace(includeTag, "");//remove the include tag

				if(!split[0].beginsWith(fileAttribute))
					outln("Error in line " + (outDocument.size() + 1) + ": File attribute could not be found or is corrupt");
				else{
					split[0] = split[0].replace(fileAttribute, "");

					if(split.size() == 1){//include the hole file
						srcFile = split[0].replace(endTag, "");
						srcFile = srcFile.trim();//somehow there is a strange empty character on the end of the string
					}
					else 
						srcFile = split[0];
				}	
			}
			
			if(split.size() > 1 && (split[1].beginsWith(startLineAttribute) || split[1].beginsWith(endLineAttribute))){
				if(split[1].beginsWith(startLineAttribute)){
					split[1] = split[1].replace(startLineAttribute, "");
					
					if(split.size() == 2)
						startLine = new Number(split[1].replace(endTag, ""));	
					else
						startLine = new Number(split[1]);
				}
		
				var endStr = (split.size() == 2) ? split[1] : split[2];
				if((split.size() == 3 && !endStr.beginsWith(endLineAttribute)) || 
					(split.size() == 2 && !endStr.beginsWith(endLineAttribute) && !endStr.beginsWith(startLineAttribute)))
					outln("Error in line " + (outDocument.size() + 1) + ": Line attribute could not be found or is corrupt");
				else if(!endStr.beginsWith(startLineAttribute)){
					endStr = endStr.replace(endLineAttribute, "");
					endLine = new Number(endStr.replace(endTag, ""));
				}
			}
			else
				outln("Error in line " + (outDocument.size() + 1) + ": Line attribute could not be found or is corrupt");
			
			if(!srcFile.empty()){
				var codeSection = collectLinesFromSourceCodeFile(folder + "/" + srcFile, startLine, endLine); //src files have to be given relative to the markdown file
				outDocument += codeSection;
			}
		}
		
		if(line.contains(codesectionEndTag))
			skipOldCode = false;
	}
	
	try{
		IO.saveTextFile(file, outDocument);
	}catch(e){
		Runtime.warn("Could not load file" + file);
		return;
	}
	
	//TODO write to HTML file in the end
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