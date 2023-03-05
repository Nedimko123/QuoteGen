import 'dart:convert';

import 'package:random_quote/features/settings/data/const/shared_preferences_keys.dart';
import 'package:random_quote/features/settings/domain/models/quote_notification_time.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setQuoteNotificationTime(QuoteTimeModel quoteTimeModel) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  await sharedPreferences.setString(
      sharedPreferencesQuoteTimeKey, jsonEncode(quoteTimeModel));
}
