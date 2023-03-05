import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:random_quote/features/homepage/domain/functions/generate_random_quote.dart';
import 'package:random_quote/features/notifications/data/keys.dart';
import 'package:random_quote/features/settings/domain/functions/get_quote_notification_time.dart';
import 'package:random_quote/features/settings/domain/models/quote_notification_time.dart';
import 'package:random_quote/quotes_repisotory/models/quote_model.dart';

Future<void> activateQuoteNotifications() async {
  final QuoteTimeModel? quoteTimeModel = await getQuoteNotificationTime();
  if (quoteTimeModel == null) {
    return;
  }
  String timezone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  final QuoteModel quoteModel;
  try {
    quoteModel = await generateRandomQuote();
  } catch (e) {
    return;
  }

  await AwesomeNotifications().createNotification(
      schedule: NotificationCalendar(
        repeats: true,
        timeZone: timezone,
        hour: quoteTimeModel.hours,
        minute: quoteTimeModel.minutes,
        second: 0,
        millisecond: 0,
      ),
      content: NotificationContent(
        category: NotificationCategory.Reminder,
        id: 1,
        channelKey: randomQuoteNotificationsChannelKey,
        title: 'QuoteGen by: ${quoteModel.author}',
        body: quoteModel.quote,
        displayOnBackground: true,
        notificationLayout: NotificationLayout.BigText,
        displayOnForeground: true,
      ));
}
