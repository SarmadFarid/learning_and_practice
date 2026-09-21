import 'dart:ui';

import 'package:firebase/practiceProject/presentation/controllers/nav_controller.dart';
import 'package:firebase/practiceProject/presentation/screens/gallery_screen.dart';
import 'package:firebase/practiceProject/presentation/screens/home_screen.dart';
import 'package:firebase/practiceProject/presentation/screens/notes_screen.dart';
import 'package:firebase/practiceProject/presentation/screens/profile_screen.dart';
import 'package:firebase/practiceProject/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({super.key});
  final NavController navController = Get.put(NavController()); 
   
  late final pages = [
    HomeScreen(), 
    GalleryScreen(), 
    NotesScreen(), 
    ProfileScreen(), 
  ] ;

  @override
  Widget build(BuildContext context) {
    return Obx( () => Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 
        400),
        child: pages[navController.selectedIndex.value]) ,

   
      bottomNavigationBar: 
       Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.3),
            Colors.white.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 20,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Obx(() => GNav(
                    gap: 10,
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    color: Colors.grey[600],
                    activeColor: Colors.black87,
                    iconSize: 24,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    duration: Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.black.withOpacity(0.1),
                    curve: Curves.easeInOut,
                    selectedIndex: navController.selectedIndex.value,
                    onTabChange: navController.changeTab,
                    tabs: const [
                      GButton(icon: Icons.home_filled, text: 'Home'),
                      GButton(icon: Icons.photo, text: 'Gallery'),
                      GButton(icon: Icons.note, text: 'Notes'),
                      GButton(icon: Icons.person, text: 'Profile'),
                    ],
                  )),
            ),
          ),
        ),
      ),
      )
   ));
  }
}