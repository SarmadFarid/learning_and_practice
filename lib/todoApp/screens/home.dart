import 'dart:convert';
import 'dart:ffi';
import 'package:firebase/todoApp/models/task_model.dart';
import 'package:firebase/todoApp/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController(); 
  List <Task> tasks = []; 
  String _filter = "All" ; 


   
   Future loadTask() async {
     final prefs = await SharedPreferences.getInstance(); 
     final data = prefs.getString("task"); 
     if(data != null) {
      final decoded = jsonDecode(data) as List ;
      tasks = decoded.map((item) => Task.fromJson(item)).toList() ;
      setState(() {});
     }
   }

   Future saveTask() async {
    final prefs = await SharedPreferences.getInstance() ;
    final data = jsonEncode( tasks.map((item) => item.toJson()).toList() ); 
    prefs.setString('tasks', data ); 
   }

  void addTask(){
    if(_controller.text.isEmpty) return; 
    setState(() {
      tasks.add(Task(id: tasks.length + 1, title:  _controller.text));  
      _controller.clear();   
   });
   saveTask(); 
  }

  void removeTask(int id){
    setState(() {
      tasks.removeWhere((task) => task.id == id); 
    });
    saveTask(); 
  }

  void editTask(int index, String newTitle , bool condition) {
    setState(() {
      tasks[index].title = newTitle ; 
      tasks[index].isCompelete = condition ; 
    });
    saveTask(); 
  }
  void toggleTask(int id) {
    setState(() {
      Task task = tasks.firstWhere((task) => task.id == id); 
      task.toggleStatus(); 
    });
    saveTask(); 
  }

  List<Task> filterTasks() {
    if(_filter == "Completed") {
       return tasks.where((task) => task.isCompelete).toList(); 
    } 
    else if(_filter == "Pending") {
    return  tasks.where( (task) => !task.isCompelete).toList(); 
    } 
      return tasks;
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filterTasks(); 
    return Scaffold(
      appBar: AppBar(
        title:  Text('ToDo App'),
        actions: [
          PopupMenuButton(
            onSelected: (value) => setState(() {
              _filter  = value.toString() ; 
            }) , 
            itemBuilder: (context) => [
           const PopupMenuItem( value: "All",child: Text("All")), 
           const PopupMenuItem( value: "Completed" ,child: Text("Completed")),  
           const PopupMenuItem( value: 'Pending' ,child: Text("Pending")), 
            ] , 
            ), 
        ],
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(25), 
      child: Column(
        children: [

        Row(
          children: [
            Expanded(
              child: TextField(
                 controller: _controller, 
                 decoration: InputDecoration(
                  hintText: "Enter a Task",  
                  border: OutlineInputBorder(), 
                 ),
            )),  
 
           SizedBox(width: 8,), 

           ElevatedButton(
            onPressed:addTask, 
            child: Text("Add")), 

          ],
        ),   
         
         Expanded(
          child: tasks.isEmpty ? Center(child: Text("No Tasks yet"),)
           : 
           ListView.builder(
             itemCount: filtered.length,
             itemBuilder: (BuildContext context, int index) {
              final task = filtered[index]; 
              return ListTile(
             title: Text(task.title, style: TextStyle(decoration: task.isCompelete? TextDecoration.lineThrough : null),), 
             leading: Checkbox(
             value: task.isCompelete , 
             onChanged: (_) => toggleTask(task.id) ),
             trailing: IconButton(
             onPressed: () {
             removeTask(task.id); 
             }, 
            icon: Icon(Icons.delete, color: Colors.red,)),
           );   
             },
           ),
           ) , 

        ],
      ),)
    ); 
  }
}