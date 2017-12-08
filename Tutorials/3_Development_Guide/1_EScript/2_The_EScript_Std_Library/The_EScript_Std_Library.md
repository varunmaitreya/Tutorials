<!------------------------------------------------------------------------------------------------
This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 Author: Henrik Heine (hheine@mail.uni-paderborn.de)
 PADrend Version 1.0.0
------------------------------------------------------------------------------------------------->
<!---BEGINN_INDEXSECTION--->
<!---Automaticly generated section. Do not edit!!!--->

TODO escript std lib here
## DataWrapper
### DataWrapperContainer

## Namespaces

## Enum

## MultiProcedure
### generatorFN

## JSONDataStore

## ObjectSerialization

## Set

## PriorityQueue

##info


# Traits
Traits are a concept of object oriented programming. A trait represents a set of methods and/or attributes, that can be used to extend a class. Traits are one possible solution for the problem that arises if an object should provide a mix of different properties. For example if a class should inherit methods from two different classes, but the underlying language doesn't support multiple inheritance.
A trait usually adds methods to an already existing object.
In EScript it is possible to add properties afterwards, via the `:=` and `::=` operators. For example one could simple add additional functions to already existing types:
```
Geometry.Vec3.xz ::= fn() { return new Geometry.Vec2(this.x(), this.z()); };
// and now one could do the following:
var vec3d = new Geometry.Vec3(10, 20, 30);
var vec2d = vec3d.xz();
outln(vec2d); // Output: Vec2(10 30)
```
Adding such members manually could easily end up in a mess of spaghetti code. Therefore EScript provides a much more comfortable way of handling such things: `Traits`

## Trait example
Imagine we already have a trait called `TestTrait` with a method called `print`. Then we could add this trait to any EScript object by simply doing this:
```
Traits.addTrait(someObject, TestTrait);
someObject.print(); // call to the print function of the TestTrait
```
Furthermore it is possible to check if a given object has a specific trait: `Traits.queryTrait(someObject, TestTrait)`

## Trait definition
Each trait is an instance of the `Std.Trait` class. In most cases it is desirable to use the `Traits.GenericTrait` class instead of its base class, because the `GenericTrait` allows you to actually add new attributes, including properties like `@(private)`, to an object.

First of all you have to create a new instance:
```
var TestTrait = new Traits.GenericTrait;
```
then you can add new attributes:
```
// you must add your attributes to the attributes member variable of your trait
TestTrait.attributes.print ::= fn() {
  outln("print was called on ", this); // this will refer to the actual object
};
```
The `attributes` member is an actual `Type` object, therefore you can use the `:=` operator as well as the `::=` operator. If you want to execute some code when the trait is added to an object, you can add a function to the `onInit` function:
```
// onInit is a MultiProcedure, therefore you add another function to it, don't override it!
TestTrait.onInit += fn(obj) {
  outln("Trait is added to ", obj);
  // Here you can modify the object as you like:
  obj._secret @(private) := 42;
};
```
You could also restrict the type this trait can be added to, by simply adding a type restriction to the first parameter ob the `onInit` function. Furthermore you could also add additional arguments to this function, but make sure that you call the `addTrait` with those additional parameters:
```
// Now with an additional parameter and type restriction
TestTrait.onInit += fn(MyType obj, secret) {
  // An exception is thrown if someone adds this trait to a wrong type
  outln("Trait is added to ", obj);
  obj._secret @(private) := secret;
};
```

### Multiple Uses
By default a trait can only be added once to an object. If one tries to add a trait twice, an exception is thrown. In most cases this behavior is desired, but sometimes it is useful to add a trait multiple times to the same object. In order to do so, one must explicitly allow this behavior:
```
var MyTrait = new Traits.GenericTrait;
MyTrait.allowMultipleUses();
```

### Removal
By default it is not possible to remove a trait and an exception is thrown if one tries to remove it. In order to allow removal it is necessary to explicitly allow this behavior:
```
var MyTrait = new Traits.GenericTrait;
MyTrait.onRemove := fn() {
  // implement some logic here
};
MyTrait.allowRemoval();
```
It is necessary to implement an `onRemove` function. If this function is missing, an exception is thrown on removal.
Now it is possible to remove this trait with: `Traits.removeTrait(obj, MyTrait)`
This will call the `onRemove` function and it will afterwards remove the trait from the internal list of traits for the given object. It is also possible to add additional arguments to the `removeTrait` function. These arguments will be forwarded to the `onRemove` function:
```
var MyTrait = new Traits.GenericTrait;
MyTrait.onRemove := fn(a, b, c) {
  // implement some logic here
};
MyTrait.allowRemoval();
// ...
Traits.removeTrait(obj, MyTrait, 1, 2, 3);
```
Unfortunately it is not possible to completely remove an attribute from an object. Therefore it is a good idea to set those attributes to `void`.


## Traits API
Short overview of the full Traits API

* `Traits.addTrait(obj, Trait trait, params...)`
 * adds the given `trait` to `obj` and passes all extra parameters to the `onInit` function
* `Traits.addTraitByName(obj, String traitName, params...)`
 * Add a trait to the given object. The trait is identified by its name. The trait's name must correspond to the EScript attribute structure beginning with GLOBALS. (e.g. `"Std.Traits.SingletonTrait"`)
* `Traits.assureTrait(obj, trait)`
 * Adds the given trait if it has not already been added.
* `Traits.getTraitByName(String name)`
 * Finds the trait identified by its name. The traits name must correspond to the EScript attribute structure beginning with GLOBALS. (e.g. `"Std.Traits.SingletonTrait"`)
* `Traits.queryLocalTrait(obj, traitOrTraitName)`
 * Checks if the given object has a trait stored locally (and not by inheritance).
* `Traits.queryTrait(obj, traitOrTraitName)`
 * Checks if the given object has a trait (the trait may be inherited).
* `Traits.queryTraits(obj)`
 * Collects all traits of an object (including inherited traits).
* `Traits.removeTrait(obj, Trait trait, params...)`
 * Remove a trait from the given object. If the trait is not designed for removal, an exception is thrown.
* `Traits.requireTrait(obj, traitOrTraitName)`
 * Throws an exception if the given object does not have the given trait.


# Useful Traits
EScript already offers some useful traits that can be used in order to simplify your code.

## `Traits.DefaultComparisonOperatorsTrait`
This trait with its super long name will automatically implement all comparison operators (`<`, `>`, `<=`, `>=`, `==`, `!=`). You only have to provide the `<` function and all other operators are redirected to it. This function will be added as a private attribute of the type and it has therefore access to the `this` object.
This trait can be only added to `Type` objects.

> Attention: This trait will change the behavior of == and !=

```
var MyType = new Type;
MyType.value := void;
MyType._constructor ::= fn(Number v) {
  this.value = v;
};
Traits.addTrait(MyType, DefaultComparisonOperatorsTrait), fn(other) {
  return this.value < other.value;
});

var a = new MyType(0);
var b = new MyType(42);
var c = new MyType(42);
outln(a < b); // true
outln(a > b); // false
outln(a == b); // false
outln(b == c); // true
```

## `Traits.CallableTrait`
This trait marks a type or object as a callable object. Whenever you create a type that overrides the call operator, you should add this trait to it. For example functions and `FnBinder` objects have this trait. With this trait it is possible to easily test if an object can be called:
```
var fun = fn(callable) {
  // This will throw an exception if the trait is missing
  Traits.requireTrait(callable, Traits.CallableTrait);
  // do something with it
  return callable(42);
};
```

You can optionally add a function as an additional parameter to the `addTrait` call. This function will be set as the `_call` function of the given object. If the parameter is omitted, `_call` is set to `void`. Therefore you should either add a function as a parameter or you should first call `addTrait` and define the `_call` function afterwards:
```
var MyType = new Type;
Traits.addTrait(MyType, Traits.CallableTrait, fn() {
  // do something here
});
```
or:
```
var MyType = new Type;
Traits.addTrait(MyType, Traits.CallableTrait);
MyType._call = fn() {
  // do something here
};
```
# EScript modules
Modules are arbitrary objects identified by an unique id, which is typically a path (e.g. 'Std/MultiProcedure'). A single module is normally defined in a single file.
The module loader loads the file only if it is requested by some script. Furthermore the module loader will load each module only once and it will return always the same instance of that module.

The concept of modules is used to structure the code and to load a file only if it is really needed.
Furthermore it prevents namespace pollution.

## Usage
Modules are always loaded by the module loader, which is defined in the 'Std' namespace: `Std.module`
A module is loaded by simply using the module loader as a function with the ID of the target module:
```
var MultiProcedure = Std.module('Std/MultiProcedure');
```
By default the module loader will search in the `PADrend` root folder and all its subdirectories. It is advised to place your modules in a subdirectory of the `extPlugins` folder. For example in an extra directory: `PADrend/extPlugins/MyModules/`

If an EScript file is loaded by a module loader itself, the loader is injected as a static variable called `module`. Therefore you can use `module('...')` instead of `Std.module('...')`.
Furthermore the module loader supports relative module ids.

## Defining own modules
A already said, a module is an arbitrary object, which is defined and returned by a single file.
A very simple module could look like this:
```
// PADrend/extPlugins/MyModules/IntWrapper.escript
var IntWrapper = new Type;
IntWrapper.value @(private) ::= 0;
IntWrapper._constructor ::= fn(v = 0) {
  value = v;
}
IntWrapper.setValue ::= fn(Number v) {
  value = v;
};
IntWrapper.getValue ::= fn() {
  return value;
}
Mod.print ::= fn() {
  outln(value);
};
// a module file MUST return the module object
return IntWrapper;
```
Now you can load and use this module from anywhere via: `Std.module('MyModules/IntWrapper')`.
For example:
```
var IntWrapper = Std.module('MyModules/IntWrapper');
var int = new IntWrapper(10);
int.print(); // Output: 10
int.setValue(42);
int.print(); // Output: 42
```

## Callback
Loading a module can also trigger a callback function.
```
Std.module.on('MyModules/IntWrapper', fn(IntWrapper) {
  outln("IntWrapper was loaded!");
});
```
If the specified module is already loaded, the given function is executed immediately with the module as a parameter. Otherwise the function is added to a list for that module. If the module is later on loaded, all stored callbacks are called.
> ATTENTION: If the module is not loaded, the callback will never be called!

This feature is useful to add optional extensions. For example you could add extra functionality for some other module. If that other module is not loaded, there is no need to add your extra functions.
Example:
```
module.on('MyModules/SomeGUI', fn(gui) {
  gui.addMenu("Do Something");
});
```
