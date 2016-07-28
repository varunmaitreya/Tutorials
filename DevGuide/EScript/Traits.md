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
Std.Traits.addTrait(someObject, TestTrait);
someObject.print(); // call to the print function of the TestTrait
```
Furthermore it is possible to check if a given object has a specific trait: `Std.Traits.queryTrait(someObject, TestTrait)`

## Trait definition
Each trait is an instance of the `Std.Trait` class. In most cases it is desirable to use the `Std.GenericTrait` class instead of its base class, because the `GenericTrait` allows you to actually add new attributes, including proeprties like `@(private)`, to an object.

First of all you have to create a new instance:
```
var TestTrait = new Std.GenericTrait;
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
// onInit is a MultiProcedure, therefore to add another function to it, don't override it!
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
