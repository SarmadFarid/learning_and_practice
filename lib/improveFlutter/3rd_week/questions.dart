/* 

Native code uses the platform’s original UI and APIs.
Non-native (Flutter) uses a single codebase and draws UI using Skia, giving near-native performance with faster development.


Even if a programming language has many libraries, it cannot build full mobile apps.
A framework provides structure, UI components, rendering engine, navigation, gestures, animations, and platform integration.
Dart alone cannot render UI or draw pixels. Flutter framework + engine makes it possible to create high-performance cross-platform apps.


“main.dart contains the entry point of the app. The main() function calls runApp(), which attaches the root widget to the Flutter engine. MyApp is a StatelessWidget that provides global configurations using MaterialApp, such as theme and routing. MaterialApp sets the home screen, which is the first UI of the app. build() returns the widget tree that Flutter renders. This is how the entire Flutter app starts and builds its UI.”


“In a StatefulWidget, createState() is used to create a separate State object that holds all mutable data. The StatefulWidget itself is immutable, but its State object persists across rebuilds. Flutter recreates widgets but preserves the State object, which keeps values like counters, text inputs, scroll positions, or animations. This separation makes Flutter fast and predictable by allowing efficient UI updates without losing state.”

### ❓ 1. What is a key in Flutter? 
Keys uniquely identify widgets in lists or when widgets move in the tree.
They help Flutter preserve correct state and avoid UI bugs.



### ❓ 2. Difference between GlobalKey and ValueKey? 
**GlobalKey** gives access to widget state.
**ValueKey** identifies widgets by their value.


### ❓ 3. Why are widgets immutable? 
Because Flutter rebuilds widgets efficiently.
Immutability avoids unexpected changes and improves performance.
 

### ❓ 4. What is BuildContext?
Location of a widget in the tree.
Used for navigation, themes, mediaquery, and reading inherited data.


### ❓ 5. ListView vs ListView.builder?
ListView builds all children at once.
ListView.builder builds items lazily when needed.


### ❓ 6. Why is ListView.builder recommended?
Better performance for large lists.

### ❓ 7. What is a Form?
A container that groups input fields and provides validation.

 

*/
