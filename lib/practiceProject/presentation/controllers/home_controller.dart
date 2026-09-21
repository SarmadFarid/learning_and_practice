import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  var selectedTab = 0.obs ; 

  void onTabChange(int index) {
    selectedTab.value = index ;
  }
}