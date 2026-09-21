 
/*
 What is StreamBuilder? 
StreamBuilder is a Flutter widget that listens to a Stream and rebuilds its UI automatically every time the Stream emits a new value.

🧠 Simply put:
It connects your stream data to your UI, so you don’t need to call setState() manually.

Basic Structure: 
StreamBuilder<T>(
  stream: yourStream,       // The stream you want to listen to
  builder: (context, snapshot) {
    // snapshot holds the latest data or error from the stream
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }

    if (!snapshot.hasData) {
      return CircularProgressIndicator();
    }

    return Text('Data: ${snapshot.data}');
  },
);
🧩 Key Property
snapshot.data → The latest data from the stream
snapshot.error → The latest error
snapshot.connectionState → The stream’s status
(waiting, active, done, none)

💡 Connection States Explained
State	Meaning	Example
ConnectionState.none :	Stream not connected	Usually before building
ConnectionState.waiting : 	Waiting for first data	Show loading spinner
ConnectionState.active :	Receiving data continuously	Normal operation
ConnectionState.done :	Stream closed	Show “No more data”

*/ 

// 🧱 Step-by-Step Example (Practical Flutter Code)
// Let’s create a Counter App using StreamBuilder
// → This shows how to update UI without setState()!

// import 'dart:async';
// import 'package:flutter/material.dart';

// class StreamCounterExample extends StatefulWidget {
//   const StreamCounterExample({super.key});

//   @override
  
//   StreamCounterExampleState createState() => StreamCounterExampleState();
// }

// class StreamCounterExampleState extends State<StreamCounterExample> {
//   final _controller = StreamController<int>();
//   int _count = 0;

//   void _increment() {
//     _count++;
//     _controller.add(_count);
//   }

//   @override
//   void dispose() {
//     _controller.close(); // clean up memory
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('StreamBuilder Example')),
//       body: Center(
//         child: StreamBuilder<int>(
//           stream: _controller.stream,
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return Text('Count: 0', style: TextStyle(fontSize: 30));
//             }
//             return Text(
//               'Count: ${snapshot.data}',
//               style: TextStyle(fontSize: 30),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _increment,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }


// 💬 Real Production Example — API Auto Refresh
// If you’re fetching API every few seconds (like live price data):

// class ApiStreamExample extends StatelessWidget {
//   const ApiStreamExample({super.key});


//   Stream<String> fetchLiveApiData() async* {
//   while (true) {
//     // final response = await http.get(Uri.parse('https://example.com/api/data.php'));
//     // yield response.body;
//     await Future.delayed(Duration(seconds: 5));
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: StreamBuilder<String>(
//           stream: fetchLiveApiData(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             }
//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             }
//             return Text('Data: ${snapshot.data}');
//           },
//         ),
//       ),
//     );
//   }
// }


/* 
🧠 Key Benefits of StreamBuilder
Feature	Benefit
Reactive UI :	UI updates automatically
No setState :	Data-driven architecture
Clean code :	Great for BLoC pattern
Handles async events :	API, Firebase, sockets, sensors
Works with errors and done state	Built-in error handling

🎯 Interview Tips

Q: What is StreamBuilder in Flutter?
A: StreamBuilder is a widget that listens to a Stream and rebuilds its UI automatically whenever the Stream emits new data.

Q: How does StreamBuilder differ from FutureBuilder?
A: FutureBuilder handles a single async response, while StreamBuilder handles multiple async data events over time.

Q: Why is StreamBuilder used in BLoC?
A: Because BLoC uses streams to manage data flow between UI and business logic reactively.


What Happens If You Don’t Close a Stream?
If you forget controller.close():

The stream remains open
Garbage Collector can’t clean it
The stream keeps listening even if your widget is destroyed
💣 Leads to memory leaks and performance lag

In interviews, this is often asked:
Q: What happens if you don’t close a StreamController?
A: The controller stays active in memory, causing leaks and possible crashes, especially in StatefulWidgets.


🎯 Interview Recap

Q: How do you handle errors in Dart Streams?
A: Using onError callback in listen() or by catching exceptions inside an async* function.

Q: Why should we close a StreamController?
A: To free up system memory and avoid memory leaks when the stream is no longer needed.

Q: What is cancelOnError used for?
A: It cancels the listener automatically after the first error event.
*/ 


/*
*/

bool isEven(int number) => number.isEven; 

List<int> greater(List<int> numbers) {
 return  numbers.where( (n) => n > 10).toList(); 
} 

Future asyncTask() async {
  print("waiting.."); 
  await Future.delayed(Duration(seconds: 2)); 
  print("Done"); 
}

void main() {
 asyncTask(); 
}

