// Static: 
// static is a keyword that means a member(variable or method) belongs to the class itself, not to any object(instance) of the class. 

// why we use static ?
// when common data for all objects , memory efficiency , utility functions(which are not relate to objects) , easy access by class name . 

// Exp ;
// class Counter {
//   static int count = 0;

//   void increment() {
//     count++;
//     print("Count: $count");
//   }
// }

// void main() {
//   Counter c1 = Counter();
//   Counter c2 = Counter();

//   c1.increment();
//   c2.increment();
// }
// ✅ Single static variable count shared by both objects.
// Every object increments the same memory location.

// ✅ Static memory is allocated once when class is loaded
// ✅ It stays until the app stops
// ✅ Same memory shared across all objects

// Static method access only static members 
// Non static method access both static & non static

// Example
// class Example {
//   int x = 10;
//   static int y = 20;

//   void nonStaticMethod() {
//     print("x: $x"); // ✅
//     print("y: $y"); // ✅
//   }

//   static void staticMethod() {
//     // print("x: $x"); // ❌ Not allowed
//     print("y: $y");   // ✅ Allowed
//   }
// }

// Reason:
// 👉 Static method doesn’t know which object (this) you are referring to.
// 👉 Non-static variable belongs to an object, but static methods belong to the class —
// so they don’t have access to this.

// 🧠 12️⃣ Static Constants

// If value never changes → make it static const
// so it’s allocated at compile-time, not runtime (faster & lighter).

// class AppColors {
//   static const primaryColor = "Blue";
// }

// 💡 const = compile-time constant
// static = single class-level copy
// Together = ⚡ performance boost.


//  In One Line (For Interview)

// Static keyword in Dart means the member belongs to the class itself, not any object.
// It is created once in memory, shared by all objects, and can be accessed using the class name.
// Static methods can access only static members and cannot use "this".


