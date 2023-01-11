// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tips.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tips _$TipsFromJson(Map<String, dynamic> json) {
  return _Tips.fromJson(json);
}

/// @nodoc
mixin _$Tips {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TipsCopyWith<Tips> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipsCopyWith<$Res> {
  factory $TipsCopyWith(Tips value, $Res Function(Tips) then) =
      _$TipsCopyWithImpl<$Res, Tips>;
  @useResult
  $Res call({String id, String name, String detail, String category});
}

/// @nodoc
class _$TipsCopyWithImpl<$Res, $Val extends Tips>
    implements $TipsCopyWith<$Res> {
  _$TipsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? detail = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TipsCopyWith<$Res> implements $TipsCopyWith<$Res> {
  factory _$$_TipsCopyWith(_$_Tips value, $Res Function(_$_Tips) then) =
      __$$_TipsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String detail, String category});
}

/// @nodoc
class __$$_TipsCopyWithImpl<$Res> extends _$TipsCopyWithImpl<$Res, _$_Tips>
    implements _$$_TipsCopyWith<$Res> {
  __$$_TipsCopyWithImpl(_$_Tips _value, $Res Function(_$_Tips) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? detail = null,
    Object? category = null,
  }) {
    return _then(_$_Tips(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tips implements _Tips {
  _$_Tips(
      {required this.id,
      required this.name,
      required this.detail,
      required this.category});

  factory _$_Tips.fromJson(Map<String, dynamic> json) => _$$_TipsFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String detail;
  @override
  final String category;

  @override
  String toString() {
    return 'Tips(id: $id, name: $name, detail: $detail, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tips &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, detail, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TipsCopyWith<_$_Tips> get copyWith =>
      __$$_TipsCopyWithImpl<_$_Tips>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TipsToJson(
      this,
    );
  }
}

abstract class _Tips implements Tips {
  factory _Tips(
      {required final String id,
      required final String name,
      required final String detail,
      required final String category}) = _$_Tips;

  factory _Tips.fromJson(Map<String, dynamic> json) = _$_Tips.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get detail;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_TipsCopyWith<_$_Tips> get copyWith => throw _privateConstructorUsedError;
}
