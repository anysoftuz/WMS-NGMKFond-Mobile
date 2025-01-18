// To parse this JSON data, do
//
//     final respondentsListModel = respondentsListModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'respondents_list_model.g.dart';

RespondentsListModel respondentsListModelFromJson(String str) =>
    RespondentsListModel.fromJson(json.decode(str));

String respondentsListModelToJson(RespondentsListModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class RespondentsListModel {
  @JsonKey(name: "respondents")
  final List<Respondent> respondents;

 const RespondentsListModel({
    this.respondents = const [],
  });

  factory RespondentsListModel.fromJson(Map<String, dynamic> json) =>
      _$RespondentsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$RespondentsListModelToJson(this);
}

@JsonSerializable()
class Respondent {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "model_type")
  final String modelType;

  Respondent({
    required this.id,
    required this.name,
    required this.modelType,
  });

  factory Respondent.fromJson(Map<String, dynamic> json) =>
      _$RespondentFromJson(json);

  Map<String, dynamic> toJson() => _$RespondentToJson(this);
}
