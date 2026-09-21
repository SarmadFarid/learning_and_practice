import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:firebase/practiceProject/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeToggleSwitch extends StatelessWidget {
  const HomeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>() ;
    return  Obx( () =>
          Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(12), 
            boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
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
                        color: isActive ? Colors.white : Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
              style: ToggleStyle(
                backgroundColor: Colors.white,
                indicatorColor: Colors.black87,
                borderRadius: BorderRadius.circular(12),
                
              ),
              onChanged: controller.onTabChange,
              ),
            ),
       );
  }
}