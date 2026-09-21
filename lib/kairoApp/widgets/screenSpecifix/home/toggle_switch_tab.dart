import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:firebase/kairoApp/config/app_colors.dart';
import 'package:firebase/kairoApp/mvc/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleSwitchTab extends StatelessWidget {
   ToggleSwitchTab({super.key});
   final controller = Get.find<HomeController>(); 
  @override
  Widget build(BuildContext context) {
    return  Obx( () =>
          Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
          decoration: BoxDecoration(
            color: AppColors.white, 
            borderRadius: BorderRadius.circular(12), 
             boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset:   Offset(0, 3),
                  ),
                ],
             ),
            child: AnimatedToggleSwitch<int>.size(
              current: controller.selectedTab.value,
              animationCurve: Curves.ease, 
              animationDuration: Duration(milliseconds: 250),
              values: const [0, 1],
             selectedIconScale: 1.0,
             iconOpacity: 0.9,
             indicatorSize: Size.fromWidth(MediaQuery.of(context).size.width),
             iconAnimationType: AnimationType.onHover,
             styleAnimationType: AnimationType.onHover,
              height: 42,
              borderWidth: 0,
              customIconBuilder: (context, local, global) {
                final isActive = local.value == controller.selectedTab.value;
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                    child: Text(
                      local.value == 0 ? "Private" : "Public",
                      style: GoogleFonts.inter(
                        color: isActive ? AppColors.white : AppColors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
              style: ToggleStyle(
                backgroundColor: AppColors.white,
                indicatorColor: AppColors.black,
                borderRadius: BorderRadius.circular(12),
                
              ),
              onChanged: controller.changeTab,
              ),
            ).animate(
            onPlay: (controller) => controller.forward(from: 0), // ensures replay on rebuild
          )
          .fadeIn(
            duration: 800.ms,
            begin: 0.4,
            curve: Curves.easeInOut,
          )
          .scale(
            begin: const Offset(0.01, 0.01),
            end: const Offset(1.0, 1.0),
            duration: 1000.ms,
            curve: Curves.easeOutBack,
          )
       );
  }
}