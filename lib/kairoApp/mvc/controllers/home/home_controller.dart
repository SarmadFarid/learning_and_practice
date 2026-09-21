import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedTab = 0.obs ; 
  var selectedOption = "Recommended".obs ; 

 void changeTab(int index) {
   selectedTab.value = index ;
   print("selected tab : $selectedTab") ;
 }
 
}