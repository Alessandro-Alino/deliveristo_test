// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_of_breed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListOfBreedModel _$ListOfBreedModelFromJson(Map<String, dynamic> json) {
  return _ListOfBreedModel.fromJson(json);
}

/// @nodoc
mixin _$ListOfBreedModel {
  List<String> get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListOfBreedModelCopyWith<ListOfBreedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListOfBreedModelCopyWith<$Res> {
  factory $ListOfBreedModelCopyWith(
          ListOfBreedModel value, $Res Function(ListOfBreedModel) then) =
      _$ListOfBreedModelCopyWithImpl<$Res, ListOfBreedModel>;
  @useResult
  $Res call({List<String> message, String status});
}

/// @nodoc
class _$ListOfBreedModelCopyWithImpl<$Res, $Val extends ListOfBreedModel>
    implements $ListOfBreedModelCopyWith<$Res> {
  _$ListOfBreedModelCopyWithImpl(this._value, this._then);

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
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListOfBreedModelImplCopyWith<$Res>
    implements $ListOfBreedModelCopyWith<$Res> {
  factory _$$ListOfBreedModelImplCopyWith(_$ListOfBreedModelImpl value,
          $Res Function(_$ListOfBreedModelImpl) then) =
      __$$ListOfBreedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> message, String status});
}

/// @nodoc
class __$$ListOfBreedModelImplCopyWithImpl<$Res>
    extends _$ListOfBreedModelCopyWithImpl<$Res, _$ListOfBreedModelImpl>
    implements _$$ListOfBreedModelImplCopyWith<$Res> {
  __$$ListOfBreedModelImplCopyWithImpl(_$ListOfBreedModelImpl _value,
      $Res Function(_$ListOfBreedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$ListOfBreedModelImpl(
      message: null == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListOfBreedModelImpl implements _ListOfBreedModel {
  const _$ListOfBreedModelImpl(
      {required final List<String> message, required this.status})
      : _message = message;

  factory _$ListOfBreedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListOfBreedModelImplFromJson(json);

  final List<String> _message;
  @override
  List<String> get message {
    if (_message is EqualUnmodifiableListView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_message);
  }

  @override
  final String status;

  @override
  String toString() {
    return 'ListOfBreedModel(message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListOfBreedModelImpl &&
            const DeepCollectionEquality().equals(other._message, _message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_message), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListOfBreedModelImplCopyWith<_$ListOfBreedModelImpl> get copyWith =>
      __$$ListOfBreedModelImplCopyWithImpl<_$ListOfBreedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListOfBreedModelImplToJson(
      this,
    );
  }
}

abstract class _ListOfBreedModel implements ListOfBreedModel {
  const factory _ListOfBreedModel(
      {required final List<String> message,
      required final String status}) = _$ListOfBreedModelImpl;

  factory _ListOfBreedModel.fromJson(Map<String, dynamic> json) =
      _$ListOfBreedModelImpl.fromJson;

  @override
  List<String> get message;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$ListOfBreedModelImplCopyWith<_$ListOfBreedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
