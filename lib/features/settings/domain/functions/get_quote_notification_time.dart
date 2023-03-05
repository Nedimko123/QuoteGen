import 'dart:convert';

import 'package:random_quote/features/settings/data/const/shared_preferences_keys.dart';
import 'package:random_quote/features/settings/domain/models/quote_notification_time.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<QuoteTimeModel?> getQuoteNotificationTime() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  await sharedPreferences.reload();

  final String? stringTime =
      sharedPreferences.getString(sharedPreferencesQuoteTimeKey);
  if (stringTime != null) {
    return QuoteTimeModel.fromJson(jsonDecode(stringTime));
  }
  return null;
}
