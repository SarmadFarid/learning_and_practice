import 'package:firebase/kairoApp/config/app_colors.dart';
import 'package:firebase/kairoApp/config/app_icons.dart';
import 'package:firebase/kairoApp/mvc/controllers/bottombar/bottom_nav_controller.dart';
import 'package:firebase/kairoApp/mvc/views/home_view.dart';
import 'package:firebase/kairoApp/mvc/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbar extends StatelessWidget {
    BottomNavbar({super.key});
  final BottomNavController controller = Get.put(BottomNavController()); 

   late final pages = [
    HomeView(), 
    HomeView(), 
    HomeView(), 
    ProfileView(), 
  ] ;

  @override
  Widget build(BuildContext context) {
    return   Obx( () =>
       Scaffold(
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          child: pages[controller.selectedTab.value],
          ),
       bottomNavigationBar: Container(
           decoration: BoxDecoration(
            color: AppColors.white , 
           ),
           child: Padding(padding: EdgeInsets.symmetric(
            horizontal: 10, vertical: 8 ,
           ),
           child: GNav(
                      gap: 10,
                      rippleColor: Colors.grey[300]!,
                      hoverColor: Colors.grey[100]!,
                      color: AppColors.navIcons,
                      activeColor: AppColors.black,
                      iconSize: 24,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      duration: Duration(milliseconds: 400),
                      tabBackgroundColor: AppColors.navTabBg,
                      curve: Curves.easeInOut,
                      selectedIndex: controller.selectedTab.value,
                      onTabChange: controller.changeTab,
                      tabs: const [
                        GButton(icon: AppIcons.home , text: 'Home'),
                        GButton(icon: AppIcons.event , text: 'Event'),
                        GButton(icon: AppIcons.notification , text: 'Notification'),
                        GButton(icon: AppIcons.profile , text: 'Profile'),
                      ],
            ),
            ),
       ),
      ),
    );
  }
}