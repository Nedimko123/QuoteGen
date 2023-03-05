import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:random_quote/features/notifications/data/keys.dart';

List<NotificationChannel> allNotificationChannels = [
  NotificationChannel(
    channelKey: randomQuoteNotificationsChannelKey,
    channelName: 'QuoteGen',
    channelDescription: 'Notification channel for showing random quotes',
    playSound: true,
    enableVibration: true,
    enableLights: true,
  ),
];
