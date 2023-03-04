import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/common/toast/success.dart';
import 'package:random_quote/features/history/domain/providers.dart';
import 'package:random_quote/features/homepage/data/const/shared_preferences_keys.dart';
import 'package:random_quote/features/homepage/domain/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData(WidgetRef ref) async {
  final randomQuote = ref.read(randomQuoteProvider);

  await SharedPreferences.getInstance()
      .then((SharedPreferences sharedPreferences) {
    final String transactions =
        sharedPreferences.getString(sharedPreferencesSavedQuotesKey) ?? '[]';
    List<dynamic> transactionList = jsonDecode(transactions);
    transactionList.add(randomQuote);
    sharedPreferences.setString(
        sharedPreferencesSavedQuotesKey, jsonEncode(transactionList));
  }).whenComplete(() {
    successToast('Quote saved');
    return ref.refresh(transactionHistoryProvider);
  });
}
