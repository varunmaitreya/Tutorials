/*
 * This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 * Author: Sascha Brandt (sascha@brandt.graphics)
 * PADrend Version 1.0.0
 */
#include "ELibMyProject.h"

#include <EScript/Basics.h>
#include <EScript/StdObjects.h>

#include <iostream>

namespace MyProject {

// Output "Hello World!" to the console.
void helloWorld() {
	std::cout << "Hello World!" << std::endl;
}

// Initializes your EScript bindings
void init(EScript::Namespace * lib) {
	// EScript macro to create the method MyProject.helloWorld()
	ES_FUNCTION(lib,"helloWorld",0,0,{
		helloWorld();
		return thisEObj;
	})
}

}
