import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.g.dart';
part 'response_model.freezed.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    required Map<String, List<String>> message,
    required String status,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, Object?> json) =>
      _$ResponseModelFromJson(json);
}
