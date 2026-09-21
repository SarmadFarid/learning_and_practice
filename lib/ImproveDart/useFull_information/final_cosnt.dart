/*🧠 1️⃣ Basic Meaning
Keyword	Meaning	When Value Is Known
final	Value is assigned only once (at runtime)	✅ Runtime
const	Value is fixed forever, decided before program runs	✅ Compile time
💬 In Easy Words:
Term	Simple Explanation
Compile Time	Jab code machine language me convert ho raha hota hai — program abhi run nahi hua
Run Time	Jab program chal raha hota hai — screen par result dikh raha hota hai
⚙️ 2️⃣ Think Like This 👇
Example	When It Happens	Type
const a = 10 + 5;	Compiler already knows 15 before program runs	✅ Compile time (const)
final date = DateTime.now();	Value milti hai jab code run hota hai	✅ Run time (final)
💡 Simple Analogy:
Example	Real Life Example	Concept
const	“My birth date = fixed forever”	Compiler already knows (compile time)
final	“Today’s date = changes every day” but you can’t reassign later	Decided at runtime
📘 3️⃣ Example 1 – Using const
void main() {
  const a = 10 + 5; // ✅ known at compile time
  const name = "Ali"; // ✅ known at compile time

  print(a);
  print(name);
}


🟢 Works fine, because all values are known before program starts.
❌ You can’t use anything that changes (like DateTime.now() or userInput) inside const.

📘 4️⃣ Example 2 – Using final
void main() {
  final date = DateTime.now(); // ✅ known only at runtime
  print(date);
}


🟢 Works fine, because value is assigned once when program runs.
✅ But compiler doesn’t know the exact value earlier — it’s decided during execution.

⚡ 5️⃣ Example 3 – Difference Clearly
void main() {
  const a = 10; // compile time constant
  final b = DateTime.now(); // runtime constant

  print(a);
  print(b);
}


🧩 Explanation:

a is const → compiler already knows 10

b is final → compiler doesn’t know, but it will never change after assigned

🧠 6️⃣ Memory Difference
Keyword	Memory Behavior
const	Stored once in memory and reused (shared memory)
final	New memory each time when object created (runtime allocation)

📘 Example:

void main() {
  const list1 = [1, 2, 3];
  const list2 = [1, 2, 3];
  print(identical(list1, list2)); // true — same memory

  final list3 = [1, 2, 3];
  final list4 = [1, 2, 3];
  print(identical(list3, list4)); // false — different memory
}


🧩 identical() checks if both objects share same memory.

✅ const objects share memory (compile time).
❌ final objects don’t share (each created at runtime).

⚙️ 7️⃣ Inside a Class
Rule	Explanation
const in a class → must be static const	Because const values exist at compile time (before objects exist)
final → allowed as instance variable	Because it’s assigned when object is created (runtime)
📘 Example:
class Person {
  static const species = "Human"; // compile time
  final String name; // runtime

  Person(this.name);
}

void main() {
  var p = Person("Ali");
  print(Person.species);
  print(p.name);
}


✅ species known before object exists (compile time).
✅ name known after object creation (runtime).

⚡ 8️⃣ When to Use What
Situation	Use
Value never changes and known before running	const
Value never changes but decided during program run	final
Value can change	normal variable (var / dynamic)
📚 9️⃣ Interview Short Definitions

🟢 Final (Short):

A final variable can only be assigned once, and its value is decided at runtime.

🟢 Const (Short):

A const variable is a compile-time constant; its value must be known before the program runs.

💬 10️⃣ Super Simple Summary
Keyword	Time	Can change?	Memory	Example
final	Run Time	❌ No	New every time	final date = DateTime.now();
const	Compile Time	❌ No	Shared	const pi = 3.14;
💡 One-Line Answer for Interview:

“final is used for values that are fixed at runtime,
while const is used for values that are fixed at compile time.”

*/

// import 'dart:io';

// void main() {
//   String? input = stdin.readLineSync();
//   }

 