import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_notification_time.freezed.dart';
part 'quote_notification_time.g.dart';

@freezed
class QuoteTimeModel with _$QuoteTimeModel {
  const factory QuoteTimeModel({
    required int hours,
    required int minutes,
  }) = _QuoteTimeModel;

  factory QuoteTimeModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteTimeModelFromJson(json);
}
