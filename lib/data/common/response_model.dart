import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseModel<T> {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "error")
  final dynamic error;
  @JsonKey(name: "data")
  final T? data;

  ResponseModel({
    required this.error,
    required this.data,
    required this.success,
  });

  /// JSON dan obyektni yaratish
  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fetch,
  ) =>
      _$ResponseModelFromJson(json, fetch);

  /// JSON ga obyektni o'girish
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ResponseModelToJson(this, toJsonT);
}
