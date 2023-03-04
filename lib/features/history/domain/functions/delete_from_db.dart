import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/common/toast/success.dart';
import 'package:random_quote/features/history/domain/providers.dart';
import 'package:random_quote/features/homepage/data/const/shared_preferences_keys.dart';
import 'package:random_quote/quotes_repisotory/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> deleteTransaction(QuoteModel quoteModel, WidgetRef ref) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final String transactions =
      sharedPreferences.getString(sharedPreferencesSavedQuotesKey) ?? '[]';
  List<dynamic> string = jsonDecode(transactions);
  final List<QuoteModel> bmiList =
      string.map((e) => QuoteModel.fromJson(e)).toList();
  bmiList.remove(quoteModel);
  await sharedPreferences
      .setString(sharedPreferencesSavedQuotesKey, jsonEncode(bmiList))
      .whenComplete(() {
    successToast('Deleted Quote');
    return ref.refresh(transactionHistoryProvider);
  });
}
