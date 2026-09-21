//  Contructor : 
//  constructor is a speacial method in class that runs automatically when an object is created . It can be used to initailize (set starting values ) for the objects's variables. 
//  the constructor name should be the same name as the class name. 
//  constructor does not have any return type. 

// exmp  
// class Car {
//   String? name; 
//   double? price; 

//   Car(this.name, this.price); 

//   void display() {
//     print("name : $name  Price: $price "); 
//   }
// }

// void main() {
//   Car car = Car("civic ", 100);  
//   car.display(); 
// }


//  Types of Cosntructor 

// Default constructor : is a constructor with no parameters and custom logic. Dart automatically provides it if you dont define it. It is used when we don't need to give value to object and just want default behavior .  

//  class Car {
//   void display() {
//     print("this is a car"); 
//   }
//  }

//  void main() {
//   Car c = Car();  // defalut construtor created automatically 
//   c.display(); 
//  }


// Parametrized constructor:
// a constructor that takes parameters to initalize the objecct properties. It is used when we want to set values at time of creating object .

 // class Car {
//   String? name; 
//   double? price; 

  // Car(this.name, this.price);  // parametrized constructor 

//   void display() {
//     print("name : $name  Price: $price "); 
//   }
// }

// void main() {
//   Car car = Car("civic ", 100);  
//   car.display(); 
// }


// Named constrcutor: 
//it is a constructor that has custom name . It helps you to create multiple constructors in same class. Named constrcutor improved code readability .  it is usefull when we want to create mulitple constructor with same name .

// class Student {
//   String? name; 
//   int? age; 

//   Student(this.name, this.age);  // parametrized constructor 

//   Student.fromJson(Map<String ,dynamic> data) {
//      name = data['name']; 
//      age = data['age']; 
//   }

//   void show() {
//     print("$name and $age");  
//   }
// }

// void main () {
//     Student s1 = Student("Usman Chand", 23);
//     Student s2 = Student.fromJson({
//       "name" : "Sarmad Farid", 
//       "age" : 18
//     });   

//     s1.show(); 
//     s2.show(); 
// }


// Constant constructor: 
// a constructor that creates immutable(unChangeAble) objects. It is declared using the keyword const. For diclaring constant constructor in dart : All properties of the class must be final . it does not have any body 

// class Car {
//   final String name ;
//   final String color;  

//   const Car(this.name, this.color) ;  

//   void display () {
//     print(name); 
//     print(color); 
//   }
// }
// void main () {
//    const car1 = Car("bugati", "pink"); 
//    const car2 = Car("bugati", "pink");  
//   // car1.display(); 
//   print(identical(car1, car2));
 
// }


// ======
// Imp Note: 
// const constructor helps save memory because identical const object share the same memory location instead of creating duplicates. 

// const object share the same memory only if they have the same data.
// if there values diff, dart create seperate memory for each. 

// identical const object: 
//  dart only reuses identical const objects . identical means same class type , same constructor and same arguments or values . 

// identical() : identical checks same memory location . the identical() function checks weather two variables refers to the same object in memory. 
// Emp 
// class Car {
//   final String name ;
//   final String color; 

//   const Car(this.name , this.color); 
// }
void main() {
//  const car1 = Car("Bughati", "Pink");
//  const car2 = Car("Bughati", "Pink");
//  const car3 = Car("Tesla", "Blue"); 
  
//  print(identical(car1, car2));  // true, same values same memory 
//  print(identical(car1, car3));  // false, differernt value diff memory
}


// Contructor chaining: 
//  when one constructor call another constructor is called construtor chaining either within the same class(this()) or form the parent (super()). 
// exm 

// class Person {
//   String? name;
//   int? age ;

//   Person(this.name, this.age);  

//   Person.named( String name) : this(name , 33) ; // chaining 

//   void show() {
//     print("Name: $name  age: $age");  
//   }
// }

// void main() {
// Person p1 = Person.named("Sarmad farid" ); 
// p1.show();  
// }