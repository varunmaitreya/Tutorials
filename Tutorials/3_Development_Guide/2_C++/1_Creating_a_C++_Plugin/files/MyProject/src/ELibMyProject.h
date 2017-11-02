/*
 * This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 * Author: Sascha Brandt (sascha@brandt.graphics)
 * PADrend Version 1.0.0
 */
#ifndef ELIBMYPROJECT_H
#define ELIBMYPROJECT_H

// Forward declaration.
namespace EScript {
class Namespace;
}

// Change to your namespace
namespace MyProject {
// Initializes your EScript bindings
void init(EScript::Namespace * lib);
}

#endif // ELIBMYPROJECT_H
