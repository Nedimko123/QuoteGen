// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuoteModel _$QuoteModelFromJson(Map<String, dynamic> json) {
  return _QuoteModel.fromJson(json);
}

/// @nodoc
mixin _$QuoteModel {
  String get author => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  QuoteCategory get quoteCategory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteModelCopyWith<QuoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteModelCopyWith<$Res> {
  factory $QuoteModelCopyWith(
          QuoteModel value, $Res Function(QuoteModel) then) =
      _$QuoteModelCopyWithImpl<$Res, QuoteModel>;
  @useResult
  $Res call({String author, String text, QuoteCategory quoteCategory});
}

/// @nodoc
class _$QuoteModelCopyWithImpl<$Res, $Val extends QuoteModel>
    implements $QuoteModelCopyWith<$Res> {
  _$QuoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? text = null,
    Object? quoteCategory = null,
  }) {
    return _then(_value.copyWith(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      quoteCategory: null == quoteCategory
          ? _value.quoteCategory
          : quoteCategory // ignore: cast_nullable_to_non_nullable
              as QuoteCategory,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuoteModelCopyWith<$Res>
    implements $QuoteModelCopyWith<$Res> {
  factory _$$_QuoteModelCopyWith(
          _$_QuoteModel value, $Res Function(_$_QuoteModel) then) =
      __$$_QuoteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String author, String text, QuoteCategory quoteCategory});
}

/// @nodoc
class __$$_QuoteModelCopyWithImpl<$Res>
    extends _$QuoteModelCopyWithImpl<$Res, _$_QuoteModel>
    implements _$$_QuoteModelCopyWith<$Res> {
  __$$_QuoteModelCopyWithImpl(
      _$_QuoteModel _value, $Res Function(_$_QuoteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? text = null,
    Object? quoteCategory = null,
  }) {
    return _then(_$_QuoteModel(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      quoteCategory: null == quoteCategory
          ? _value.quoteCategory
          : quoteCategory // ignore: cast_nullable_to_non_nullable
              as QuoteCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuoteModel implements _QuoteModel {
  const _$_QuoteModel(
      {required this.author, required this.text, required this.quoteCategory});

  factory _$_QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuoteModelFromJson(json);

  @override
  final String author;
  @override
  final String text;
  @override
  final QuoteCategory quoteCategory;

  @override
  String toString() {
    return 'QuoteModel(author: $author, text: $text, quoteCategory: $quoteCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuoteModel &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.quoteCategory, quoteCategory) ||
                other.quoteCategory == quoteCategory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, author, text, quoteCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuoteModelCopyWith<_$_QuoteModel> get copyWith =>
      __$$_QuoteModelCopyWithImpl<_$_QuoteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuoteModelToJson(
      this,
    );
  }
}

abstract class _QuoteModel implements QuoteModel {
  const factory _QuoteModel(
      {required final String author,
      required final String text,
      required final QuoteCategory quoteCategory}) = _$_QuoteModel;

  factory _QuoteModel.fromJson(Map<String, dynamic> json) =
      _$_QuoteModel.fromJson;

  @override
  String get author;
  @override
  String get text;
  @override
  QuoteCategory get quoteCategory;
  @override
  @JsonKey(ignore: true)
  _$$_QuoteModelCopyWith<_$_QuoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
