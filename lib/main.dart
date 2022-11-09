
import 'package:flutter/material.dart';
import 'my_app.dart';
import 'Controller/notification_controller.dart';


Future<void> main() async {
  // Always initialize Awesome Notifications
  await NotificationController.initializeLocalNotifications();
  runApp(const MyApp());
}











