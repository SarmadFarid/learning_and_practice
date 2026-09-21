import 'package:firebase/learnFirebase/home.dart';
import 'package:firebase/todoApp/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskTile extends StatelessWidget {
  final Task task;
   TaskTile({super.key, required this.task,});
   
    Home homeObject = Home(); 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title,style: TextStyle(decoration: task.isCompelete? TextDecoration.lineThrough : null),), 
      leading: Checkbox(
        value: task.isCompelete , 
        onChanged: (_) {
      
        } ),
        trailing: IconButton(
          onPressed: () {
        
          }, 
       icon: Icon(Icons.delete, color: Colors.red,)),
    );
  }
}