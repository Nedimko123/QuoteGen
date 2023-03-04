import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/homepage/domain/providers.dart';
import 'package:random_quote/quotes_repisotory/quote_model.dart';
import 'package:random_quote/quotes_repisotory/quotes.dart';

void generateRandomQuote(WidgetRef ref) {
  final randomQuote = ref.read(randomQuoteProvider.state);
  final randInt = Random().nextInt(quotes.length);
  final generatedQuote = QuoteModel.fromJson(quotes[randInt]);
  randomQuote.update((state) => generatedQuote);
}
