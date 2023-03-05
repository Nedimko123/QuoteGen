import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:random_quote/features/common/toast/success.dart';
import 'package:random_quote/features/notifications/data/keys.dart';
import 'package:random_quote/features/settings/data/const/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> removeQuoteNotifications() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  await AwesomeNotifications()
      .cancelNotificationsByChannelKey(randomQuoteNotificationsChannelKey);
  await sharedPreferences.remove(sharedPreferencesQuoteTimeKey);
}
