 /*
 * This file is part of the open source part of the
 * Platform for Algorithm Development and Rendering (PADrend).
 * Web page: http://www.padrend.de/
 * Copyright (C) 2016/2017 Florian Pieper <fpieper@mail.upb.de>
 * 
 * PADrend consists of an open source part and a proprietary part.
 * The open source part of PADrend is subject to the terms of the Mozilla
 * Public License, v. 2.0. You should have received a copy of the MPL along
 * with this library; see the file LICENSE. If not, you can obtain one at
 * http://mozilla.org/MPL/2.0/.
 */
 
static MarkDownTool = new Type();
 
static rootFolder = Std.DataWrapper.createFromEntry( PADrend.configCache,'MarkdownParser.rootFolder', __DIR__);
static parseToHTML = Std.DataWrapper.createFromEntry( PADrend.configCache, 'MarkdownParser.parseHTML', true);
static addMenuToHTML = Std.DataWrapper.createFromEntry( PADrend.configCache, 'MarkdownParser.addMenu', true);
static createIndexFile = Std.DataWrapper.createFromEntry( PADrend.configCache, 'MarkdownParser.createIndex', true);

MarkDownTool.createGUI := fn(){
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
			GUI.LABEL : "Create Index File",
			GUI.DATA_WRAPPER : createIndexFile
		},
		{GUI.TYPE : GUI.TYPE_NEXT_ROW	},
		{
			GUI.TYPE : GUI.TYPE_BOOL,
			GUI.LABEL : "Create HTML Files",
			GUI.DATA_WRAPPER : parseToHTML
		},
		{GUI.TYPE : GUI.TYPE_NEXT_ROW	},
		{
			GUI.TYPE : GUI.TYPE_BOOL,
			GUI.LABEL : "Add Menu to HTML Files",
			GUI.DATA_WRAPPER : addMenuToHTML
		},
		{GUI.TYPE : GUI.TYPE_NEXT_ROW	},
		{
		
			GUI.TYPE : GUI.TYPE_BUTTON,
			GUI.LABEL : "Parse Documents",
			GUI.TOOLTIP : "Parse Documents",
			GUI.ON_CLICK : fn(){
				if(createIndexFile()){
					static IndexBuilder = load(__DIR__ + "/IndexBuilder.escript");
					if(IndexBuilder){
						var indexTree = IndexBuilder.createTree(rootFolder());
						IndexBuilder.createAndSaveIndex(indexTree, true, rootFolder());
					}
					else
						outln("ERROR: Could not find IndexBuilder at " + __DIR__);
				}
				
				static CodeSectionParser = load(__DIR__ + "/CodeSectionParser.escript");
				if(CodeSectionParser)
					CodeSectionParser.recurseFolderAndParse(rootFolder(), parseToHTML());
				else
					outln("ERROR: Could not find CodeSectionParser at " + __DIR__);
			
				if(addMenuToHTML()){
					static MenuAdder = load(__DIR__ + "/MenuAdder.escript");
					if(MenuAdder)
						MenuAdder.recurseFiles(rootFolder());
					else
						outln("ERROR: Could not find MenuAdder at " + __DIR__);
				}
	
				outln("Parsing done");
			
			},
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

var tool = new MarkDownTool();
tool.createGUI();
