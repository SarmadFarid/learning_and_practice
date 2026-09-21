import 'package:firebase/learnFirebase/login.dart';
import 'package:firebase/learnFirebase/uiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController(); 
  TextEditingController passController = TextEditingController(); 

   Future signup(String email, String pass ) async{
     if(email == "" && pass == "") {
      Uihelper.alert("ALert", "Enter required fields!") ;
     }
     else {
      UserCredential? usercrendentail ; 
       try{
        usercrendentail = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass).then((value) {  
          Get.to(LoginPage()); 
        } );
       }
       on FirebaseAuthException catch(ex) {
        return Uihelper.alert("Alert", ex.code.toString());
       }

     }
  }
   
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
       appBar: AppBar(
        title: Text("SignUp Page"), 
        centerTitle: true ,
       ),
       body: Padding(
         padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Uihelper.CustomTextField(emailController, false, "Email", Icons.email), 
           SizedBox(height: 20,),  
           Uihelper.CustomTextField(passController, true, "Pass", Icons.password), 
           SizedBox(height: 30,),  
           Uihelper.CustomButton("SignUp", (){
            signup(
              emailController.text.toString(),
              passController.text.toString()
              );
              }), 
           SizedBox(height: 10), 
           GestureDetector(
            onTap: () {
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())); 
            },
             child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text("Already have an account", style:TextStyle(fontSize: 14),),
               SizedBox(width: 5,),  
               Icon(Icons.arrow_forward, size: 15, color: Colors.blue)
              ],
             ),
           )
          ],
         ),
       ),
    );
  }
}