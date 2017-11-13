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
 
static IndexTool = new Type();
static IndexBuilder = load(__DIR__ + '/lib/ExtendedIndexBuilder.escript');
static TutorialCreatorDialog = new Type();

TutorialCreatorDialog.createContent := fn(){
	var contentPanel = gui.createPanel(320, 65);

	var txtName = gui.create({
		GUI.TYPE : GUI.TYPE_TEXT,
		GUI.LABEL : (this.isFolder) ? "Folder Name" : "Tutorial Title",
    	GUI.POSITION : [GUI.POS_X_ABS|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP ,0,0],
    	GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, 0.8, 20],
    	GUI.DATA_WRAPPER : txtNameWrapper
    });

	contentPanel += txtName;

	if(!this.isFolder){
		this.markDownFileOnly := new Std.DataWrapper(false);

		var btnMarkDownOnly = gui.create({
			GUI.LABEL : "Create without a folder (MarkDown file only)",
			GUI.TYPE : GUI.TYPE_BOOL,
			GUI.DATA_WRAPPER:	this.markDownFileOnly,
			GUI.POSITION : [GUI.POS_X_ABS|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP ,0,0],
    		GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, 0.8, 20]
		});

		contentPanel += [{GUI.TYPE : GUI.TYPE_NEXT_ROW}];
		contentPanel += btnMarkDownOnly;
	}

	this.diag := gui.createDialog({
		GUI.TYPE : GUI.TYPE_POPUP_DIALOG,
		GUI.LABEL : (this.isFolder) ? "Enter Folder Name..." : "Enter Turorial Name...",
		GUI.SIZE : [350, 135],
		GUI.CONTENTS : [contentPanel],
		GUI.ACTIONS : [
			["Abort",fn(){;}],
			["Okay", [this] => fn(dialog){

				var data = [dialog.txtNameWrapper()];
				if(!dialog.isFolder)
					data += dialog.markDownFileOnly();

				dialog.onConfirm(data);
			}]
		],
	});
};

TutorialCreatorDialog.init := fn(folderSelectorOnly){
	this.isFolder := folderSelectorOnly;
	this.onConfirm := new Std.MultiProcedure();
	this.txtNameWrapper := new Std.DataWrapper("");

	this.createContent();
};

TutorialCreatorDialog.openDialog ::= fn(callBackFunction, isFolderDialog){
	var diag = new TutorialCreatorDialog();
	diag.init(isFolderDialog);
	diag.onConfirm += callBackFunction;
	diag.diag.init();
};

IndexTool.init := fn(){
	this.window := void;
	this.lstChapterList := void;
	this.currentEntry := void;

	this.createWindow();

	this.rootFolder := Std.DataWrapper.createFromEntry(PADrend.configCache,'IndexTool.rootFolder', __DIR__);
	this.rootFolder.onDataChanged += [this] => fn(indexTool, data){
		indexTool.rootDirChanged();
	};

	this.indexTree := void;
	this.indexTreeOriginal := void;

	this.rootDirChanged(); //load from datawrapper
};

IndexTool.rootDirChanged := fn(){
	if(!this.rootFolder() || this.rootFolder() == "" || !Util.isDir(this.rootFolder())){
		this.indexTreeOriginal = void;
		this.indexTree = void;
		this.updateListView();
		return;
	}

	this.indexTreeOriginal = IndexBuilder.createTree(this.rootFolder());

	var cloneBuilder = new IndexBuilder.CloneTreeVisitor(this.indexTreeOriginal);
	cloneBuilder.doTraversal(this.indexTreeOriginal);
	this.indexTree = cloneBuilder.rootNode;

	this.updateListView(void);
};

IndexTool.updateListView := fn(markNode){
	if(!this.indexTree){
		this.lstChapterList.clear();
		return;
	}

	var listVisitor = new IndexBuilder.BuildUiTreeVisitor(markNode);
	listVisitor.doTraversal(this.indexTree);

	var list = listVisitor.itemList;

	this.lstChapterList.clear();
	foreach(list as var i, var item)
		this.lstChapterList += item;
		
	var markedItemIdx = listVisitor.markedItemIndex;

	if(markedItemIdx >= 0){
		var itemList = this.lstChapterList.getContents()[0].getContentContainer().getContents();
		if(itemList.size() > markedItemIdx)
			this.lstChapterList.getContents()[0].setMarking(itemList[markedItemIdx]);
	}
};


IndexTool.createWindow := fn(){
	var relWidth = 0.95;
	static txtNameWrapper = new Std.DataWrapper("");
	static txtNumberWrapper = new Std.DataWrapper("");

	this.window = gui.createWindow(400,600, "Index Tool");
	this.window.setPosition(200,200);

	var contentPanel = gui.createPanel(400, 600);
	contentPanel.setExtLayout(
			GUI.POS_X_ABS|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
			GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP|
			GUI.WIDTH_ABS|GUI.HEIGHT_ABS,
			new Geometry.Vec2(0,0),new Geometry.Vec2(-1, -1)
    );

	var btnChooseRootFolder = gui.create({
	    GUI.TYPE : GUI.TYPE_BUTTON,
    	GUI.LABEL : "Choose Root Folder...",
    	GUI.POSITION : [GUI.POS_X_REL|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP , 0, 0],
    	GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, relWidth, 20],
    	GUI.ON_CLICK : [this] => fn(indexTool){
    		gui.openDialog({
				GUI.TYPE :		GUI.TYPE_FOLDER_DIALOG,
				GUI.LABEL :		"Choose Root Folder",
				GUI.FILENAME : 	!indexTool.rootFolder(),
				GUI.ON_ACCEPT : [indexTool] => fn(indexTool, folder){
					indexTool.rootFolder(folder);
				}
			});
    	}
    });

	this.lstChapterList = gui.create({
		GUI.TYPE : GUI.TYPE_LIST,
		GUI.WIDTH : 50,
		GUI.HEIGHT : 50,
		GUI.FLAGS : GUI.AT_MOST_ONE_MARKING,
		GUI.ON_DATA_CHANGED : [this] => fn(indexTool, data){
			indexTool.currentEntry = data[0];
			if(data[0]){
				txtNameWrapper(data[0].chapterName);
				txtNumberWrapper(data[0].getChapterNumber());
			}
		}
	});
    this.lstChapterList.setExtLayout(
    	GUI.POS_X_ABS|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
		GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP|
		GUI.WIDTH_REL|GUI.HEIGHT_REL,
		new Geometry.Vec2(20,0),new Geometry.Vec2(relWidth, 0.58)
	);

    var controllPanel = gui.createPanel(400, 600);
	controllPanel.setExtLayout(
			GUI.POS_X_ABS|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
			GUI.POS_Y_REL|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP|
			GUI.WIDTH_REL|GUI.HEIGHT_REL,
			new Geometry.Vec2(0,0.75),new Geometry.Vec2(relWidth, 0.33)
    );

    var btnUp = gui.create({
    	GUI.TYPE : GUI.TYPE_BUTTON,
    	GUI.LABEL : "<-",
    	GUI.POSITION : [GUI.POS_X_REL|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP , 0.75, 0],
    	GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, 0.1, 30],
    	GUI.ON_CLICK : [this] => fn(indexTool){
    		if(!indexTool.indexTree || !indexTool.currentEntry)
    			return;

    		var node = indexTool.currentEntry.shiftNodeUp();
    		indexTool.updateListView(node);
    	}
    });

    var btnDown = gui.create({
    	GUI.TYPE : GUI.TYPE_BUTTON,
    	GUI.LABEL : "->",
    	GUI.POSITION : [GUI.POS_X_REL|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP , 0.85, 0],
    	GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, 0.1, 30],
    	GUI.ON_CLICK : [this] => fn(indexTool){
    		if(!indexTool.indexTree || !indexTool.currentEntry)
    			return;

    		var node = indexTool.currentEntry.shiftNodeDown();
    		indexTool.updateListView(node);
    	}
    });

    controllPanel += btnUp;
    controllPanel += btnDown;
    controllPanel += [{GUI.TYPE : GUI.TYPE_NEXT_ROW}];

    var txtTitle = gui.create({
    	GUI.TYPE : GUI.TYPE_TEXT,
    	GUI.POSITION : [GUI.POS_X_ABS|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP ,0,0],
    	GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, 0.75, 30],
    	GUI.DATA_WRAPPER : txtNameWrapper
    });

    var btnChangeName = gui.create({
    	GUI.TYPE : GUI.TYPE_BUTTON,
    	GUI.LABEL : "Apply",
    	GUI.POSITION : [GUI.POS_X_REL|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP , 0.75, 0],
    	GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, 0.2, 25],
    	GUI.ON_CLICK : [this] => fn(indexTool){
    		if(!indexTool.indexTree || !indexTool.currentEntry || !txtNameWrapper() || txtNameWrapper().empty())
    			return;

    		var node = indexTool.currentEntry.changeName(txtNameWrapper());
    		indexTool.updateListView(node);
    	}
    });

    controllPanel += txtTitle;
	controllPanel += btnChangeName;
    controllPanel += [{GUI.TYPE : GUI.TYPE_NEXT_ROW}];

     var txtNumber = gui.create({
    	GUI.TYPE : GUI.TYPE_TEXT,
    	GUI.POSITION : [GUI.POS_X_ABS|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP ,0,0],
    	GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, 0.75, 30],
    	GUI.DATA_WRAPPER : txtNumberWrapper
    });

    var btnChangeNumber = gui.create({
    	GUI.TYPE : GUI.TYPE_BUTTON,
    	GUI.LABEL : "Apply",
    	GUI.POSITION : [GUI.POS_X_REL|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP , 0.75, 0],
    	GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, 0.2, 25],
    	GUI.ON_CLICK : [this] => fn(indexTool){
    		if(!indexTool.indexTree || !indexTool.currentEntry || !txtNumberWrapper() || txtNumberWrapper().empty())
    			return;

			var node = indexTool.currentEntry.changeNumber(txtNumberWrapper());
			
    		if(!node)
    			outln("ERROR: Something wrong when changing number");//TODO some error handling here;
    		else
    			indexTool.updateListView(node);
    	}
    });

    controllPanel += txtNumber;
	controllPanel += btnChangeNumber;
    controllPanel += [{GUI.TYPE : GUI.TYPE_NEXT_ROW}];


    var btnNewTut = gui.create({
    	GUI.TYPE : GUI.TYPE_BUTTON,
    	GUI.LABEL : "New Folder",
    	GUI.POSITION : [GUI.POS_X_REL|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP , 0, 30],
    	GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, 0.48, 30],
    	GUI.ON_CLICK : [this] => fn(indexTool){
    		//create a dialog, add tutorial
    		if(!indexTool.indexTree)
				return;

    		TutorialCreatorDialog.openDialog([indexTool] => fn(indexTool, data){
    			if(!data || !indexTool.currentEntry)
    				return;

    			var folderName = data[0];

    			var node = indexTool.currentEntry.addNewFolder(folderName);
    			indexTool.updateListView(node);
    		},
    		true);
    	}
    });

    var btnChangeChapter = gui.create({
    	GUI.TYPE : GUI.TYPE_BUTTON,
    	GUI.LABEL : "New Tutorial",
    	GUI.POSITION : [GUI.POS_X_REL|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP , 0.5, 30],
    	GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, 0.48, 30],
    	GUI.ON_CLICK : [this] => fn(indexTool){
    		if(!indexTool.indexTree)
				return;

    		TutorialCreatorDialog.openDialog([indexTool] => fn(indexTool, data){
    			if(!data || !indexTool.currentEntry)
    				return;

    			var tutName = data[0];
    			var markDownFileOnly = data[1];

    			var node = indexTool.currentEntry.createNewTutorial(tutName, markDownFileOnly);
    			indexTool.updateListView(node);
    		},
    		false);
    	}
    });

    controllPanel += btnNewTut;
    controllPanel += btnChangeChapter;
    controllPanel += [{GUI.TYPE : GUI.TYPE_NEXT_ROW}];

    var btnSave = gui.create({
    	GUI.TYPE : GUI.TYPE_BUTTON,
    	GUI.LABEL : "Save Structure",
    	GUI.POSITION : [GUI.POS_X_REL|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP , 0, 60],
    	GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, 0.48, 30],
    	GUI.ON_CLICK : [this] => fn(indexTool){
    		if(indexTool.indexTree)
    			indexTool.indexTree.storeToDisk();
    			//after writing to disk we need to reload the tree, to eliminate old changes
    			indexTool.rootDirChanged();
    			outln("Writing to disk done.");
    	}
    });

    var btnBuildIndex = gui.create({
    	GUI.TYPE : GUI.TYPE_BUTTON,
    	GUI.LABEL : "Build Index",
    	GUI.POSITION : [GUI.POS_X_REL|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP , 0.5, 60],
    	GUI.SIZE : [GUI.WIDTH_REL|GUI.HEIGHT_ABS, 0.48, 30],
    	GUI.ON_CLICK : [this] => fn(indexTool){
    		if(indexTool.indexTree)
    			IndexBuilder.createAndSaveIndex(indexTool.indexTree, true);
    		outln("Index building done");
    	}
    });

    controllPanel += btnSave;
    controllPanel += btnBuildIndex;

    contentPanel += btnChooseRootFolder;
    contentPanel += [{GUI.TYPE : GUI.TYPE_NEXT_ROW}];
    contentPanel += this.lstChapterList;
    contentPanel += [{GUI.TYPE : GUI.TYPE_NEXT_ROW}];
    contentPanel += controllPanel;

    window += contentPanel;

    this.window.setEnabled(true);
};

var indexTool = new IndexTool();
indexTool.init();
