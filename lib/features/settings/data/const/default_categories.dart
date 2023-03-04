import 'package:random_quote/quotes_repisotory/models/quote_categories_model.dart';
import 'package:random_quote/quotes_repisotory/quote_categories.dart';

final List<QuoteCategoryModel> defaultCategories = QuoteCategory.values
    .map((e) => QuoteCategoryModel(name: e.value, isActive: true))
    .toList();
