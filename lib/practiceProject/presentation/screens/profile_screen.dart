import 'dart:io';

import 'package:firebase/practiceProject/presentation/controllers/profile_controller.dart';
import 'package:firebase/practiceProject/presentation/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

   final ProfileController c = Get.put(ProfileController()); 
   final ThemeController theme = Get.find<ThemeController>(); 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text("My Profile", style: GoogleFonts.montserrat(
        fontSize: 20, 
        fontWeight: FontWeight.w600
      ),),
      actions: [
         Obx( () =>
            Padding(
              padding:   EdgeInsets.only(right: 20),
              child: Switch(
                
                activeColor: Colors.white, 
              value:theme.isDark.value , 
              onChanged: (_){
                theme.toggleTheme() ;
                }, 
              ),
            ),
         )
      ],
     ),
     body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
           
              Stack( 
                clipBehavior: Clip.none,
                children: [
                   Obx( 
                  () => AnimatedContainer( 
                  duration:Duration(milliseconds: 400),
                  height: 75, 
                  width: 75,
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  ),
                  child: c.profileImage.value.isEmpty ? 
                  Image.asset("assets/profile.jpeg") :
                  ClipRRect(
                   borderRadius: BorderRadius.circular(300),
                    child: Image.file(
                      File(c.profileImage.value), 
                      fit: BoxFit.cover,
                      ),
                  ),
                )
                ),
              
                Positioned(
                  bottom: 8, 
                  right: -8,
                  child: InkWell(
                    onTap: () => c.pickImage(),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        shape: BoxShape.circle, 
                        border: Border.all(color: Colors.black87)
                      ),
                     child: Icon(Icons.photo, color: Colors.black87, size: 15,),
                    ),
                  ),
                ),
                ]
              ),
               SizedBox(width: 10,) , 
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                 Text("Sarmad Farid", style: GoogleFonts.inter(
                fontSize: 17, 
                fontWeight: FontWeight.w600,
                color: Colors.black87, 
                letterSpacing: 0.4
              ),) , 
              Text("+92 3221936005", style: GoogleFonts.inter(
                fontSize: 13, 
                fontWeight: FontWeight.w500,
                color: Colors.black54, 
                
              ),) , 
                  ],
                ), 
             
            ],
          ),
        ],
      ),

     ),
    ); 
  }
}