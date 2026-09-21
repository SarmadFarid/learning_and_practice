import 'package:firebase/learnFirebase/forgotPass.dart';
import 'package:firebase/learnFirebase/home.dart';
import 'package:firebase/learnFirebase/signup.dart';
import 'package:firebase/learnFirebase/uiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

 TextEditingController emailController = TextEditingController(); 
  TextEditingController passController = TextEditingController(); 

   Future loign(String email, String pass )async{
     if(email == "" && pass == "") {
      Uihelper.alert("ALert", "Enter required fields!") ;
     } 
     else {
      try {
         UserCredential? userCredential; 
         userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass).then((value){
          Get.to(Home()); 
         }); 
      } 
      on FirebaseAuthException catch(e){
      return  Uihelper.alert("Alert", e.code.toString()); 
      }
     }
   } 

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Login Page"), 
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

           Uihelper.CustomButton("Login", (){
            loign(emailController.text.toString(), passController.text.toString()); 
           } ), 

           SizedBox(height: 10), 

           GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup())); 
            },
             child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text("Don't have an account", style:TextStyle(fontSize: 14),),
               SizedBox(width: 5,),  
               Icon(Icons.arrow_forward, size: 15, color: Colors.blue)
              ],
             ),
           ) , 
            SizedBox(height: 30,), 
            TextButton(
            onPressed: (){
            Get.to(Forgotpass()); 
            }, child: Text("Frogot Password"))

          ],
         ),
       ),
    );
    
  }
}