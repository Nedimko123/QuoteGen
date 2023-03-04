import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/history/domain/functions/load_from_db.dart';
import 'package:random_quote/features/homepage/domain/models/bmi_model.dart';

final transactionHistoryProvider =
    FutureProvider<List<BMIModel>>((ref) => loadData());
final isGraphProvider = StateProvider<bool>((ref) => false);
