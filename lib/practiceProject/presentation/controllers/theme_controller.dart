import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  var isDark = false.obs; 
  final storage = GetStorage(); 

  @override
  void onInit() {
  isDark.value = storage.read("isDark") ?? false ;
  ever(isDark, (value) {
   Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light); 
  }); 
    super.onInit(); 
  }

  void toggleTheme() {
    isDark.value = !isDark.value ;
    storage.write("isDark", isDark.value); 
  }
}

