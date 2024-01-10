import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_of_breed_model.freezed.dart';
part 'list_of_breed_model.g.dart';

@freezed
class ListOfBreedModel with _$ListOfBreedModel {
  const factory ListOfBreedModel({
    required List<String> message,
    required String status,
  }) = _ListOfBreedModel;

  factory ListOfBreedModel.fromJson(Map<String, Object?> json) =>
      _$ListOfBreedModelFromJson(json);
}
