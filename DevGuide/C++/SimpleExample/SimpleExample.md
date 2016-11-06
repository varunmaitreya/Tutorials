<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Henrik Heine (hheine@mail.uni-paderborn.de)
 PADrend Version 1.0.0
------------------------------------------------------------------------------------------------->

# Simple C++ example plugin
This chapter will show you a simple example C++ plugin.
We will basically just add a very simple C++ class to PADrend. For the sake of simplicity we will just add a two dimensional bounding box, which will be described by two `Vec2` instances.

## Folder structure
Before we can start programming, we should create the correct folder structure. Each C++ plugin basically consists of two parts:
1. The MinSG part, where all your actual class reside
2. The E_MinSG part, where all wrapper classes are

If not yet done we have to create a folder for our plugin project inside of the `Ext` folder of these two projects. In this tutorial we will name our project just `MyExtension`. Of course you should give it a better name. We have to create the following two folders:
* `PADrend/modules/MinSG/Ext/MyExtension`
* `PADrend/modules/E_MinSG/Ext/MyExtension`

Typically you will then continue with adding empty files to your project. If you're using CodeBlocks, you have to run the `PADrend/PADrend/PADrend.ekki` file, whenever you have added or removed files.

## MinSG part
For now we only want to add a simple class called `BoundingBox2D`. Typically you would therefore add a header and a source file for this class, but because it is an extremly simple example, we just put everything in the header file. So we just create a file called `BoundingBox2D.h` inside of the `PADrend/modules/MinSG/Ext/MyExtension` folder. This file will hold the actual logic of our simple bounding box:
<!---INCLUDE src=MinSG/MyExtension/BoundingBox2D.h, start=14, end=90--->

As you see, nothing fancy here. Just a plain, simple class. In order to make it accessible from EScript, we now have to create a corresponding wrapper class.

## E_MinSG part
Next we add the following two files to the `PADrend/modules/E_MinSG/Ext/MyExtension` folder:
* `E_BoundingBox2D.h`
* `E_BoundingBox2D.cpp`

The header file is always very similar. You provide a type name, a constructor and a destructor. Furthermore you declare the `getTypeObject` and `init` functions, which will be implemented in the source file.
<!---INCLUDE src=E_MinSG/MyExtension/E_BoundingBox2D.h, start=14, end=56--->

A very important part of the header file can be found at the end: The conversion macros.
Those macros are used to convert between an EScript object and the real object back and forth.

The source file of this header will now look like this:
<!---INCLUDE src=E_MinSG/MyExtension/E_BoundingBox2D.cpp, start=14, end=101--->

It only consists of two functions, the `getTypeObject` and `init` functions.

### getTypeObject
First of all you will always implement the `getTypeObject` function. This function must always return the same EScript type object instance. Therefore you typically just declare it statically. All functions will be later on added to this type object.

### init
Next you implement the init function, which is used to actually add all wrapper functions to the type object. Therefore you first get the type object by calling `getTypeObject`. Then you have to declare your class as a constant inside of the namespace, otherwise your type object won't be usable. Then you just continue with adding all kind of functions to your type object.

## Overall initialization
Each init function of your wrapper classes must be called from MinSG. This is done by modifying the `PADrend/modules/E_MinSG/Ext/ELibMinSGExt.cpp` file. This file includes all wrapper classes and callss their corresponding init functions.

Of course you could call each init function from there, but it is recommended to make a so called 'master'-init function. This function is the only one that is called from MinSG itself and this function will then call all your wrapper inits. Todo so, just add the following two filess to your project:
* `PADrend/modules/E_MinSG/Ext/MyExtension/E_MyExtension.h`
* `PADrend/modules/E_MinSG/Ext/MyExtension/E_MyExtension.cpp`

These two files will be used as the main entry point for our whole plugin. The header file only declares the init function, which will be implemented in the source file.
<!---INCLUDE src=E_MinSG/MyExtension/E_MyExtension.h, start=14, end=26--->

The init function will get the MinSG namespace as the parameter. Inside of your actual init function, you should first define your own namespace. This is advised, because it prevents the MinSG namespace from being polluted. Afterwards you will initialize all of your wrapper classes, by just calling their init functions, with your own namespace as a parameter.
```
#include "E_MyExtension.h"
#include "E_Stack.h"
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
  // Call all your init functions:
  E_BoundingBox2D::init(*ns);
}
}
}
```

Now this init function has to be called from the `PADrend/modules/E_MinSG/Ext/ELibMinSGExt.cpp` file.
First of all you include your header file:
```
/* ... */
#include "ELibMinSGExt.h"
#include "../ELibMinSG.h"
#include <E_Util/E_Utils.h>

#include "MyExtension/E_MyExtension.h"
// ...
```
At the end of this file you then call your init function:
```
// ... hundreds of include lines...
// around line 277:
using namespace MinSG;
using namespace E_Rendering;
using namespace E_Geometry;

namespace E_MinSG {
  void init_ext(EScript::Namespace * /*globals*/,EScript::Namespace * lib) {
    // hundreds of init lines ...
    // around line 700:
    // MY_EXTENSION
    E_MyExtension::init(*lib);
  }
}
```

Now you can finally compile PADrend. If the compilation succeeds, you can run PADrend and use our new `BoundingBox2D` class like this:
```
var bb = new MinSG.MyExtension.BoundingBox2D();
// ...
```
