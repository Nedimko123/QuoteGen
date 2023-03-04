import 'dart:convert';

import 'package:random_quote/features/homepage/data/const/shared_preferences_keys.dart';
import 'package:random_quote/quotes_repisotory/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<QuoteModel>> loadData() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final String transactions =
      sharedPreferences.getString(sharedPreferencesSavedQuotesKey) ?? '[]';
  List<dynamic> transactionList = jsonDecode(transactions);
  return transactionList.map((e) => QuoteModel.fromJson(e)).toList();
}
