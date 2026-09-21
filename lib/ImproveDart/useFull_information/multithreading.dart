/* 
What is Multithreading? 
Multithreading means running multiple parts of a program at the same time — like doing many tasks together without waiting for one to finish before starting the next.
Each of these tasks runs on a separate thread (like different “workers”).

What is a Thread? 
A thread is like a small path of execution that runs code independently .

🧩 A program → can have one or more threads.
The main thread runs your main code (like main() function).
If you start new threads → your program can do multiple tasks at the same time.

Why Multithreading?
Multithreading makes programs:
✅ Faster — because tasks run in parallel
✅ Responsive — the UI doesn’t freeze when something heavy runs
✅ Efficient — system resources are better used
Example:
When your Flutter app loads data from the internet, you don’t want the screen to freeze.
So you run the network call in another thread (background).

In Dart, true “threads” are handled using Isolates, but for simpler async work we use Futures or async-await.

Dart’s Multithreading: (ISOLATES)
In Dart, threads are called Isolates.
Each isolate:
Has its own memory and variables
Runs independently
Communicates via message passing
👉 Why “Isolate”?
Because each one is isolated — it can’t directly access data from another isolate.


Example Using an Isolate: 

import 'dart:isolate';
void heavyTask(SendPort sendPort) {
  int sum = 0;
  for (int i = 0; i < 1000000000; i++) {
    sum += i;
  }
  sendPort.send(sum); // Send result back
}

void main() async {
  ReceivePort receivePort = ReceivePort();

  // Start a new isolate (thread)
  await Isolate.spawn(heavyTask, receivePort.sendPort);

  // Wait for result
  int result = await receivePort.first;
  print("Sum is: $result");
}

✅ The heavy calculation runs in a separate thread,
so your main app stays smooth (no freezing UI).

Difference Between Single Thread and Multithreading
Feature..	        Single Thread..                Multithreading..
Execution	      One task at a time            	Many tasks at once
Performance    Slower for heavy tasks	         Faster, parallel work
Example	        Sequential download	        Download + play music + show progress
Flutter UI        Freezes easily                   	Stays smooth


Multithreading in Flutter
In Flutter:
UI runs on the main thread
Heavy work (like JSON parsing, image processing, etc.) should run on a separate thread (Isolate)
For simple async work → use Future, async/await
For very heavy CPU tasks → use Isolate

=============================
Question:
“Are async/await and Future in Dart a way of multithreading?
Do they use separate threads to load API data, etc.?”

✅ Short Answer:
No, async/await and Future in Dart do not create new threads.
They just make your code non-blocking, but everything still runs on the same main thread.


🧩 Let’s understand this step-by-step
1. 🧵 The Main Thread
When your Flutter app starts, it runs on one main thread (the UI thread).
This thread:
Draws your UI
Handles user input
Runs most of your Dart code
If something takes too long here (like downloading data or processing a large file),
the app can freeze or lag — because the thread is busy.


2. ⚙️ What async, await, and Future actually do
They don’t start new threads — instead, they tell Dart:
“Hey, this task will take some time, so let’s not block the main thread.
Continue with other work and come back when this task is done.”
They make code asynchronous, not multi-threaded.
📘 So:
The code still runs on one thread
But Dart switches between tasks smartly (called an event loop)
This makes your app feel like it’s multitasking, even though it’s just handling tasks efficiently

4. 🚀 True Multithreading in Dart
For real separate threads, Dart uses Isolates.
Each Isolate:
Has its own memory
Runs truly in parallel
Communicates with other isolates using message passing

🧩 Analogy
Think of Dart like a restaurant 🍽️:
Async/await = One chef cooking multiple dishes by switching between tasks smartly (non-blocking)
Isolates = Multiple chefs cooking at the same time in separate kitchens (true multithreading)

💬 Final Answer:
Asynchronous programming (Future, async, await) makes code non-blocking,
but it does not use separate threads.
For true parallel processing (real multithreading), Dart uses Isolates.

*/
