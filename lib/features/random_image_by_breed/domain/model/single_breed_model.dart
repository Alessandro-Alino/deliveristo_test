import 'package:freezed_annotation/freezed_annotation.dart';

part 'single_breed_model.freezed.dart';
part 'single_breed_model.g.dart';

@freezed
class SingleBreedModel with _$SingleBreedModel {
  const factory SingleBreedModel({
    required String message,
    required String status,
  }) = _SingleBreedModel;

  factory SingleBreedModel.fromJson(Map<String, Object?> json) =>
      _$SingleBreedModelFromJson(json);
}
