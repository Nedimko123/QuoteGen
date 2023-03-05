import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:random_quote/features/notifications/data/channels.dart';

Future<void> initNotifications() async {
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
    if (Platform.isIOS) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    }
    await AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        allNotificationChannels,
        debug: true);
  });
}
