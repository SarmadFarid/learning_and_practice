import 'package:firebase/kairoApp/config/app_colors.dart';
import 'package:firebase/kairoApp/config/app_icons.dart';
import 'package:firebase/kairoApp/config/app_text_styles.dart';
import 'package:firebase/kairoApp/widgets/reusable/circle_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background, 
        actions: [
          CircleContainer(
            margin: EdgeInsets.only(right: 10),
            icon: AppIcons.setting, 
            bgColor: AppColors.white, ) 
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                   
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                 Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 72, 
                  width: 72,
                  decoration: BoxDecoration(
                    color: AppColors.white, 
                    shape: BoxShape.circle
                  ),
                  ), 
                 SizedBox(width: 15,), 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text("Sarmad Farid", style: AppTextStyles.titleLarge,), 
                  Text("+92 3221936005", style: AppTextStyles.seeAll,), 
                    ],
                  )
                  ],
                ), 

               Padding(
                 padding:   EdgeInsets.only(left: 15, top: 20),
                 child: Row(
                  children: [
                    Text("0",style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),), 
                      SizedBox(width: 3,), 
                    Text("Hosted",style: AppTextStyles.seeAll.copyWith(fontSize: 15),), 
                    SizedBox(width: 15,), 
                    Text("0",style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),), 
                     SizedBox(width: 3,), 
                    Text("Attended", style: AppTextStyles.seeAll.copyWith(fontSize: 15)),
                  ],
                )
               ), 
                
            ],
           ) , 
         ),
       ),
      
    );
  }
}