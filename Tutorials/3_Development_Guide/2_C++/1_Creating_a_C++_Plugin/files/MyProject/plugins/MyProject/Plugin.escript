/*
 * This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 * Author: Sascha Brandt (sascha@brandt.graphics)
 * PADrend Version 1.0.0
 */
// Create a new Plugin object
var plugin = new Plugin({
	Plugin.NAME : 'MyProject',
	Plugin.DESCRIPTION : 'Simple plugin that loads a c++ plugin library.',
	Plugin.VERSION : 0.1,
	Plugin.AUTHORS : "Sascha Brandt",
	Plugin.OWNER : "All",
	Plugin.LICENSE : "CC BY-SA",
	Plugin.REQUIRES : ['PADrend/GUI'],
	Plugin.EXTENSION_POINTS : [ ]
});

// Create a new library loader instance
static loader = new (Std.module("LibUtilExt/LibraryLoader"));

// Plugin initialization.
plugin.init @(override) :=fn() {
	// load the c++ plugin library 'libMyProject' 
	if(!loader.loadLibary("libMyProject"))
		return false;  
	
	// call the 'helloWorld' method inside the c++ plugin library.
	MyProject.helloWorld();
	
	return true; // plugin successful initialized 
};

return plugin;
