import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/quotes_repisotory/quote_model.dart';

final randomQuoteProvider = StateProvider<QuoteModel?>((ref) => null);
