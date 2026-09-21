// Abstraction: hides complex implimentations and exposes only necessary features using abstract classes and interfaces. 
// in OOPS, abstraction means creating classes that defines structure and behavior (what to do) but hides the implimentations details (how to do )  

// Abstract method: a method without a body inside an abstract class . it tells subclasses  you must implimented this method 
 

//  Some Questions and Ans 
// What is abstraction?  
// hidding unnecessary detail and shows only essential parts 

// How do you achieve abstraction in Dart? 
// using abstract classes and interfaces

// Why do we need abstraction?
// to simply code , hide complexity , proivide a clear interface for subclasses 

// Can we create object of abstract class?
// no , its only for inheritance 

// Can abstract class have constructors?
// yes , but it can be called form subclass using super .



abstract class Vehicle{
  void start(); 
  void stop(){
    print("Vehicle is stop"); 
  } 
}
 

class Car extends Vehicle {
  @override 
  void start() {
    print("Car is starting now"); 
  }
}

class Bike extends Vehicle{
  @override
  void start() {
    print("Bike is starting now "); 
  }
}

void main() {
  Car c = Car(); 
  Bike b = Bike(); 
  c.start(); 
  b.start(); 
}
