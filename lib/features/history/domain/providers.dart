import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/history/domain/functions/load_from_db.dart';
import 'package:random_quote/quotes_repisotory/models/quote_model.dart';

final transactionHistoryProvider =
    FutureProvider<List<QuoteModel>>((ref) => loadData());
final isGraphProvider = StateProvider<bool>((ref) => false);
