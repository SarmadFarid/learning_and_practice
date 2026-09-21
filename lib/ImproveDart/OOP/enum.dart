// Enum :
//  enum (enumeration) is a speacial data type that defines fixed set of constant values. 

// 💬 In Easy Words:
// Jab tumhe ek limited options define karni ho — jaise days of week, user roles, app states, etc.
// tab enum use karte hain.
// ✅ It makes your code readable, safe, and organized.

// Syntax (How to Declare an Enum) 
// enum Days { monday , tuesday , wednesday , thursday , friday , saturday , sunday} 
// void main() {
//   var today = Days.friday ; 
//   print(today); 
// }


// 💡 Output me class name bhi aata hai (Days.friday),
// kyunki Dart enums are type-safe objects, not simple strings.

// ⚙️ Why We Use Enums
// Type safety , code readability , group related constants , better switch case controll , memory efficiency(store single instance for each value) 


// Without Enum ❌ (Bad Practice) 
// String today = "friday";

// if (today == "Friday") { // typo error!
//   print("Weekend!");
// }

// With Enum (Good Practice)
// enum Days { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

// void main() {
//   Days today = Days.friday;

//   switch (today) {
//    case Days.saturday :
//    case Days.sunday :
//       print("Weekend! 🎉");
//       break ;
//     default :
//      print("Work day 😴");

//   }
// }

// ✅ Type-safe
// ✅ Readable
// ✅ Impossible to mistype

// ⚙️ 7️⃣ Accessing Enum Values
// Property / Method	Description
// .values	Returns a list of all enum values
// .index 	Returns position (0-based)
// .name	  Returns string name (Dart 2.15+)
// 📘 Example:
// void main() {
//   print(Days.values); // [Days.monday, Days.tuesday, ..., Days.sunday]
//   print(Days.tuesday.index); // 1
//   print(Days.friday.name); // friday
// }

// Loop thorugh enum 
// enum Days { monday, tuesday, wednesday, thursday, friday , saturday, sunday }
// void main() {
//   for(var day in Days.values ) {
//     print("day name : ${day.name} index: ${day.index}"); 
//   }
// }

// ⚙️ 9️⃣ Enums with Switch-Case
// enum TrafficLight { red, yellow, green }

// void main() {
//   TrafficLight signal = TrafficLight.red;

//   switch (signal) {
//     case TrafficLight.red:
//       print("Stop!");
//       break;
//     case TrafficLight.yellow:
//       print("Get ready!");
//       break;
//     case TrafficLight.green:
//       print("Go!");
//       break;
//   }
// }


// ✅ Clean & readable logic
// ✅ No invalid states allowed

// 🧠 🔟 Enum with Custom Values (Enhanced Enums – Dart 2.17+)

// Now enums in Dart can have:

// Fields

// Constructors

// Methods

// 📘 Example:
// enum Planet {
//   mercury(3.3, 2439),
//   venus(4.8, 6051),
//   earth(5.9, 6371),
//   mars(6.4, 3389);

//   final double mass;   // in 10^24 kg
//   final double radius; // in km

//   const Planet(this.mass, this.radius);

//   double get surfaceGravity => (mass / (radius * radius)) * 9.8;
// }

// void main() {
//   for (var p in Planet.values) {
//     print('${p.name}: Gravity = ${p.surfaceGravity.toStringAsFixed(2)} m/s²');
//   }
// }


// 🟢 Output:

// mercury: Gravity = 0.00 m/s²
// venus: Gravity = 0.00 m/s²
// earth: Gravity = 0.00 m/s²
// mars: Gravity = 0.00 m/s²


// ✅ Each enum value acts like an object with data and behavior.

// 🧩 11️⃣ Enum with Methods

// You can add methods inside enums!

// enum DeviceState {
//   on,
//   off;
//   void display() {
//     print(this == DeviceState.on ? "Device is ON" : "Device is OFF");
//   }
// }

// void main() {
//   DeviceState.on.display();
//   DeviceState.off.display();
// }


// 🟢 Output:

// Device is ON
// Device is OFF


// ✅ Enums can have logic too — not just data.

// 🧠 12️⃣ Enum Memory Concept
// Feature	Description
// Memory : 	Each enum value is a single static object (singleton)
// Instances : 	Created once, reused everywhere
// Efficiency : 	No duplicate instances like classes
// Lifetime	Till program ends

// ✅ So Enums are memory-efficient and immutable.

// ⚙️ 13️⃣ Enum Comparison

// Enums are compared by identity, not by value.

// if (Days.monday == Days.monday) print("Same day"); // ✅
// if (Days.monday == Days.tuesday) print("Same");    // ❌


// 💡 Each value is unique and constant.

// 🧩 14️⃣ Enums vs Const
// Feature              	Enum	                        Const
// Purpose	      Group of fixed values         	Single constant value
// Type           	Custom data type            	Basic data (int, String, etc.)
// Safe?	         ✅ Type-safe               	❌ Can be misused
// Memory	        One instance per value        	Stored at compile-time
// Example	        enum Days { mon, tue }	        const day = "mon";
// 🧠 15️⃣ Enum in Flutter (Real-World Example)

// Enums are often used for App State Management:
// enum ViewState { idle, loading, success, error }

// class LoginViewModel {
//   ViewState state = ViewState.idle;

//   void login() {
//     state = ViewState.loading;
//     // API Call...
//     state = ViewState.success;
//   }
// }


// And in Flutter UI:

// Widget build(BuildContext context) {
//   switch (viewModel.state) {
//     case ViewState.loading:
//       return CircularProgressIndicator();
//     case ViewState.success:
//       return Text("Login Successful!");
//     case ViewState.error:
//       return Text("Login Failed!");
//     default:
//       return Text("Idle");
//   }
// }


// ✅ Cleaner code
// ✅ No magic strings
// ✅ Enum ensures valid states only

// 🧩 16️⃣ Enum with Extensions (Advanced)

// You can extend enums to add extra methods:

// enum OrderStatus  { pending, shipped, delivered }

// extension OrderStatusExtension on OrderStatus {
//   bool get isFinal => this == OrderStatus.delivered;
// }

// void main() {
//   var status = OrderStatus.shipped;
//   print(status.isFinal); // false
// }

// ✅ Adds custom logic without changing enum definition.

// 💬 17️⃣ Common Interview Questions
// Question	Perfect Answer
// What is an enum?	Enum is a special data type that represents a group of fixed constant values.
// Why do we use enums?	To improve readability, ensure type safety, and reduce bugs from invalid values.
// Can enums have methods in Dart?	✅ Yes (since Dart 2.17, called enhanced enums).
// Can enums have constructors?	✅ Yes, but only constant constructors.
// How to get all values of enum?	Using .values.
// How to get index of enum?	Using .index.
// Can enum extend a class?	❌ No, enums automatically extend Enum class.
// Can enum implement interfaces?	✅ Yes, they can implement.
// Can enum be compared using ==?	✅ Yes, identity comparison.
// Are enums memory efficient?	✅ Yes, only one instance per value (singleton).
// ⚡ 18️⃣ Summary Table
// Feature	Description
// Keyword	enum
// Purpose	Define a set of fixed values
// Memory	One static instance per value
// Constructor	Only const allowed
// Type safety	✅ Yes
// Comparable	✅ Yes (==)
// Has name & index	✅
// Iterable	✅ via .values
// Can have methods	✅ Enhanced Enums
// Used in Flutter	✅ App states, switch cases
// 🧩 19️⃣ In One Line (For Interview)

// Enum (short for enumeration) in Dart is a special type that defines a group of constant values.
// It provides type safety, code readability, and memory efficiency by creating a single instance for each value.
// Dart’s enhanced enums can also have fields, methods, and constructors.
