# notification__demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [awesome_notification: ](https://pub.dev/packages/awesome_notifications)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

How to Implement Awesome Push Notifications Plugin Using Flutter?

Introduction of Awesome Push Notifications:

    Flutter Awesome Notification is a pop-up message that alerts Android/iOS users about what’s new in the application.
    Also shows the offers, discounted prices and much more.
    It is a great marketing plugin because it helps you to stay connected with users.
    Flutter Awesome Notification Plugin is a simple way to implement push notifications and local notifications.
    In flutter applications, Android and iOS are using firebase cloud messaging or any other services.
    Because of all these benefits and features, we are going to implement them in our flutter application.


Statistics of Awesome Push Notifications:

    Sending notifications increases the application retention rate by 3 to 10x times.
    Awesome notifications boost app engagement by nearly 85%.
    It supports 2 of 4 possible platforms (ios,android,web,desktop).
    Flutter platform web and desktop is under construction.
    Working percentages of awesome notifications plugins for Android and iOS is 94%.
    Push notifications average click rate is 10.3%.
    70% of people find  notifications are very useful and for this reason,
    53% of users are willing to share their details, such as their location.
    Awesome notifications’ highest click rate period is in the evening.

Importance of Awesome Push Notifications Plugin:

    Awesome notifications are an important tool used on the majority of Android and iOS applications,
    aimed at improving user experience and used to engage users with your applications.
    Awesome notification plugin support to create local notifications or push notifications on Android and IOS.
    Awesome Notifications allows an easy way to customize notifications.
    It allows users to schedule notifications, handle notifications in foreground/background using firebase_messaging or any other backed services.

Top Features of Awesome Push Notifications:

    Easy to integrate the flutter push and local notifications.
    Easy to customize notifications and add images, action buttons and sounds.
    Users can create notifications with big pictures, big text and action buttons.
    Media notifications, progress bar notifications can be handled through awesome notifications.
    Easy to initialize notifications with custom icons and colours.
    Flutter push notifications could be created at any moment(Background/Foreground and app is terminated).
    Users can handle events created by action buttons(Background/Foreground).

How Does Awesome Push Notifications Plugin Work?

The process to show Awesome notifications:

Add Awesome Notification Plugin in your pubspace.yaml file:
        
       dependencies:

         awesome_notifications: any

Run the following command in the terminal:

       flutter pub get

To start using the awesome Notification package within your project, import it at the top of your main.dart file:

    import ‘package:awesome_notifications/awesome_notifications.dart’;

Inside main.dart  add the following lines for initializing the plugin :

    static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
    null, //'resource://drawable/res_app_icon',//
    [
    NotificationChannel(
      channelKey: 'alerts',
      channelName: 'Alerts',
      channelDescription: 'Notification tests as alerts',
      playSound: true,
      onlyAlertOnce: true,
      groupAlertBehavior: GroupAlertBehavior.Children,
      importance: NotificationImportance.High,
      defaultPrivacy: NotificationPrivacy.Private,
      defaultColor: Colors.red,
      ledColor: Colors.red)
     ],
     debug: true);

    // Get initial notification action is optional
    initialAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);
    }

Request user to send push notifications and local notifications:

     static Future<bool> displayNotificationRationale() async {
    bool userAuthorized = false;
    BuildContext context = MyApp.navigatorKey.currentContext!;
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Get Notified!',
                style: Theme.of(context).textTheme.titleLarge),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/animated-bell.gif',
                        height: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                    'Allow Awesome Notifications to send you beautiful notifications!'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Deny',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () async {
                    userAuthorized = true;
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Allow',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.deepPurple),
                  )),
            ],
          );
        });
    return userAuthorized &&
        await AwesomeNotifications().requestPermissionToSendNotifications();
     }

Used global navigator key 
   
    // The navigator key is necessary to navigate using static methods
     static final GlobalKey<NavigatorState> navigatorKey =
     GlobalKey<NavigatorState>();

Method for event listener

     ///  Notifications events are only delivered after call this method
     static Future<void> startListeningNotificationEvents() async {
          AwesomeNotifications().setListeners(onActionReceivedMethod: onActionReceivedMethod);
     }

      //onActionReceivedMethod


     @pragma('vm:entry-point')
       static Future<void> onActionReceivedMethod(
          ReceivedAction receivedAction) async {
      if(receivedAction.actionType == ActionType.SilentAction || receivedAction.actionType == ActionType.SilentBackgroundAction){
       //your logic
      }
       else if(receivedAction.payload?["notificationId"] == "123"){
       MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil('/charging-page',
       (route) =>(route.settings.name != '/charging-page') || route.isFirst,arguments: receivedAction);
         }
      else {
     MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/notification-page',
     (route) =>(route.settings.name != '/notification-page') || route.isFirst,arguments: receivedAction);}
        }


Notification creation method

     static Future<void> createNewNotification() async {
     bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
     if (!isAllowed) isAllowed = await displayNotificationRationale();
     if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: -1, // -1 is replaced by a random number
          channelKey: 'alerts',
          title: 'Notification!',
          body:
          "Hi you called me!",
          bigPicture: 'https://images.unsplash.com/photo-1661956602139-ec64991b8b16?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=365&q=80',
          largeIcon: 'https://images.unsplash.com/photo-1667373517445-bfdded9a7c86?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=411&q=80',
          //'asset://assets/images/balloons-in-sky.jpg',
          notificationLayout: NotificationLayout.BigPicture,
          payload: {'notificationId': '1234567890'}),
    );
    }


Scheduled notification method

     static Future<void> scheduleNewNotification() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) isAllowed = await displayNotificationRationale();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: createUniqueId(), // -1 is replaced by a random number
            channelKey: 'alerts',
            title: "Scheduled Notification",
            body:
            "You called a Scheduled notification",
            bigPicture: 'https://images.unsplash.com/photo-1661956602139-ec64991b8b16?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=365&q=80',
            largeIcon: 'https://images.unsplash.com/photo-1667373517445-bfdded9a7c86?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=411&q=80',
            //'asset://assets/images/balloons-in-sky.jpg',
            notificationLayout: NotificationLayout.BigPicture,
            payload: {
              'notificationId': '1234567890'
            }),
       //Using pre-defined schedule method for schedule notification
        schedule: NotificationCalendar.fromDate(
            date: DateTime.now().add(const Duration(seconds: 3))));
     }

For repeted notification we can use DateTime

        DateTime.now().add(const Duration(seconds: 10));
                  Timer.periodic(const Duration(seconds: 10), (timer) {
                    NotificationController.createNewNotification();
                });

    

      




   