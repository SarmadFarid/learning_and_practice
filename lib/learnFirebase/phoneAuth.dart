import 'dart:ffi';

import 'package:firebase/learnFirebase/otpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class Phoneauth extends StatefulWidget {
  const Phoneauth({super.key});

  @override
  State<Phoneauth> createState() => _PhoneauthState();
}

class _PhoneauthState extends State<Phoneauth> {
  TextEditingController phoneController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Phone Auth"),
      ), 
      body: Padding(padding: EdgeInsetsGeometry.all(25), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       TextField(
        keyboardType: TextInputType.phone,
        controller: phoneController,
         decoration: InputDecoration(
          hintText: "Enter Phone Number", 
          suffixIcon: Icon(Icons.phone),
           
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)
          )
         ),
       ), 
         
         SizedBox(height: 30,) , 
         SizedBox(
        width: 200, 
        height: 50,
        child: ElevatedButton(
          onPressed: () async{
              await FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (PhoneAuthCredential credentail){}, verificationFailed: (FirebaseAuthException ex){}, 
                codeSent: (String verificationId , int? resendtoken){
                  Get.to( () => (Otpscreen(verificationId: verificationId.toString(),))); 
                }, 
                 codeAutoRetrievalTimeout:(String varificatonId){} ,
                 phoneNumber:phoneController.text.toString()); 
          }, 
          style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25))
        ),
        child: Text("Verify Phone Number") ),
      )
        ],
      ),),
    );
  }
}

