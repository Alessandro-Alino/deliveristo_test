import 'package:freezed_annotation/freezed_annotation.dart';

part 'breeds_model.freezed.dart';
part 'breeds_model.g.dart';

@freezed
class BreedsModel with _$BreedsModel {
  const factory BreedsModel({
    required String breedName,
    required List<String> listSubBreeds,
  }) = _BreedsModel;

  factory BreedsModel.fromJson(Map<String, Object?> json) =>
      _$BreedsModelFromJson(json);
}
