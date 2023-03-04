// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_categories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuoteCategoryModel _$QuoteCategoryModelFromJson(Map<String, dynamic> json) {
  return _QuoteCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$QuoteCategoryModel {
  String get name => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteCategoryModelCopyWith<QuoteCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteCategoryModelCopyWith<$Res> {
  factory $QuoteCategoryModelCopyWith(
          QuoteCategoryModel value, $Res Function(QuoteCategoryModel) then) =
      _$QuoteCategoryModelCopyWithImpl<$Res, QuoteCategoryModel>;
  @useResult
  $Res call({String name, bool isActive});
}

/// @nodoc
class _$QuoteCategoryModelCopyWithImpl<$Res, $Val extends QuoteCategoryModel>
    implements $QuoteCategoryModelCopyWith<$Res> {
  _$QuoteCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuoteCategoryModelCopyWith<$Res>
    implements $QuoteCategoryModelCopyWith<$Res> {
  factory _$$_QuoteCategoryModelCopyWith(_$_QuoteCategoryModel value,
          $Res Function(_$_QuoteCategoryModel) then) =
      __$$_QuoteCategoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool isActive});
}

/// @nodoc
class __$$_QuoteCategoryModelCopyWithImpl<$Res>
    extends _$QuoteCategoryModelCopyWithImpl<$Res, _$_QuoteCategoryModel>
    implements _$$_QuoteCategoryModelCopyWith<$Res> {
  __$$_QuoteCategoryModelCopyWithImpl(
      _$_QuoteCategoryModel _value, $Res Function(_$_QuoteCategoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isActive = null,
  }) {
    return _then(_$_QuoteCategoryModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuoteCategoryModel implements _QuoteCategoryModel {
  const _$_QuoteCategoryModel({required this.name, required this.isActive});

  factory _$_QuoteCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuoteCategoryModelFromJson(json);

  @override
  final String name;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'QuoteCategoryModel(name: $name, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuoteCategoryModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuoteCategoryModelCopyWith<_$_QuoteCategoryModel> get copyWith =>
      __$$_QuoteCategoryModelCopyWithImpl<_$_QuoteCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuoteCategoryModelToJson(
      this,
    );
  }
}

abstract class _QuoteCategoryModel implements QuoteCategoryModel {
  const factory _QuoteCategoryModel(
      {required final String name,
      required final bool isActive}) = _$_QuoteCategoryModel;

  factory _QuoteCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_QuoteCategoryModel.fromJson;

  @override
  String get name;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_QuoteCategoryModelCopyWith<_$_QuoteCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
