import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/settings/data/const/shared_preferences_keys.dart';
import 'package:random_quote/features/settings/domain/providers.dart';
import 'package:random_quote/quotes_repisotory/models/quote_categories_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> checkMarkCategory(List<QuoteCategoryModel> categories, bool value,
    WidgetRef ref, int index) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  categories[index] = categories[index].copyWith(isActive: value);
  ref.invalidate(quoteCategoriesProvider);
  sharedPreferences.setString(
      sharedPreferencesQuoteCategoryKey, jsonEncode(categories));
  ref.invalidate(quoteCategoriesProvider);
}
