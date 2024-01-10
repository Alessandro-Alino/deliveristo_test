// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_breed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SingleBreedModel _$SingleBreedModelFromJson(Map<String, dynamic> json) {
  return _SingleBreedModel.fromJson(json);
}

/// @nodoc
mixin _$SingleBreedModel {
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleBreedModelCopyWith<SingleBreedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleBreedModelCopyWith<$Res> {
  factory $SingleBreedModelCopyWith(
          SingleBreedModel value, $Res Function(SingleBreedModel) then) =
      _$SingleBreedModelCopyWithImpl<$Res, SingleBreedModel>;
  @useResult
  $Res call({String message, String status});
}

/// @nodoc
class _$SingleBreedModelCopyWithImpl<$Res, $Val extends SingleBreedModel>
    implements $SingleBreedModelCopyWith<$Res> {
  _$SingleBreedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingleBreedModelImplCopyWith<$Res>
    implements $SingleBreedModelCopyWith<$Res> {
  factory _$$SingleBreedModelImplCopyWith(_$SingleBreedModelImpl value,
          $Res Function(_$SingleBreedModelImpl) then) =
      __$$SingleBreedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String status});
}

/// @nodoc
class __$$SingleBreedModelImplCopyWithImpl<$Res>
    extends _$SingleBreedModelCopyWithImpl<$Res, _$SingleBreedModelImpl>
    implements _$$SingleBreedModelImplCopyWith<$Res> {
  __$$SingleBreedModelImplCopyWithImpl(_$SingleBreedModelImpl _value,
      $Res Function(_$SingleBreedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$SingleBreedModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleBreedModelImpl implements _SingleBreedModel {
  const _$SingleBreedModelImpl({required this.message, required this.status});

  factory _$SingleBreedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleBreedModelImplFromJson(json);

  @override
  final String message;
  @override
  final String status;

  @override
  String toString() {
    return 'SingleBreedModel(message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleBreedModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleBreedModelImplCopyWith<_$SingleBreedModelImpl> get copyWith =>
      __$$SingleBreedModelImplCopyWithImpl<_$SingleBreedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleBreedModelImplToJson(
      this,
    );
  }
}

abstract class _SingleBreedModel implements SingleBreedModel {
  const factory _SingleBreedModel(
      {required final String message,
      required final String status}) = _$SingleBreedModelImpl;

  factory _SingleBreedModel.fromJson(Map<String, dynamic> json) =
      _$SingleBreedModelImpl.fromJson;

  @override
  String get message;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$SingleBreedModelImplCopyWith<_$SingleBreedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
