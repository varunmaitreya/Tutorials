<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Henrik Heine (hheine@mail.uni-paderborn.de)
 PADrend Version 1.0.0
------------------------------------------------------------------------------------------------->

# Extending PADrend

## C++ based extensions
PADrend doesn't have an actual plugin system for C++, but it is possible to add own classes to PADrend by just adding them to existing parts of it. Up to now the `MinSG` package was used as some kind of a "plugin" project. If you want to add a C++ based plugin, you should create a subfolder in the `PADrend/modules/MinSG/Ext` and `PADrend/modules/E_MinSG/Ext` folder.

## C++ plugin basics
The core of each plugin should be added to the corresponding MinSG/Ext folder. Here you can define all your classes and implement the actual logic of your plugin. This part of a plugin is just an ordinary collection of C++ classes, so here you can do whatever you want. After that your classes are only accessible from other C++ classes, but not from the EScript side.

## EScript binding
EScript can only access C++ classes through special bindings, defined by the developer.
So in order to access our new plugin from EScript, we have to define corresponding bindings. For each C++ class that should be accessible from EScript, you must provide a corresponding binding class. By convention a binding class has the same name as your actual class, but preconcatenated with "E_". For example a class called "Test" would become "E_Test". You should also adapt your namespaces to the same naming convention.
These bindings are special classes for EScript and they must follow the following pattern:
* It must inherit from `EScript::ReferenceObject<T>` where T is your actual class
* It must provide a so called "Type Name", by using the macro: `ES_PROVIDE_TYPE_NAME(SomeName)`
* It must have a static function, which returns an `EScript::Type*` describing the class object
* It must have a static `init` function, which is used to initialize the binding (and this init function must be called from MinSG)
* It should have a constructor that takes a pointer or reference to your actual object (this is not a *must*, but it makes some things easier)
* It should provide some macros used to convert between the binding class and the actual class
* Your wrapped class must provide the == operator (and therefore it is often a good idea to also provide the != operator).

This was just an abstract overview, we will now look at a little example.

### Simple classes
If your class is a small one, like `Vec3` or `Matrix4x4`. You typically let your binding inherit from `EScript::ReferenceObject<T>`, where T is your actual class. A small example class called `BoundingBox2D` can be found in: [SimpleExample](SimpleExample/SimpleExample.md)

<!---INCLUDE src=SimpleExample/MinSG/MyExtension/BoundingBox2D.h--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    /*
     * This file is part of the open source part of the
     * Platform for Algorithm Development and Rendering (PADrend).
     * Web page: http://www.padrend.de/
     * Copyright (C) 2016 Henrik Heine <hheine@mail.uni-paderborn.de>
     * 
     * PADrend consists of an open source part and a proprietary part.
     * The open source part of PADrend is subject to the terms of the Mozilla
     * Public License, v. 2.0. You should have received a copy of the MPL along
     * with this library; see the file LICENSE. If not, you can obtain one at
     * http://mozilla.org/MPL/2.0/.
     */
    
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

> This is just a very small and simple class, therefore I put everything in the header file.
> If your class is bigger, it is better to split it into a header and a source file

As you can see, this is just a simple class without anything special in it. In order to make it accessible from EScript, we now have to implement the binding class.

First of all the header file:
<!---INCLUDE src=SimpleExample/E_MinSG/MyExtension/E_BoundingBox2D.h--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    /*
     * This file is part of the open source part of the
     * Platform for Algorithm Development and Rendering (PADrend).
     * Web page: http://www.padrend.de/
     * Copyright (C) 2016 Henrik Heine <hheine@mail.uni-paderborn.de>
     * 
     * PADrend consists of an open source part and a proprietary part.
     * The open source part of PADrend is subject to the terms of the Mozilla
     * Public License, v. 2.0. You should have received a copy of the MPL along
     * with this library; see the file LICENSE. If not, you can obtain one at
     * http://mozilla.org/MPL/2.0/.
     */
    
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

The conversion macros will always convert from/to the specified *real* type to/from a *pointer* of the wrapper type, although you don't write the asteriks symbol after your wrapper type. There are two types of conversion macros:
```
// This will convert an E_MyType* to a MyType by using the conversionCode
ES_CONV_EOBJ_TO_OBJ(E_MyType, MyType, conversionCode)
// This will convert an object of MyType to a E_MyType*
ES_CONV_OBJ_TO_EOBJ(MyType, E_MyType, conversionCode)
// In most cases you want to use MyType& or MyType*, because you want to avoid copying
```

Now the source file:
<!---INCLUDE src=SimpleExample/E_MinSG/MyExtension/E_BoundingBox2D.cpp--->
<!---BEGINN_CODESECTION--->
<!---Automaticly generated section. Do not edit!!!--->
    /*
     * This file is part of the open source part of the
     * Platform for Algorithm Development and Rendering (PADrend).
     * Web page: http://www.padrend.de/
     * Copyright (C) 2016 Henrik Heine <hheine@mail.uni-paderborn.de>
     * 
     * PADrend consists of an open source part and a proprietary part.
     * The open source part of PADrend is subject to the terms of the Mozilla
     * Public License, v. 2.0. You should have received a copy of the MPL along
     * with this library; see the file LICENSE. If not, you can obtain one at
     * http://mozilla.org/MPL/2.0/.
     */
    
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

First of all you should implement the `getTypeObject` function. This function is used to get an EScript `Type` object for your wrapper class. (see [EScript OOP](EScript_OOP.md))
It is important to *always* return the same instance! Therefore it is a good idea to declare it as a local static variable inside the function:
```
EScript::Type * E_MyType::getTypeObject() {
	static EScript::ERef<EScript::Type> typeObject = new EScript::Type(EScript::Object::getTypeObject());
	return typeObject.get();
}
```
This will result in allocating the memory once and returning always the same instance.

After that you should implement your `init` function. In there you first have to make your class known to EScript, by declaring its type as a constant:
```
declareConstant(&lib, getClassName(), typeObject);
```
After that you can add a constructor, methods or constants to your typeObject. This is done by using the corresponding EScript [Macros](Macros.md).

A simple example could look like this:
```
EScript::Type* typeObject = E_MyType::getTypeObject();
//! Vec2 getXZ(Vec3) this function will extract the x and z value of the given Vec3
ES_FUNCTION(typeObject, "getXZ", 1, 1, {
  Vec3 vec = parameter[0].to<Vec3>(rt);
  return EScript::create( new Vec2(vec.x(), vec.z()) );
})
```

### Compile
Before you compile your classes, you have to make sure that your compile tool knows them. For example if you're using `CodeBlocks`, you have to run the `PADrend\PADrend\PADrend.ekki` script, which will add all source files to the project file. After this step, you can actually compile PADrend.


