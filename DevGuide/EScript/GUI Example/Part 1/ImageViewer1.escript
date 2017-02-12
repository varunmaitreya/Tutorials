static ImageViewer = new Type();

ImageViewer.init := fn(){
	this.imagePanel := void;
	
	var window = this.createWindow();
	window.setEnabled(true);
};

ImageViewer.createWindow := fn(){
	var window = gui.createWindow(800, 800, "Image Viewer Tutorial Version 1");
	window.setPosition(50, 50);
	
	var contentPanel = gui.createPanel(800, 700);
	contentPanel.setExtLayout(
			GUI.POS_X_ABS|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
			GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP|
			GUI.WIDTH_ABS|GUI.HEIGHT_ABS,
			new Geometry.Vec2(0,0),new Geometry.Vec2(-1, -1) 
    );

    contentPanel += [{
    	GUI.TYPE : GUI.TYPE_PANEL,
    	GUI.FLAGS : GUI.BORDER,	
    	GUI.POSITION : [GUI.POS_X_ABS|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP ,0,0],
    	GUI.SIZE : [GUI.WIDTH_ABS|GUI.HEIGHT_ABS, -20, 75],
    	GUI.CONTENTS : [this.createMenu(), this.createToolBar()]    
    }];
    
	this.imagePanel = gui.create({
    	GUI.TYPE : GUI.TYPE_PANEL,
    	GUI.FLAGS : GUI.BORDER,	
    	GUI.WIDTH : 750,
    	GUI.HEIGHT : 400,
    	GUI.POSITION : [GUI.POS_X_ABS|GUI.REFERENCE_X_LEFT|GUI.ALIGN_X_LEFT|
						GUI.POS_Y_ABS|GUI.REFERENCE_Y_TOP|GUI.ALIGN_Y_TOP ,0,0],
    	GUI.SIZE : [GUI.WIDTH_ABS|GUI.HEIGHT_ABS, -20, -100]   
    });
	
	contentPanel += [{GUI.TYPE : GUI.TYPE_NEXT_ROW}];
	contentPanel.add(this.imagePanel);
	window += contentPanel;
	
	return window;
};

ImageViewer.createMenu := fn(){
	var menu = gui.createPanel(100, 50, GUI.AUTO_LAYOUT);
	
	menu += [
		{
			GUI.TYPE				:	GUI.TYPE_MENU,
			GUI.LABEL				:	"File",
			GUI.ICON				:	"#File",
			GUI.MENU				:	[
				{
					GUI.LABEL : "Open Floder...",
					GUI.ON_CLICK : [this] => fn(imageViewer){
						;
					}
				},
				
				{
					GUI.LABEL : "Open Image File...",
					GUI.ON_CLICK : [this] => fn(imageViewer){
						;
					}
				},
				
				'----',
				
				{
					GUI.LABEL : "Save File as...",
					GUI.ON_CLICK : [this] => fn(imageViewer){
						;
					}
				},
				
				{
					GUI.LABEL : "Save File...",
					GUI.ON_CLICK : [this] => fn(imageViewer){
						
					}
				},
				
				'----',
				
				{
					GUI.LABEL : "Close",
					GUI.ON_CLICK : [this] => fn(imageViewer){					
						imageViewer.window.close();
					}
				}
			],	
		},
		
		{
			GUI.TYPE				:	GUI.TYPE_MENU,
			GUI.LABEL				:	"Settings",
			GUI.ICON				:	"#Settings",
			GUI.MENU_WIDTH			: 	150,
			GUI.MENU				:	[
				{
					GUI.LABEL : "Choose Color...",
					GUI.ON_CLICK : [this] => fn(imageViewer){
						;
					}
				}
			
			],
		},
	];
	
	
	return menu;
};

ImageViewer.createToolBar := fn(){
	var toolBar = gui.createPanel(450, 55, GUI.AUTO_LAYOUT);
	
	gui.loadIconFile(__DIR__ + "/resources/icons.json");
	
	toolBar += [
		{
			GUI.TYPE : GUI.TYPE_BUTTON,
			GUI.ICON : "#Tut_Left",
			GUI.TOOLTIP : "Previouse Image",
			GUI.ON_CLICK : [this] => fn(imageViewer){
				;
			}
		},
		{
			GUI.TYPE : GUI.TYPE_BUTTON,
			GUI.ICON : "#Tut_Right",
			GUI.TOOLTIP : "Next Image",
			GUI.ON_CLICK : [this] => fn(imageViewer){
				;
			}
			
		},
		{
			GUI.TYPE : GUI.TYPE_BUTTON,
			GUI.ICON : "#Tut_Pen",
			GUI.TOOLTIP : "Draw Tool",
			GUI.ON_CLICK : [this] => fn(imageViewer){
				;
			}
		},
		{
			GUI.TYPE : GUI.TYPE_BUTTON,
			GUI.ICON : "#Tut_Move",
			GUI.TOOLTIP : "Move Tool",
			GUI.ON_CLICK : [this] => fn(imageViewer){
				;
			}
		}	
	];
	
	return toolBar;
};

var imageViewer = new ImageViewer();
imageViewer.init();