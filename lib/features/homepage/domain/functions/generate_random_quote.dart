import 'dart:convert';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/common/toast/error.dart';
import 'package:random_quote/features/homepage/domain/providers.dart';
import 'package:random_quote/quotes_repisotory/models/quote_categories_model.dart';
import 'package:random_quote/quotes_repisotory/models/quote_model.dart';
import 'package:random_quote/quotes_repisotory/quotes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../settings/data/const/default_categories.dart';
import '../../../settings/data/const/shared_preferences_keys.dart';

Future<void> generateRandomQuote(WidgetRef ref) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final String transactions =
      sharedPreferences.getString(sharedPreferencesQuoteCategoryKey) ??
          jsonEncode(defaultCategories);
  List<dynamic> transactionList = jsonDecode(transactions);
  List<QuoteCategoryModel> list =
      transactionList.map((e) => QuoteCategoryModel.fromJson(e)).toList();
  List<String> mappedList = [];
  for (QuoteCategoryModel element in list) {
    if (element.isActive) {
      mappedList.add(element.name);
    }
  }

  if (mappedList.isEmpty) {
    errorToast('Error: No categories selected');
    return;
  }

  int randInt = Random().nextInt(mappedList.length);
  final List<Map<String, dynamic>> randomQuotesGenre = quotes
      .where((element) => element['genre'] == mappedList[randInt])
      .toList();

  final randomQuote = ref.read(randomQuoteProvider.state);

  randInt = Random().nextInt(randomQuotesGenre.length);
  final QuoteModel generatedQuote =
      QuoteModel.fromJson(randomQuotesGenre[randInt]);

  randomQuote.update((state) => generatedQuote);
}
