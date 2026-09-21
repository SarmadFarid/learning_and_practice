// in one line for (interview)
// Super keyword:  super keyword is used to access the parent class members(variables , methods, constructors) from a child class . it ensures proper inheritance , data initizalization and code reuse. 

//  Why we use super keyword : 
// to call parent class's constructor (so parent data is initialized properly before child) 
// to call parent class's method (when child overrides a method but still want parent behavior)
// to access parent calss variables (when same variables exist in both classes )

// Example 1. 
// class Animal {
//   void eat() {
//     print("Animal is eating");
//   }
// }

// class Dog extends Animal {
//   @override
//   void eat() {
//     super.eat(); // call parent method
//     print("Dog is eating");
//   }
// }

// void main() {
//   var d = Dog();
//   d.eat();
// }


// Example 2. Accessing parent variables using super. 

// class Vehicle {
//   String color = "white"; 
// }

// class Car extends Vehicle {
//   String color  = "red" ; 

//   void showColors() {
//     print("car color: $color");  
//     print("vehicle color: ${super.color}"); 
//   }
// }
// void main() {
//  var c = Car(); 
//  c.showColors();
//  }


// Example 3. Calling parent constructor using super 
// class Person {
//   String name;
//   int age;

//   Person(this.name, this.age) {
//     print("Parent constructor called");
//   }
// }

// class Student extends Person {
//   String grade;

//   Student(String name, int age, this.grade) : super(name, age) {
//     print("Child constructor called");
//   }
// }

// void main() {
//   var s1 = Student("Ali", 20, "A");
//   print("${s1.name}, ${s1.age}, ${s1.grade}");
// }

// ---- Common inerview questions -----
// | Question                                           | Best Answer                                                 |
// | -------------------------------------------------- | ----------------------------------------------------------- |
// | What is `super` keyword?                           | It refers to the parent class.                              |
// | When do we use `super()`?                          | To call parent constructor or access parent data/methods.   |
// | Can we use `super` in static methods?              | ❌ No, because static members belong to class, not instance. |
// | Does parent constructor run before or after child? | ✅ Always before child.                                      |
// | Can we call parent’s named constructor?            | ✅ Yes, using `super.namedConstructor()`.                    |
