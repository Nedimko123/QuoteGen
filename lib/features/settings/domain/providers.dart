import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/settings/domain/functions/get_quote_categories.dart';
import 'package:random_quote/features/settings/domain/functions/get_quote_notification_time.dart';
import 'package:random_quote/features/settings/domain/functions/get_theme_mode.dart';
import 'package:random_quote/features/settings/domain/models/quote_notification_time.dart';
import 'package:random_quote/quotes_repisotory/models/quote_categories_model.dart';

final isDarkModeProvider = FutureProvider<bool>((ref) => getThemeMode());
final quoteCategoriesProvider =
    FutureProvider<List<QuoteCategoryModel>>((ref) => quoteCategories());

final isQuoteNotificationActiveProvider =
    FutureProvider<QuoteTimeModel?>((ref) => getQuoteNotificationTime());
