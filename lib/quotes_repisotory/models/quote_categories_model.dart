import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_categories_model.freezed.dart';
part 'quote_categories_model.g.dart';

@freezed
class QuoteCategoryModel with _$QuoteCategoryModel {
  const factory QuoteCategoryModel({
    required String name,
    required bool isActive,
  }) = _QuoteCategoryModel;

  factory QuoteCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteCategoryModelFromJson(json);
}
