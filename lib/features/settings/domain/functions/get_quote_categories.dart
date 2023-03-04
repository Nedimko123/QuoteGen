import 'dart:convert';

import 'package:random_quote/features/settings/data/const/default_categories.dart';
import 'package:random_quote/features/settings/data/const/shared_preferences_keys.dart';
import 'package:random_quote/quotes_repisotory/models/quote_categories_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<QuoteCategoryModel>> quoteCategories() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final String transactions =
      sharedPreferences.getString(sharedPreferencesQuoteCategoryKey) ??
          jsonEncode(defaultCategories);
  List<dynamic> transactionList = jsonDecode(transactions);
  return transactionList.map((e) => QuoteCategoryModel.fromJson(e)).toList();
}
