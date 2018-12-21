/*
Any copyright is dedicated to the Public Domain.
http://creativecommons.org/publicdomain/zero/1.0/
Author: Sascha Brandt <sascha@brandt.graphics>
*/

// Create a Plugin object which tells PADrend what this plugin contains
var plugin = new Plugin({
		Plugin.NAME : 'MyProject', // Name of the plugin
		Plugin.DESCRIPTION : 'Simple example project with dynamic c++ library loading', // A short description of the plugin
		Plugin.VERSION : 0.1, // (optional) Version of the plugin (e.g. 2.7)
		Plugin.AUTHORS : "Sascha Brandt", // (optional) Main author(s) of the plugin (e.g. "Hans Hase & Petra Hummel")
		Plugin.OWNER : "All", // (optional) who is responsible for this plugin and is allowed to make changes (can be "All")
		Plugin.CONTRIBUTORS : "", // (optional) If someone adds a minor part to the plugin, he/she can be added to this list.
		Plugin.LICENSE : "Public Domain", // (optional) e.g. "Mozilla Public License, v. 2.0", PublicDomain or PROPRIETARY
		Plugin.REQUIRES : ['PADrend/GUI', 'Tools', 'GUITools', 'NodeEditor'], // (optional) Array of other plugins that are needed for this plugin
		Plugin.EXTENSION_POINTS : [ ] // (optional) Array of extension points' names provided by this plugin
});

// Load the module 'LibUtilExt/LibraryLoader' which allows dynamic loading of c++ libraries
static LibraryLoader = Std.module("LibUtilExt/LibraryLoader");

// ---------------------------

// Plugin initialization; is called initially when the plugin is loaded.
plugin.init @(override) :=fn() {
	
	// Create an instance of the LibraryLoader.
	var loader = new LibraryLoader; 
	
	// We need to add our build path to the LibraryLoader so it can find the library
	loader.addSearchPath(__DIR__ + "/../../build/");
	loader.addSearchPath(__DIR__ + "/../../lib/"); // You can copy the library here if you want
	
	// Searches for the file 'libMyProject.so' (linux) or 'libMyProject.dll' (windows) 
	// and calls the C entry point function 'loadLibary'.
	if(!loader.loadLibary("libMyProject")) {
		return false;
	}
	
	// Call the function 'afterInit' after all plugins are initialized.
	// The 'LOW_PRIORITY' means, that the function gets called after all other 'PADrend_Init' were called.
	// Here we need to add 'this->...' to delegate the function to this plugin object.
	Util.registerExtension('PADrend_Init', this->afterInit, Extension.LOW_PRIORITY);
		
	return true; // plugin successful initialized
};

// ---------------------------

// Custom init function that gets called after all other plugins are initialized.
// The ... indicates that we don't care about possible input parameters.
plugin.afterInit := fn(...) {
	
	// Register the renderer at the NodeEditor
	registerExtension( 'NodeEditor_QueryAvailableStates' , MyProject.ExampleRenderer->fn(states) {
		if(Renderer!=this)
			return Extension.REMOVE_EXTENSION;
		states["[Ext] ExampleRenderer"] = this->fn(){return new this();};
	});

	// Create a config gui for the renderer
	NodeEditor.registerConfigPanelProvider( MyProject.ExampleRenderer, fn(renderer, panel) {
		panel += {
			GUI.TYPE : GUI.TYPE_BOOL,
			GUI.LABEL : "Draw bounding boxes",
			GUI.DATA_WRAPPER : DataWrapper.createFromFunctions(renderer->renderer.getDrawBoundingBox, renderer->renderer.setDrawBoundingBox),
		};
		panel++; // next row
	});
	
	// Show a short message on the screen - requires 'GUITools' plugin.
	PADrend.message("MyProject initialized!");
};

// ---------------------------
return plugin;
// ------------------------------------------------------------------------------
