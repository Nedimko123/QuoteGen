import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_quote/quotes_repisotory/quote_categories.dart';

part 'quote_model.freezed.dart';
part 'quote_model.g.dart';

@freezed
class QuoteModel with _$QuoteModel {
  const factory QuoteModel({
    required String author,
    required String quote,
    required QuoteCategory genre,
  }) = _QuoteModel;

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);
}
