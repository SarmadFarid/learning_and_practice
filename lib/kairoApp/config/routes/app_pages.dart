import 'package:firebase/kairoApp/config/routes/app_routes.dart';
import 'package:firebase/kairoApp/mvc/views/bottom_navBar.dart';
import 'package:firebase/kairoApp/mvc/views/search_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.search ,
       page: () => SearchView()
       ), 
      GetPage(
        name: AppRoutes.bottomNavigation ,
         page: () => BottomNavbar()
          )
  ] ;
}