import 'package:firebase/learnFirebase/home.dart';
import 'package:firebase/learnFirebase/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Checkuser extends StatefulWidget {
  const Checkuser({super.key});

  @override
  State<Checkuser> createState() => _CheckuserState();
}

class _CheckuserState extends State<Checkuser> {
 
  checkUser() {
    final user = FirebaseAuth.instance.currentUser;  
    if(user != null) {
      return Home(); 
    }
     else {
      return LoginPage(); 
     }
  }
 


  @override
  Widget build(BuildContext context) {
    return checkUser();
  }
}