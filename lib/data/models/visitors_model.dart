// To parse this JSON data, do
//
//     final visitorsModel = visitorsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'visitors_model.g.dart';

VisitorsModel visitorsModelFromJson(String str) =>
    VisitorsModel.fromJson(json.decode(str));

String visitorsModelToJson(VisitorsModel data) => json.encode(data.toJson());

@JsonSerializable()
class VisitorsModel {
  @JsonKey(name: "visitors")
  final Visitors visitors;

  const VisitorsModel({
    this.visitors = const Visitors(),
  });

  factory VisitorsModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorsModelToJson(this);
}

@JsonSerializable()
class Visitors {
  @JsonKey(name: "free")
  final int free;
  @JsonKey(name: "paid")
  final int paid;

  const Visitors({
    this.free = 0,
    this.paid = 0,
  });

  factory Visitors.fromJson(Map<String, dynamic> json) =>
      _$VisitorsFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorsToJson(this);
}
