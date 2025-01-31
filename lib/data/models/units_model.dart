// To parse this JSON data, do
//
//     final unitsModel = unitsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'units_model.g.dart';

UnitsModel unitsModelFromJson(String str) => UnitsModel.fromJson(json.decode(str));

String unitsModelToJson(UnitsModel data) => json.encode(data.toJson());

@JsonSerializable()
class UnitsModel {
    @JsonKey(name: "units")
    final List<Unit> units;

    UnitsModel({
        required this.units,
    });

    factory UnitsModel.fromJson(Map<String, dynamic> json) => _$UnitsModelFromJson(json);

    Map<String, dynamic> toJson() => _$UnitsModelToJson(this);
}

@JsonSerializable()
class Unit {
    @JsonKey(name: "id")
    final int id;
    @JsonKey(name: "name")
    final String name;
    @JsonKey(name: "unit")
    final String unit;
    @JsonKey(name: "precision")
    final dynamic precision;

    Unit({
        required this.id,
        required this.name,
        required this.unit,
        required this.precision,
    });

    factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

    Map<String, dynamic> toJson() => _$UnitToJson(this);
}
