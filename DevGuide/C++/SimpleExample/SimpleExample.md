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
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    // prevent multiple includes of this file
    #ifndef MY_EXTENSION_BOUNDINGBOX2D_H_
    #define MY_EXTENSION_BOUNDINGBOX2D_H_
    
    #include <Geometry/Vec2.h>
    
    // We're lazy and we just want to write Vec2 instead of Geometry::Vec2
    using Geometry::Vec2;
    
    // Never pollute the global namespace!
    namespace MinSG {
    // Use your plugin specific namespace inside of the MinSG namespace
    namespace MyExtension {
    // This class is just a very simple example.
    // This basic bounding box is defined by two Vec2's, describing the two extreme corners
    class BoundingBox2D {
    private:
        Vec2 min;
        Vec2 max;
    public:
        // Define some useful constructors
        BoundingBox2D() : min(0.0, 0.0), max(0.0, 0.0) {}
        BoundingBox2D(BoundingBox2D& other) : min(other.min), max(other.max) {}
        BoundingBox2D(BoundingBox2D* other) : min(other->min), max(other->max) {}
        BoundingBox2D(Vec2& pmin, Vec2& pmax) : min(pmin), max(pmax) {}
        BoundingBox2D(Vec2* pmin, Vec2* pmax) : min(*pmin), max(*pmax) {}
        BoundingBox2D(float minX, float minY, float maxX, float maxY) : min(minX, minY), max(maxX, maxY) {}
        
        // Define some helper methods to get/set all values
        float getMinX() { return min.x(); }
        void setMinX(float v) { min.setX(v); }
        
        float getMinY() { return min.y(); }
        void setMinY(float v) { min.setY(v); }
        
        float getMaxX() { return max.x(); }
        void setMaxX(float v) { max.setX(v); }
        
        float getMaxY() { return max.y(); }
        void setMaxY(float v) { max.setY(v); }
        
        float getWidth() { return max.x() - min.x(); }
        float getHeight() { return max.y() - min.y(); }
        
        float getArea() { return getWidth() * getHeight(); }
        
        Vec2 getMin() { return min; }
        void setMin(Vec2 v) { min = v; }
        Vec2 getMax() { return max; }
        void setMax(Vec2 v) { max = v; }
        
        Vec2 getCenter() { return (min + max) * 0.5f; }
        
        // Define some additional features
        bool contains(Vec2 v) {
            float x = v.x(), y = v.y();
            return x >= min.x() && x <= max.x() && y >= min.y() && y <= max.y();
        }
        
        bool intersects(BoundingBox2D* other) {
            return abs(getMinX() - other->getMinX()) < (getWidth() + other->getWidth()) / 2
                && abs(getMinY() - other->getMinY()) < (getHeight() + other->getHeight()) / 2;
        }
        
        // (In)equality operators
        inline bool operator==(const BoundingBox2D& other) {
            return min == other.min && max == other.max;
        }
        
        inline bool operator!=(const BoundingBox2D& other) {
            return min != other.min || max != other.max;
        }
    };
    }
    }
    
    #endif
<!---END_CODESECTION--->

As you see, nothing fancy here. Just a plain, simple class. In order to make it accessible from EScript, we now have to create a corresponding wrapper class.

## E_MinSG part
Next we add the following two files to the `PADrend/modules/E_MinSG/Ext/MyExtension` folder:
* `E_BoundingBox2D.h`
* `E_BoundingBox2D.cpp`

The header file is always very similar. You provide a type name, a constructor and a destructor. Furthermore you declare the `getTypeObject` and `init` functions, which will be implemented in the source file.
<!---INCLUDE src=E_MinSG/MyExtension/E_BoundingBox2D.h, start=14, end=56--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    // As for all header files, we should prevent multiple includes:
    #ifndef E_MY_EXTENSION_BOUNDINGBOX2D_H_
    #define E_MY_EXTENSION_BOUNDINGBOX2D_H_
    
    // Include some useful EScript stuff
    #include <EScript/EScript.h>
    #include <EScript/Objects/ReferenceObject.h>
    
    // include your real class
    #include <MinSG/Ext/MyExtension/BoundingBox2D.h>
    
    // Typically the same namespace as your real class, but always pre concatenated with "E_"
    namespace E_MinSG {
    namespace E_MyExtension {
    /*! A binding class must inherit from EScript::ReferenceObject<T> where T is your actual class. 
     * If your class gets more complex, it might be better to use EScript::ReferenceObject<Util::Reference<BoundingBox2D>> (more on that in the bigger example)
     */
    class E_BoundingBox2D : public EScript::ReferenceObject<MinSG::MyExtension::BoundingBox2D> {
        //! The human readable name of this type
        ES_PROVIDES_TYPE_NAME(BoundingBox2D)
    public:
        //! returns the Type object for this type
        static EScript::Type * getTypeObject();
        //! this function is used to initialize this type, should be called from the ELibMinSGExt.cpp file
        static void init(EScript::Namespace & lib);
        
        //! most simple constructor, just forward all arguments. This will initialize an instance of your class with that parameters.
        template<typename...args> explicit E_BoundingBox2D(args&&... params) : ReferenceObject_t(E_BoundingBox2D::getTypeObject(),std::forward<args>(params)...) {}
        //! destructor
        virtual ~E_BoundingBox2D() {}
    };
    }
    }
    
    //! All conversions must be in the public namespace!
    //! Convert an EScript object to the real object, typically you just dereference it.
    ES_CONV_EOBJ_TO_OBJ(E_MinSG::E_MyExtension::E_BoundingBox2D, MinSG::MyExtension::BoundingBox2D&, **eObj)
    ES_CONV_EOBJ_TO_OBJ(E_MinSG::E_MyExtension::E_BoundingBox2D, MinSG::MyExtension::BoundingBox2D*, &**eObj)
    //! Convert real classes to EScript binding class. typically you just create a new instance.
    ES_CONV_OBJ_TO_EOBJ(MinSG::MyExtension::BoundingBox2D&, E_MinSG::E_MyExtension::E_BoundingBox2D, new E_MinSG::E_MyExtension::E_BoundingBox2D(obj))
    ES_CONV_OBJ_TO_EOBJ(MinSG::MyExtension::BoundingBox2D*, E_MinSG::E_MyExtension::E_BoundingBox2D, new E_MinSG::E_MyExtension::E_BoundingBox2D(obj))
    
    #endif
<!---END_CODESECTION--->

A very important part of the header file can be found at the end: The conversion macros.
Those macros are used to convert between an EScript object and the real object back and forth.

The source file of this header will now look like this:
<!---INCLUDE src=E_MinSG/MyExtension/E_BoundingBox2D.cpp, start=14, end=101--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    #include "E_BoundingBox2D.h"
    #include <E_Geometry/E_Vec2.h>
    
    namespace E_MinSG {
    namespace E_MyExtension {
    //! returns an instance to an EScript::Type
    EScript::Type * E_BoundingBox2D::getTypeObject() {
        // you want to have this static in order to return always the same instance
        // E_BoundingBox2D ---|> Object
        static EScript::ERef<EScript::Type> typeObject = new EScript::Type(EScript::Object::getTypeObject());
        return typeObject.get();
    }
    
    //! initMembers
    void E_BoundingBox2D::init(EScript::Namespace& lib) {
        EScript::Type* typeObject = getTypeObject();
        // first define the class type in EScript
        declareConstant(&lib, getClassName(), typeObject);
        
        // We're lazy and we only want to write BoundingBox2D instead of the fully qualified name
        using MinSG::MyExtension::BoundingBox2D;
        // now you should define all functions for your new type
        // this is done by several macros
        //! BoundingBox2D new BoundingBox2D([otherBB | min2D, max2D | minX, minY, maxX, maxY])
        ES_CONSTRUCTOR(typeObject, 0, 4,{ // typeObject, minimal parameter count, maximal parameter count, function body
            // Depending on the parameter count, we want to use an other constructor
            // Here we can return a new BoundingBox2D, because the corresponding macro can convert it to an E_BoundingBox2D
            // Of course we could also return a new E_BoundingBox2D directly
            switch(parameter.count()) {
                // parameterless constructor: BoundingBox2D()
                case 0: return EScript::create(new BoundingBox2D());
                // as already mentioned we could also do this:
                // case 0: return new E_BoundingBox2D();
                
                // Copy constructor: BoundingBox2(BoundingBox2D otherBB)
                case 1: return EScript::create(new BoundingBox2D( parameter[0].to<BoundingBox2D*>(rt) ));
                // Constructor using the extreme points: BoundingBox2D(Vec2 min, Vec2 max)
                case 2: return EScript::create(new BoundingBox2D( parameter[0].to<Vec2*>(rt), parameter[1].to<Vec2*>(rt) ));
                // float constructor: BoundingBox2D(float minX, float minY, float maxX, float maxY)
                case 4: return EScript::create(new BoundingBox2D( parameter[0].toFloat(), parameter[1].toFloat(), parameter[2].toFloat(), parameter[3].toFloat() ));
                // Something went wrong!
                default:
                    rt.warn("new BoundingBox2D(): Wrong parameter count!");
                    return EScript::create(new BoundingBox2D());
            }
        })
        
        // short version of the macro, the function body will be converted to this: return EScript::value( thisObj->getMinX() );
        ES_MFUN(typeObject, BoundingBox2D, "getMinX", 0, 0, thisObj->getMinX())
        /* This could be also written in a long version:
        ES_MFUNCTION(typeObject, BoundingBox2D, "getMinX", 0, 0, {
            return thisObj->getMinX();
        })
        */
        ES_MFUN(typeObject, BoundingBox2D, "setMinX", 1, 1, (thisObj->setMinX(parameter[0].toFloat()), thisEObj) )
        /* This could be also written in a long version:
        ES_MFUNCTION(typeObject, BoundingBox2D, "setMinX", 1, 1, {
            thisObj->setMinX(parameter[0].toFloat());
            return thisObj;
        })
        */
        ES_MFUN(typeObject, BoundingBox2D, "getMinY", 0, 0, thisObj->getMinY())
        //ES_MFUN(typeObject, BoundingBox2D, "setMinY", 1, 1, (thisObj->setMinY(parameter[0].toFloat()), thisEObj) )
        ES_MFUNCTION(typeObject, BoundingBox2D, "setMinY", 1, 1, {
            return EScript::value((thisObj->setMinY(parameter[0].toFloat()), thisEObj));
        })
        
        ES_MFUN(typeObject, BoundingBox2D, "getMaxX", 0, 0, thisObj->getMaxX())
        ES_MFUN(typeObject, BoundingBox2D, "setMaxX", 1, 1, (thisObj->setMaxX(parameter[0].toFloat()), thisEObj) )
        ES_MFUN(typeObject, BoundingBox2D, "getMaxY", 0, 0, thisObj->getMaxY())
        ES_MFUN(typeObject, BoundingBox2D, "setMaxY", 1, 1, (thisObj->setMaxY(parameter[0].toFloat()), thisEObj) )
        
        ES_MFUN(typeObject, BoundingBox2D, "getWidth", 0, 0, thisObj->getWidth())
        ES_MFUN(typeObject, BoundingBox2D, "getHeight", 0, 0, thisObj->getHeight())
        ES_MFUN(typeObject, BoundingBox2D, "getArea", 0, 0, thisObj->getArea())
        
        ES_MFUN(typeObject, BoundingBox2D, "getMin", 0, 0, EScript::create(thisObj->getMin()))
        ES_MFUN(typeObject, BoundingBox2D, "setMin", 1, 1, (thisObj->setMin(parameter[0].to<Vec2>(rt)), thisEObj) )
        ES_MFUN(typeObject, BoundingBox2D, "getMax", 0, 0, EScript::create(thisObj->getMax()))
        ES_MFUN(typeObject, BoundingBox2D, "setMax", 1, 1, (thisObj->setMin(parameter[0].to<Vec2>(rt)), thisEObj) )
        ES_MFUN(typeObject, BoundingBox2D, "getCenter", 0, 0, EScript::create(thisObj->getCenter()))
        
        ES_MFUN(typeObject, BoundingBox2D, "contains", 1, 1, thisObj->contains(parameter[0].to<Vec2>(rt)))
        ES_MFUN(typeObject, BoundingBox2D, "intersects", 1, 1, thisObj->intersects(parameter[0].to<BoundingBox2D*>(rt)))
    }
    
    }
    }
<!---END_CODESECTION--->

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
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    #ifndef E_MY_EXTENSION_H_
    #define E_MY_EXTENSION_H_
    
    #include <EScript/Escript.h>
    #include <EScript/Basics.h>
    #include <EScript/StdObjects.h>
    
    namespace E_MinSG {
    namespace E_MyExtension {
    void init(EScript::Namespace & minsg);
    }
    }
    #endif
<!---END_CODESECTION--->

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





