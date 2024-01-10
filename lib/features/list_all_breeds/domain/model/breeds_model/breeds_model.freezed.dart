// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breeds_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BreedsModel _$BreedsModelFromJson(Map<String, dynamic> json) {
  return _BreedsModel.fromJson(json);
}

/// @nodoc
mixin _$BreedsModel {
  String get breedName => throw _privateConstructorUsedError;
  List<String> get listSubBreeds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BreedsModelCopyWith<BreedsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedsModelCopyWith<$Res> {
  factory $BreedsModelCopyWith(
          BreedsModel value, $Res Function(BreedsModel) then) =
      _$BreedsModelCopyWithImpl<$Res, BreedsModel>;
  @useResult
  $Res call({String breedName, List<String> listSubBreeds});
}

/// @nodoc
class _$BreedsModelCopyWithImpl<$Res, $Val extends BreedsModel>
    implements $BreedsModelCopyWith<$Res> {
  _$BreedsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breedName = null,
    Object? listSubBreeds = null,
  }) {
    return _then(_value.copyWith(
      breedName: null == breedName
          ? _value.breedName
          : breedName // ignore: cast_nullable_to_non_nullable
              as String,
      listSubBreeds: null == listSubBreeds
          ? _value.listSubBreeds
          : listSubBreeds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BreedsModelImplCopyWith<$Res>
    implements $BreedsModelCopyWith<$Res> {
  factory _$$BreedsModelImplCopyWith(
          _$BreedsModelImpl value, $Res Function(_$BreedsModelImpl) then) =
      __$$BreedsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String breedName, List<String> listSubBreeds});
}

/// @nodoc
class __$$BreedsModelImplCopyWithImpl<$Res>
    extends _$BreedsModelCopyWithImpl<$Res, _$BreedsModelImpl>
    implements _$$BreedsModelImplCopyWith<$Res> {
  __$$BreedsModelImplCopyWithImpl(
      _$BreedsModelImpl _value, $Res Function(_$BreedsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breedName = null,
    Object? listSubBreeds = null,
  }) {
    return _then(_$BreedsModelImpl(
      breedName: null == breedName
          ? _value.breedName
          : breedName // ignore: cast_nullable_to_non_nullable
              as String,
      listSubBreeds: null == listSubBreeds
          ? _value._listSubBreeds
          : listSubBreeds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BreedsModelImpl implements _BreedsModel {
  const _$BreedsModelImpl(
      {required this.breedName, required final List<String> listSubBreeds})
      : _listSubBreeds = listSubBreeds;

  factory _$BreedsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreedsModelImplFromJson(json);

  @override
  final String breedName;
  final List<String> _listSubBreeds;
  @override
  List<String> get listSubBreeds {
    if (_listSubBreeds is EqualUnmodifiableListView) return _listSubBreeds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listSubBreeds);
  }

  @override
  String toString() {
    return 'BreedsModel(breedName: $breedName, listSubBreeds: $listSubBreeds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreedsModelImpl &&
            (identical(other.breedName, breedName) ||
                other.breedName == breedName) &&
            const DeepCollectionEquality()
                .equals(other._listSubBreeds, _listSubBreeds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, breedName,
      const DeepCollectionEquality().hash(_listSubBreeds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BreedsModelImplCopyWith<_$BreedsModelImpl> get copyWith =>
      __$$BreedsModelImplCopyWithImpl<_$BreedsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreedsModelImplToJson(
      this,
    );
  }
}

abstract class _BreedsModel implements BreedsModel {
  const factory _BreedsModel(
      {required final String breedName,
      required final List<String> listSubBreeds}) = _$BreedsModelImpl;

  factory _BreedsModel.fromJson(Map<String, dynamic> json) =
      _$BreedsModelImpl.fromJson;

  @override
  String get breedName;
  @override
  List<String> get listSubBreeds;
  @override
  @JsonKey(ignore: true)
  _$$BreedsModelImplCopyWith<_$BreedsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
