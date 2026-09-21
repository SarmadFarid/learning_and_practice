/* 
Access Modifiers : 
access modifiers are rules  that control who can use or see somthing in your code .
they help you hide details that other parts of program should'nt touch directly . this is a part of concept called encapsulation in  OOP. 

Unlike languages such as Java or C++, Dart doesn’t have keywords like public, private, or protected. 

👉 In Dart, there’s only one access modifier: _ (underscore) 

The Underscore _ Modifier : 
When you put an underscore (_) in front of a variable, method, or class name, it means:
That item is private to its library (file).
That means only code inside the same Dart file can access it.

Example: Private and Public Members 
// file: student.dart
class Student {
  String name;       // Public variable
  int _age;          // Private variable (only visible in this file)

  Student(this.name, this._age);

  void showName() {
    print("Name: $name");
  }

  void _showAge() {  // Private method
    print("Age: $_age");
  }
}

now if we try to acces it from another file
// file: main.dart
import 'student.dart';
void main() {
  var s = Student("Dark Learner", 21);
  s.showName(); // ✅ Works fine
  // s._showAge(); ❌ Error - _showAge() is private
  // print(s._age); ❌ Error - _age is private
}

✅ Public members (without _) are visible everywhere.

Why Use Access Modifiers?
They help you:
Hide sensitive data (like passwords, tokens)
Protect internal logic from being changed by mistake
Keep your code clean and organized
Make your classes easier to maintain


*/