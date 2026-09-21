/* 
What is an Async Generator? 
An async generator is just a function that returns a Stream,
but instead of using StreamController.add(), you use yield to send data.

This is one of Dart’s most elegant features — perfect for clean and readable async code

⚙️ Syntax
Stream<int> numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    yield i; // Send value to stream listeners
    await Future.delayed(Duration(seconds: 1));
  }
}
 


✅ async* → defines an asynchronous generator function
✅ yield → emits one item into the stream
✅ await → can be used inside just like async functions

📦 Example — Listen to it
void main() async {
  await for (final value in numberStream()) {
    print('Received: $value');
  }
}

💡 async* vs async
Feature         	     async                	async*
Return type     	     Future                	Stream
Emits	Only              once              	Multiple times
Emits values with	     return	                 yield
Example	            Fetch data once	       Send multiple updates


⚙️ yield* — Re-yield from another Stream

Sometimes, you want to combine multiple streams — for example, you already have an existing stream, and you want to forward its values.
That’s where yield* comes in.
Example:

Stream<int> evenNumbers() async* {
  for (int i = 2; i <= 10; i += 2) {
    yield i;
  }
}

Stream<int> combinedStream() async* {
  yield 1;             // first manual value
  yield* evenNumbers(); // add all from another stream
  yield 11;            // another manual value
}

Listen:
void main() async {
  await for (var value in combinedStream()) {
    print(value);
  }
}



🧩 Real Production Example — Fetch Data Continuously (API or Database)
Let’s say you want to poll an API every few seconds and automatically update your UI.

Stream<String> fetchLiveApiData() async* {
  while (true) {
    try {
      // Imagine this is your real API call
      final data = 'Fetched at ${DateTime.now()}';
      yield data; // send new data
      await Future.delayed(Duration(seconds: 5));
    } catch (e) {
      yield 'Error: $e'; // handle errors gracefully
    }
  }
}

and in Flutter 👇

StreamBuilder<String>(
  stream: fetchLiveApiData(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting)
      return CircularProgressIndicator();
    if (snapshot.hasError)
      return Text('Error: ${snapshot.error}');
    return Text(snapshot.data ?? '');
  },
)
✅ Super clean
✅ No controller needed
✅ Automatically asynchronous and repeatable


⚙️ Error Handling in Async Generators
You can use try-catch inside async* the same way as regular async functions.

Stream<int> safeStream() async* {
  for (int i = 1; i <= 5; i++) {
    try {
      if (i == 3) throw Exception('Something went wrong!');
      yield i;
    } catch (e) {
      yield -1; // emit fallback value
    }
  }
}

✅ Stream never crashes.
✅ Keeps sending next values even if one iteration fails.


🎯 Interview Ready Questions

Q: What is async* in Dart?
A: It defines an asynchronous generator function that returns a Stream, allowing you to emit multiple values over time using yield.

Q: What’s the difference between yield and yield*?
A: yield emits one value, while yield* emits all values from another stream.

Q: Why use async generators over StreamController?
A: They are simpler, safer, and require less boilerplate for continuous or periodic data emission.



 */ 

import 'dart:async';
import 'package:flutter/material.dart';

class TimerStreamPage extends StatelessWidget {
  const TimerStreamPage({super.key});

  Stream<int> timerStream() async* {
    int count = 0;
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield count++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer Stream Example')),
      body: Center(
        child:StreamBuilder<int>(
          stream: timerStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return Text(
              'Seconds passed: ${snapshot.data}',
              style: TextStyle(fontSize: 26),
            );
          },
        ),
      ),
    );
  }
}
