#include "E_MyExtension.h"
#include "E_BoundingBox2D.h"

namespace E_MinSG {
namespace E_MyExtension {
/*! Initialize your namespace inside of the MinSG namespace.
 *  This init function must be called from the ELibMinSGExt.cpp file
 */
void init(EScript::Namespace & minsg) {
    // Define the MyExtension namespace as a child of the MinSG namespace
    EScript::Namespace * ns = new EScript::Namespace();
    declareConstant(&minsg, "MyExtension", ns);
	
	// Now you should call the init functions of all wrapper classes:
	// E_MyClass::init(*ns);
	
	// Classes from the simple example:
	E_BoundingBox2D::init(*ns);
}
}
}
