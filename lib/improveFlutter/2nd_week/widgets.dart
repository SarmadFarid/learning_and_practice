/* 
✅ 1. What is a Widget? 
Widgets are the building blocks of a Flutter UI.
Every button, text, image, or layout is a widget.

⭐ 2. Stateless Widget
✔ When the UI does NOT change:
Static text
Static icons
Logos
One-time layouts
Screens that show only fixed content

⭐ 3. Stateful Widget (Simple Definition)
A StatefulWidget is a widget that can change when something happens.
✔ When UI changes:
Button click
Counter increment
Loading spinner
Fetch API → update UI
TextField input
Animations

⭐ 4. When to use Stateless vs Stateful? (VERY IMPORTANT)
✔ Use Stateless when:
UI never changes
Pure display
No user interaction
Performance optimized screens

✔ Use Stateful when:
UI changes based on action
API data coming
Real-time updates
Forms / TextFields
Animations / Timers

🔥 5. Real-Life Examples
✔ Stateless Examples:
Splash screen logo
AppBar title
Static headings
Terms & conditions page

✔ Stateful Examples:
Counter
Login fields
API calling screens
Search bar
Toggle buttons

❓ Q1: What is the difference between Stateless and Stateful widgets?
Answer:
Stateless widgets do not change once built. They are used for static content.
Stateful widgets can change during runtime using a State object and setState(). They are used for interactive or dynamic UI.

❓ Q2: What is setState()?
Answer:
setState() tells Flutter that the state has changed and the widget should rebuild the UI.

❓ Q3: Why does Flutter rebuild UI instead of updating only changed parts?
Answer:
Flutter uses a fast rendering engine and widget tree. Rebuilding is lightweight because widgets are immutable. Only what changes is repainted by the engine.

❓ Q4: Is StatefulWidget itself mutable?
Answer:
No.
The widget is immutable — its State object is mutable.

❓ Q5: When should I avoid StatefulWidget?
Answer:
Avoid it when the UI does not need changes. Use Stateless for performance.


============================================================================================
============================================================================================
=============================================================================================


❓ Q1: What is a Scaffold?
Answer:
Scaffold provides the basic visual layout structure for the screen, including AppBar, Body, Drawer, SnackBar, and FloatingActionButton.

❓ Q4: What is the difference between ElevatedButton and TextButton?
Answer:
ElevatedButton has background elevation (raised). TextButton is flat with no background.

⭐ 1. What are Layout Widgets in Flutter? 
Layout widgets are those widgets that decide how other widgets are arranged on the screen.
common layout widgets: row , column , stack , container , expanded , padding , center , align , sizedbox , scaffold , listview , gridview

⭐ 2. What is a Widget Tree?
Widget Tree is the structure of all widgets used to build the UI.
It represents how the screen is defined using nested widgets.


⭐ 1️⃣ What is a Widget in Flutter?
A widget is an immutable configuration of the UI.
It describes what the UI should look like, not how it is rendered.
 
 ⭐ 2️⃣ What is Widget Tree?
Widget Tree is the structure of all widgets in your app.
It describes the UI layout.
Widgets are:
Immutable
Lightweight
Only configuration

⭐ 3️⃣ What is Element Tree?
Element Tree is the RUNNING version of Widget Tree.
It holds the relationship between widget and render objects.
✔ Holds widget state
✔ Connects widgets to render objects
✔ Manages lifecycle
Types of Elements:
ComponentElement → for Stateless/Stateful widgets
RenderObjectElement → layout widgets

⭐ 4️⃣ What is Render Tree?
Render Tree contains RenderObjects that handle layout and painting.
Functions:
Measure size
Position children
Paint using Skia
Hit testing (detect taps)


⭐ 6️⃣ How does Flutter rebuild UI?
Step-by-step:
State changes
Flutter calls setState()
build() method runs
Widgets are recreated (immutable)
Element Tree checks which widgets changed
Render Tree updates only affected parts
Skia repaints pixels
👉 ONLY the affected portion is redrawn
👉 Flutter is efficient because widgets are cheap


============================================================================================
============================================================================================
=============================================================================================
   


⭐ Material Design vs Cupertino Design

⭐ 1. What is Material Design?
Material Design is a design system created by Google for Android apps.
It focuses on bold colors, shadows, smooth animations, and elevation.

⭐ 2. What is Cupertino Design?
Cupertino Design is Apple’s design system for iOS apps.
It focuses on soft colors, minimalism, flat UI, and gentle animations.

❓ Can we mix both designs in the same app?
Yes, Flutter allows mixing.
You can use MaterialApp with Cupertino widgets.

❓ Which is better: Material or Cupertino?
Both are good; it depends on the target platform.
Material → Android
Cupertino → iOS
Flutter supports both.

*/


