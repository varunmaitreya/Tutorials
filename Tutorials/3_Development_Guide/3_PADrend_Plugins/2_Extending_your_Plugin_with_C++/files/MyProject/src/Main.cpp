/*
 * This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 * Author: Sascha Brandt (sascha@brandt.graphics)
 * PADrend Version 1.0.0
 */
#include "ELibMyProject.h"
#include <EScript/EScript.h> // Include EScript headers

#include <iostream> // For printing to the console

#ifndef LIBRARY_NAME
#define LIBRARY_NAME "MyProject" // Insert your project name here
#endif

// Main entry point for the EScript library loader
extern "C" void initLibrary(EScript::Namespace* lib) {
  // Output to console to show that the library is beeing loaded.
  std::cout << "Loading Library: " << LIBRARY_NAME << "..." << std::endl;
  if(lib->getAttribute(LIBRARY_NAME).isNotNull()) {
    // Show error message when trying to load the library twice.
    std::cerr << LIBRARY_NAME << " Library already loaded!" << std::endl;
  } else {
    // Create a new namespace inside the global EScript namespace.
    auto * ns = new EScript::Namespace;
    declareConstant(lib, LIBRARY_NAME, ns);
    
    // Initialize EScript bindings
    MyProject::init(ns);
  } 
}
