// Diff between final and const :
//  final means value is assigned once at run time. const measn value is compile time constant . Exmp : final date = DateTime.now() (valid) ,  const date = DateTime.now() (invalild), 

// Null safety in dart : 
// null safety in dart prevent the variables to be null unless explicity alowed using ?.Exmp: String? name; 

// how would you iterate over a map :
// using forEach or loops, entries , key or values. Exmp: for(var e in map.entries){print("$e.key  $e.value");} 

// Example code 

// void main() {
//   final date = DateTime.now(); 
//   const pi = 3.145 ; 
//   Map<String , int> marks = {
//     "Usman" : 93 , "Ahmad" : 92, "Php Laravel" : 95 , "Sarmad Farid" : 88
//   } ;
//   for(var e in marks.entries) {
//     print("key : ${e.key}  value: ${e.value}"); 
//   }
// }

// Functions : 
// Diff between positional and named parameters : 
// positional param passed by order and named parms are passed by name and enclosed in {}
 
// Can func assigned to a variable ? 
// yes functions are first class citizens . Exp : var func = () => print("hello world"); 
 
// how to convert List in to Set and vice versa . 
// List l  = list.toList() ;  and Set s = list.toSet(); 

// what are records? 
// records are lightweight data structures for goruping values without creating a class for explame : var person = ("person", 18, true) ; 
//  void main () {
//   List numbers = [1,2,3,4,4,2]; 
//   Set s  = numbers.toSet(); 
//   print(s) ; 

//   var person = ("person name", 18, true) ; 
//   print('name: ${person.$1} age: ${person.$2}  isActive: ${person.$3}');
//  } 


// OOP (object oriented programming) :

// Diff between extends and impliments : 
// extend is used for inheritance (getting parent vehavior) and impliment is for defining a contract . you must redefine all methods. 

// what is method overriding? 
// redefine a superclss method in subclass using @override for changing its behavior 

// what is encapsulation ? 
// restricting  direct access to object data using private fields(_fields) exposing thorugh getter and setter  

// class Animal {
//  void sound() => print("animal sound"); 
// }
// class Dog extends Animal {
//  @override
//   void sound() {
//     print("dog barking"); 
//     super.sound();
//   }
// }

// class Person {
//   String _name = "unknown"; 

//  String get name => _name ; 
//  set name(String newName) => _name = newName;  
// }

// void main() {
//   Animal a = Dog() ;
//   a.sound(); 

//    Person p = Person(); 
//    p.name = "Sarmad Farid" ; 
//    print(p.name);  
// }


// Asynchronous programming 

//  Diff between Future and Stram ? 
// future gives a single async value and stream give multiples values over time 

// how to handle exceptions in async code ? 
// using try / catch with await 
 


//  problem 1

// void main() {
//   List<int> numbers = [3, 2, 4, 2, 8, 9, 8]; 
//   numbers = numbers.where( (e) => e.isEven ).toList();  
//   Set unique = numbers.toSet(); 
//    numbers = List<int>.from ( unique.toList()..sort() ); 
//   print("numbers: $numbers"); 
//   print("unique: $unique");  
// } 

// problem 2

// class Bank {
//   double _balance = 0 ;

//   double get balance => _balance ; 
//   set balance(double newbalance) => _balance = newbalance ; 

//    void deposit(double amount) {
//     _balance += amount ; 
//     print("Deposit: $amount"); 
//    }

//    void widraw(double amount) {
//     if(amount > _balance) {
//      print("unsuffisient balance"); 
//     } 
//     else {
//       _balance -= amount ;
//       print("widraw: $amount"); 
//     }
//    }
//  }

//  void main() {
//   Bank acc = Bank(); 
//   acc.deposit(500) ;
//    print("Balance: ${acc.balance}");  
//   acc.widraw(200); 
//   print("Balance: ${acc.balance}"); 
//   acc.deposit(300); 
//   print("Balance: ${acc.balance}");
//   acc.widraw(900); 
//   print("Balance: ${acc.balance}");
//  }

// problem 3 

// Future fetchdata() async {
//   print("Fetching user..."); 
//   await Future.delayed(Duration(seconds: 2), () => print("user fetched")) ;
//   print("fetching psots.."); 
//   await Future.delayed(Duration(seconds: 2), () => print("post fetched")); 
//   print("all data recieved"); 
// }

// void main() {
//   fetchdata(); 
// }


// Stream<int> countStream(int n) async* {
//  for (int i = 0; i <= n ; i++) {
//  yield i ;
//  }
// }


// void main() async {
//  await for ( var data in countStream(10)) {
//   print("count: $data"); 
//  }
// }

// Stream<int> numbers () async* {
//   for(int i = 0; i<=10; i++) yield i ; 
// }
 
// void main() async {
  // await for (var n in numbers().where( (e) => e.isEven).map( (e) => e*10).take(3)) 
  // print(n);  
// }

// 10 , 20, 30 
//  it will crash bcz const is compile time constant and not changes
//  no vlaue
//  start,  future 1 , end
//  odd
//  start bcz we do not use of await
// 1 ,2, 3 
// when we use print then the output comes b constructor bcz we create object of b 
 
//  void maxNumber() {
//  final List<int> numbers = [12,34,56,778,33]; 
  
//  final int maxNumber = numbers.reduce( (a,b) => a > b ? a : b ); 
//  print("maxnumbers is $maxNumber"); 

//  int max = numbers[0]; 
//  for (int i = 1; i < numbers.length; i++) {
//    numbers[i] > max ? max = numbers[i] : null; 
//  }
//  print("max is :  $max"); 
//   }
  
  // void main() {
  //   maxNumber(); 
  // }

// var students = [
//   {"name": "Ali", "score": 85},
//   {"name": "Sara", "score": 92},
//   {"name": "Bilal", "score": 78}
// ];   


//  bool isPrime(int n) {
//   if(n  < 2){
//     print("faslse"); 
//     return false ;
//   } ; 
//   for(int i = 2 ; i <= n ~/ 2 ; i ++) {
//    if(n % i == 0 ) {
//     print("false"); 
//     return false ;
//    }
//   } 
//   print("true"); 
//   return true ;
//  }

//  String reverse(String str) {
//   String rev = ""; 
//   for(int i = str.length - 1 ; i >= 0; i--) {
//    rev += str[i] ;
//   }
//    print(rev) ;
//   return rev ;
//  } 

//  void main() {
//   isPrime(7);
//   isPrime(19);
//   isPrime(18);
//   isPrime(2383);

//   reverse("Sarmad Farid");
//   reverse("Jeux Developers");
//  }
  