// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListOfBreedModelImpl _$$ListOfBreedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListOfBreedModelImpl(
      message:
          (json['message'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$ListOfBreedModelImplToJson(
        _$ListOfBreedModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
