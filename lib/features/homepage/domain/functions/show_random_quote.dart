import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/common/toast/error.dart';
import 'package:random_quote/features/homepage/domain/functions/generate_random_quote.dart';
import 'package:random_quote/features/homepage/domain/providers.dart';
import 'package:random_quote/quotes_repisotory/models/quote_model.dart';

Future<void> showRandomQuote(WidgetRef ref) async {
  try {
    QuoteModel generatedQuote = await generateRandomQuote();
    final randomQuote = ref.read(randomQuoteProvider.state);
    randomQuote.update((state) => generatedQuote);
  } catch (e) {
    errorToast(e.toString());
  }
}
