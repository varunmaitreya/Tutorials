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

> This is just a very small and simple class, therefore I put everything in the header file.
> If your class is bigger, it is better to split it into a header and a source file

As you can see, this is just a simple class without anything special in it. In order to make it accessible from EScript, we now have to implement the binding class.

First of all the header file:
<!---INCLUDE src=SimpleExample/E_MinSG/MyExtension/E_BoundingBox2D.h--->

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


