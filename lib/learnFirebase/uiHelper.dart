 import 'package:flutter/material.dart';
import 'package:get/route_manager.dart'; 

 class Uihelper {

   static CustomTextField( TextEditingController controller, bool toHide, String text, IconData icon) {
       return TextField(
        controller: controller,
         obscureText: toHide, 
         decoration: InputDecoration(
          hintText: text, 
          suffixIcon: Icon(icon), 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)
          )
         ),
      ); 
   }

   static CustomButton(String text, VoidCallback function) {
   return   SizedBox(
        width: 200, 
        height: 50,
        child: ElevatedButton(
          onPressed: function, 
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25))
        ),
        child: Text(text) ),
      );
   }
   
   static alert(String title , String message){
    Get.snackbar(
      title, message, 
      ); 
   }
 }