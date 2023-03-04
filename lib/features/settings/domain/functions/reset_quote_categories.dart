import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/settings/data/const/default_categories.dart';
import 'package:random_quote/features/settings/data/const/shared_preferences_keys.dart';
import 'package:random_quote/features/settings/domain/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> resetQuoteCategories(WidgetRef ref) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sharedPreferences.setString(
      sharedPreferencesQuoteCategoryKey, jsonEncode(defaultCategories));
  ref.invalidate(quoteCategoriesProvider);
}
