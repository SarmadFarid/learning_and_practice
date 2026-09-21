import 'dart:convert';
import 'package:firebase/notifications_learning/screens/property_detail_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationServices {
  NotificationServices._();
  static final NotificationServices instance = NotificationServices._();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String? token;

  Future<void> initilize() async {
    await _initializeFirebaseMessaging();
    await _initializeLocalNotification();
    await _handleTerminatedState();
  }

  Future<void> _initializeFirebaseMessaging() async {
    final settings = await _messaging.requestPermission();
    print('request permission : ${settings.authorizationStatus}');
    token = await _messaging.getToken();
    print('FCM token: $token');

    _messaging.onTokenRefresh.listen((newToken) {
      print('Token refresh. $newToken');
    });

    FirebaseMessaging.onMessage.listen((message) {
      print("Foreground received: ${message.data}");
      _handleForegroundMessage(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("Background received: ${message.data}");
      _handleBackgroundTap(message);
    });
  }

  Future<void> _initializeLocalNotification() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const AndroidNotificationChannel notificationChannel =
        AndroidNotificationChannel(
          'real_state_channel',
          'Real State Notification',
          description: 'Property updates and alerts.',
          importance: Importance.max,
        );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(notificationChannel);

    final settings = InitializationSettings(android: androidSettings);

    await _localNotificationsPlugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          final data = jsonDecode(response.payload!);
          _handleNavigation(data);
        }
      },
    );
  }

  Future<void> _handleTerminatedState() async {
    RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNavigation(initialMessage.data);
    }
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    await _showLocalNotification(message);
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    const details = AndroidNotificationDetails(
      'real_state_channel',
      'Real State Notification',
      channelDescription: 'Property updates and alerts.',
      importance: Importance.max,
      priority: Priority.high,
    );
    const notificationDetails = NotificationDetails(android: details);

    await _localNotificationsPlugin.show(
      id: message.hashCode,
      title: message.notification?.title ?? 'New update',
      body: message.notification?.body ?? 'check property update',
      payload: jsonEncode(message.data),
      notificationDetails: notificationDetails,
    );
  }

  Future<void> _handleBackgroundTap(RemoteMessage message) async {
    await _handleNavigation(message.data);
  }

  Future<void> _handleNavigation(Map<String, dynamic> data) async {
    if (data['type'] == 'property') {
      Get.to(() => PropertyDetailScreen(propertyId: data['propertyId']));
    }
  }
}


