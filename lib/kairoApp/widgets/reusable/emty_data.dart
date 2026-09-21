import 'package:firebase/kairoApp/config/app_colors.dart';
import 'package:firebase/kairoApp/config/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmtyData extends StatelessWidget {
  const EmtyData({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
                child: Column(
                  children: [
                   Icon(AppIcons.accessTimeFilled, color: AppColors.grey, size: 30,) , 
                   SizedBox(height: 20,), 
                   Text("Nothing here yet.", style: GoogleFonts.inter(fontSize: 12, color: Colors.blueGrey, fontWeight: FontWeight.w500),)
                  ],
                ),
               );
  }
}