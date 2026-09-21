import 'dart:developer';

import 'package:firebase/learnFirebase/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/instance_manager.dart';

class Otpscreen extends StatefulWidget {
  String verificationId ;
  Otpscreen({super.key, required this.verificationId});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  TextEditingController otpController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Otp Screen"),
      ), 
      body: Padding(padding: EdgeInsetsGeometry.all(25), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       TextField(
        controller: otpController,
         keyboardType: TextInputType.phone,
         decoration: InputDecoration(
          hintText: "Enter OTP", 
          suffixIcon: Icon(Icons.phone), 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)
          )
         ),
       ), 

         SizedBox(height: 20,) , 
        
        SizedBox(
        width: 200, 
        height: 50,
        child: ElevatedButton(
          onPressed: ()async{
          try{
           PhoneAuthCredential credentail = await PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode:otpController.text.toString() ); 
           FirebaseAuth.instance.signInWithCredential(credentail).then((value){
            Get.to(() => Home()); 
           }); 
          }
          catch(ex){
          log(ex.toString()); 
           }
           }, 
          style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25))
        ),
        child: Text("OTP") ),
      )
        ],
      ),),
    );
  }
}