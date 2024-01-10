// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BreedsModelImpl _$$BreedsModelImplFromJson(Map<String, dynamic> json) =>
    _$BreedsModelImpl(
      breedName: json['breedName'] as String,
      listSubBreeds: (json['listSubBreeds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$BreedsModelImplToJson(_$BreedsModelImpl instance) =>
    <String, dynamic>{
      'breedName': instance.breedName,
      'listSubBreeds': instance.listSubBreeds,
    };
