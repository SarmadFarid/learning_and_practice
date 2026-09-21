/* 
🧠 1. What is the Event Loop?
The Event Loop is like a manager or controller that decides
👉 what piece of code should run next in your program.

In Dart (and JavaScript too), the event loop makes asynchronous code (like Futures, async/await, timers, etc.) work properly —
without blocking the main thread.

🧩 2. Why do we need it?
Normally, a computer runs instructions one after another (line by line).
But when you have tasks that take time — like:
Reading a file
Fetching data from the internet
Waiting for a timer
You don’t want your app to freeze waiting for them.
So Dart says:
“Let’s run these tasks asynchronously and I’ll come back to them when they’re ready.”
The Event Loop is what makes that happen — it manages waiting tasks and runs them when ready.

⚙️ 3. How does the Event Loop work?
Let’s visualize it step by step 👇
🧱 Step 1: Main Thread Starts
When your Dart program starts, it runs your main() function first.
🧱 Step 2: Two Queues Are Created
Dart’s event loop mainly deals with two types of task queues:

Queue	Description
Microtask Queue: 	Very high priority tasks (like code after await, scheduleMicrotask())
Event Queue: 	Regular tasks (like Futures, I/O, timers, UI events)

🧱 Step 3: Execution Flow
1️⃣ The event loop runs all synchronous code first (normal line-by-line).
2️⃣ When it finds an async operation, it schedules it in one of the queues.
3️⃣ When the main code finishes, it checks the microtask queue first.
4️⃣ It runs all microtasks (if any).
5️⃣ Then it picks one task from the event queue and runs it.
6️⃣ It repeats this forever — this repeating cycle is the event loop.


// Simple example 
import 'dart:async';

void main() {
  print('Start');

  // Event queue
  Future(() => print('Future 1'));

  // Microtask queue
  scheduleMicrotask(() => print('Microtask 1'));

  // Another event queue task
  Future(() => print('Future 2'));

  print('End');
}

// Output: 
Start
End
Microtask 1
Future 1
Future 2

Final Words: 
The Event Loop keeps Dart apps responsive and efficient.
It doesn’t create new threads — instead, it manages when each async task should run,
so everything feels smooth and non-blocking.




*/