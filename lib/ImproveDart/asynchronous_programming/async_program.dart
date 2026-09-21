// Synchronous programming ?
// synchornous programming means code execute line by line , one task must finish compeletly before the next starts. 

// Example 
// void main() {
//    print("Task 1");
//   print("Task 2");
//   print("Task 3");
// }

  
// everything runs in order , one by one .
// if one task is slow the whole program is wait--> app may freeze (bad for UI)

// What is Asynchronous programming ? 
// means code does not wait for task to finish , it continuse running next lines while the slow task is compeltes in background . 

// void main() {
//   print("Task 1");
//   Future.delayed(Duration(seconds: 2), () => print("Task 2 (delayed)"));
//   print("Task 3");
// }


// Future – The Heart of Asynchronous Dart
// A future represents a value that will be avaiable later (n the future) .

// Future<String> fetchData() {
//   return Future.delayed(Duration(seconds: 2), () => "Data Fetched");
// }
// void main() {
//   print("Starts"); 
//   fetchData().then( (value) => print(value)); 
//   print("ends"); 
// }

// The .then() Method 
// .then() is used to handle the result of future after it completes. 

// fetchData().then((data) {
//   print("Got: $data");
// });

// async and await — Cleaner Way to Write Futures 
// async and await make asynchonous code look like normal synchronous code .

// 💬 In Easy Words:
// Tum “await” likh kar future ka result ka intezaar kar sakte ho
// bina .then() use kiye.

// Future<void> main() async{
//   print("starts"); 
//   var data = await fetchData();
//   print(data);
//   print("ends"); 
// }

// await stops execution in this function , not the entire program. 
// makes code cleaner and easier to read .

// Async :
// Mark a function as asynchronous , meaning it can use the await keyword inside .
// Without async u can't use await . 

// Await: 
// await pause the execution of the function untill the future completes

// Future<String> getUser() async {
//   await Future.delayed(Duration(seconds: 2));
//   return "User: Ali";
// }

// void main() async {
//   print("Fetching...");
//   var user = await getUser();
//   print(user);
// }


// Error Handling in async/await
// Example
// Future fetchData() async {
//   throw Exception("error occured"); 
// }
// void main() async {
//   try {
//    var data = await fetchData(); 
//    print(data); 
//   }
//   catch (e) {
//     print("caught error: $e"); 
//   }
// }

// Future.wait() :
// Run multiple tasks in parallel and wait for all to finish .

// Future<void> main() async {
//   var results = Future.wait([
//     Future.delayed(Duration(seconds: 2), () => "Task A"), 
//     Future.delayed(Duration(seconds: 2), () => "Task B"), 
//   ]) ;
//   print(results.then( (value) => print(value))); 
// }



