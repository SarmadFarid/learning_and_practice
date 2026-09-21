import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/learnFirebase/uiHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class Adddata extends StatefulWidget {
  const Adddata({super.key});

  @override
  State<Adddata> createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {
  TextEditingController titleController = TextEditingController(); 
  TextEditingController desController = TextEditingController(); 

  saveData(String title , String desc) async {
    if(title.isEmpty && desc.isEmpty){
     Get.snackbar("Alert", "Enter required fields"); 
    } 
    else {
      FirebaseFirestore.instance.collection("Users").doc(title).set({
         "title": title, 
          "des": desc, 
      }).then((value) {
        Get.snackbar("Success", "Data Added Successfully"); 
      });
    }
  }
 
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Add Data"),
        centerTitle: true,
      ), 
      body: Padding(padding: EdgeInsets.all(25), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           
          Uihelper.CustomTextField(titleController, false, "Enter title", Icons.title), 
          SizedBox(height: 20,),  
          Uihelper.CustomTextField(desController, false, "Enter Description", Icons.list_alt),  
          SizedBox(height: 20,), 
          Uihelper.CustomButton("Save Data", (){
            saveData(titleController.text.toString(), desController.text.toString()); 
          })

        ],
      ),),
    );
  }
}