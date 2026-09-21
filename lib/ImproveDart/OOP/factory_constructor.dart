// what is factory constructor ?
// A Factory Constructor in dart is a speacial type of constructor that does'nt always return a new object , it can return an existing object , cached object , or a different subclass instance . 

// 💬 In simple words:
// Normally, every time you call a constructor, a new object is created.
// But with a factory constructor, you can control that —
// you can decide what to return (maybe a reused object, or an existing one). 

// Why use factory constructor ? 
// Controll object creation( decides whether create a new instance or return an old one)
// Singleton pattern (ensure only one object of class exists)
// Return subclass instance( can return object of different classes)
// Expensive object reuse (for performance optimization)
// Caching (reuse previously created object)

// class Car {
//   String model ;
//   Car._internal(this.model); // private named constructor 

//   static final Map<String , Car> _cache = {}  ;
  
//   factory Car(String model) {
//     if(_cache.containsKey(model) ){
//       print("returning existing car model: $model"); 
//       return _cache[model]! ;
//     }
//     else {
//       print("creating new model of car: $model"); 
//       final car = Car._internal(model); 
//       _cache[model] = car;  
//       return car ;
//     }
//   }
// }

// void main() {
//   Car car1 = Car("Tesla");
//   Car car2 = Car("Tesla");
//   Car car3 = Car("BMW"); 
// }

// 🧩  Example 2 – Factory Returning Different Type
// A factory constructor can return object of a subclass or a different class entirely.

// Factory in Flutter (real example) 
// class User {
//  final String name;
//  final String role ;

//  User(this.name, this.role); 

//  factory User.fromJson(Map<String , dynamic> json){
//   if(json['role'] == 'admin') {
//    return Admin(json['name']); 
//   }
//   else {
//   return NormalUser(json['name']);
//   }
//  }
// }

// class Admin extends User {
//   Admin(String name) : super(name, 'admin'); 
// }
// class NormalUser extends User{
//   NormalUser(String name) : super(name, 'user'); 
// } 

// void main() {
//  var json = {"name" : "Sarmad farid", "role" : 'admin'};
//  var user = User.fromJson(json); 
//  print(user.runtimeType); 
// }


// In one line (for interview )
// A factory constructor in dart is a special type of constructor that controlls object creatin. it can return an existing object , a new object , or even a subclass instance. making it ideal for singletons, caching , and conditional object creation . 


// Run time Type :
// runTimeType is a built in property in dart that tells you the actual type of an object at runTime(when program is running) .

// Singleton : 
// singleton is a desing pattern that ensures only one instance of class exists throughtout the program. 
// In Easy Words:
// Matlab pure app me us class ka sirf ek object banta hai,
// aur sab log usi object ko use karte hain (memory save hoti hai).

