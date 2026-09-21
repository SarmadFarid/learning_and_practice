import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:firebase/practiceProject/presentation/controllers/home_controller.dart';
import 'package:firebase/practiceProject/presentation/controllers/nav_controller.dart';
import 'package:firebase/practiceProject/presentation/widgets/home_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController()); 
  final NavController navController = Get.find(); 
   
  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
    appBar: AppBar(
       backgroundColor: Colors.grey.shade100,
      title: Text("kairosync", style: GoogleFonts.openSans(fontSize: 28, fontWeight: FontWeight.w800),),
    ),
    body: Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), 
    child: Column(
      children: [
      HomeToggleSwitch(),  
       
        
    

      ],
    ),
    ),
     
    );
  }

 
}

