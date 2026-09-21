import 'package:firebase/learnFirebase/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Logout()async {
    FirebaseAuth.instance.signOut().then((value){
      Get.off(LoginPage()); 
    }); 
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"), 
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(20), 
      child: Column(
         children: [
        
          TextButton(onPressed: (){
            Logout(); 
          }, child: Text("Logout")), 

      ])
      ,), 

   

    );
  }
}