import 'dart:async';

import 'package:firebase/practiceProject/presentation/screens/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late  AnimationController animationController ; 
  late Animation<double> animation; 
  
  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this, 
      ); 
     animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut); 
     animationController.forward(); 

     Timer(
      Duration(seconds: 3), 
       () {
        Get.offAll( () => BottomNavbar()) ;
       }  , 
     ); 

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black87, 
     body: FadeTransition(
      opacity: animation,  
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Hero(
            tag: "logo",
             child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("assets/logo.png", height: 120,)),  
             ), 
          
           SizedBox(height: 20),
              Text(
                "Gallery & Notes",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ).animate().fadeIn(duration: Duration(milliseconds: 1200)).scale(curve: Curves.bounceOut)

          ],
        ),
      ),
      ),
    );
  }
}