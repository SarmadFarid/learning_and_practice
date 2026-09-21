import 'package:firebase/kairoApp/config/routes/app_pages.dart';
import 'package:firebase/practiceProject/presentation/controllers/theme_controller.dart';
import 'package:firebase/notifications_learning/service/notification_services.dart';
import 'package:firebase/stripe/screens/stripe_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> firebaseMessaginBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
  Stripe.publishableKey =
      'pk_test_51T2v5k84q2RKJ6Nn2pbvNu2o4T7B5OMU9Mf9VCUkUaamm6dy3fC1pXqR1ynZ4LUfweTKoMvc0FUtfKPkZe5Kkfj5008m8VyUKR';
      await Stripe.instance.applySettings(); 
  FirebaseMessaging.onBackgroundMessage(firebaseMessaginBackgroundHandler);

  await Firebase.initializeApp();
  await NotificationServices.instance.initilize();
  await GetStorage.init();
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationServices = NotificationServices.instance;
    return GetMaterialApp(
      navigatorKey: notificationServices.navigatorKey,
      title: 'Kairosync',
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      // initialRoute:AppRoutes.bottomNavigation,
      getPages: AppPages.pages,
      themeMode: Get.find<ThemeController>().isDark.value
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      // home: BottomNavbar(),
      home: StripeScreen(),
    );
  }
}
