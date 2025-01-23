// To parse this JSON data, do
//
//     final managementsBasesModel = managementsBasesModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'managements_bases_model.g.dart';

ManagementsBasesModel managementsBasesModelFromJson(String str) =>
    ManagementsBasesModel.fromJson(json.decode(str));

String managementsBasesModelToJson(ManagementsBasesModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ManagementsBasesModel {
  @JsonKey(name: "managements")
  final List<Management> managements;

  const ManagementsBasesModel({this.managements = const []});

  factory ManagementsBasesModel.fromJson(Map<String, dynamic> json) =>
      _$ManagementsBasesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManagementsBasesModelToJson(this);
}

@JsonSerializable()
class Management {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "bases")
  final List<Base> bases;

  Management({
    required this.id,
    required this.name,
    required this.bases,
  });

  factory Management.fromJson(Map<String, dynamic> json) =>
      _$ManagementFromJson(json);

  Map<String, dynamic> toJson() => _$ManagementToJson(this);
}

@JsonSerializable()
class Base {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;

  Base({
    required this.id,
    required this.name,
  });

  factory Base.fromJson(Map<String, dynamic> json) => _$BaseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseToJson(this);
}
