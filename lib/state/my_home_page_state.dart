import 'dart:async';

import 'package:flutter/material.dart';

import '../Utilities/utilities.dart';
import '../page/home_page.dart';
import '../Controller/notification_controller.dart';

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground
              ),
              onPressed: () => NotificationController.createNewNotification(),
              child: const Text('Send Notification'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground
              ),
              onPressed: () => NotificationController.scheduleNewNotification(),
              child: const Text('Schedule Notification'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground
              ),
              onPressed: () {

                DateTime.now().add(const Duration(seconds: 10));
                  Timer.periodic(const Duration(seconds: 10), (timer) {
                    NotificationController.createNewNotification();
                });

              },
              child: const Text('Schedule Repeat Notification'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground
              ),
              onPressed: () async  {
            NotificationWeekAndTime? pickedSchedule =
            await pickSchedule(context);

            if (pickedSchedule != null) {
            NotificationController.createChargingReminderNotification(pickedSchedule);
            }
            },
              child: const Text('Schedule specific time'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground
              ),
              onPressed: () async  {
               NotificationController.cancelNotifications();
              },
              child: const Text('Cancel Notification'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}