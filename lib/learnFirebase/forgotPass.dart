import 'package:firebase/learnFirebase/login.dart';
import 'package:firebase/learnFirebase/uiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class Forgotpass extends StatefulWidget {
  const Forgotpass({super.key});

  @override
  State<Forgotpass> createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  TextEditingController emailController = TextEditingController(); 
   
    forgotPass(String email) async {
     if(email == "") {
    Uihelper.alert("Alert", 'Require email to reset pass'); 
     }  
     else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email).then( (value) {
        Uihelper.alert("Link", "Reset link send to your email address"); 
        Get.off(LoginPage()); 
      }); 
     }
   }
   
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text("Forgot Password"),
      centerTitle: true,
      ),
     body: Padding(padding: EdgeInsetsGeometry.all(25), 
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Uihelper.CustomTextField(emailController, false, "Email", Icons.email), 
         SizedBox(height: 20,),

          Uihelper.CustomButton("Reset Password", (){
           forgotPass(emailController.text.toString()); 
          }), 

      ],
     ),),
    );
  }
}