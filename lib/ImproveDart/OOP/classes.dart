// Classes: 
// class is a blueprint for creating objects . A class define the methods and properties that an object will have. 

// Diclaring a class in Dart 
class Room {
  // properties or fields 
  // methods or fucntions
}

//  properties : are used to store data . It is also known as fields or attributes. 
//  Functions : are used to perform actions . It is also known as methods. 

// Example : 
class Person {
  String? name;
  String? phone; 
  bool? isMerrage; 
  
  void displayInfo() {
    print("name: $name , phone: $phone , ismerrage: $isMerrage"); 
  }
}


// Note : 
// Relationship between classes and objects 
//  A class defines the structure and behavoir and an object is an instance of the class that actually holds data and perform actions. Multiple objects can be created form a single class . 