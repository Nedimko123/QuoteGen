import 'dart:math';

import 'package:random_quote/features/settings/domain/functions/get_quote_categories.dart';
import 'package:random_quote/quotes_repisotory/models/quote_categories_model.dart';
import 'package:random_quote/quotes_repisotory/models/quote_model.dart';
import 'package:random_quote/quotes_repisotory/quotes.dart';

Future<QuoteModel> generateRandomQuote() async {
  final List<QuoteCategoryModel> list = await quoteCategories();
  List<String> mappedList = [];
  for (QuoteCategoryModel element in list) {
    if (element.isActive) {
      mappedList.add(element.name);
    }
  }

  if (mappedList.isEmpty) {
    return Future.error('Error: No categories selected');
  }

  int randInt = Random().nextInt(mappedList.length);
  final List<Map<String, dynamic>> randomQuotesGenre = quotes
      .where((element) => element['genre'] == mappedList[randInt])
      .toList();

  randInt = Random().nextInt(randomQuotesGenre.length);
  final QuoteModel generatedQuote =
      QuoteModel.fromJson(randomQuotesGenre[randInt]);

  return generatedQuote;
}
