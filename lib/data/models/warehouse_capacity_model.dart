// To parse this JSON data, do
//
//     final warehouseCapacityModel = warehouseCapacityModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'warehouse_capacity_model.g.dart';

WarehouseCapacityModel warehouseCapacityModelFromJson(String str) =>
    WarehouseCapacityModel.fromJson(json.decode(str));

String warehouseCapacityModelToJson(WarehouseCapacityModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class WarehouseCapacityModel {
  @JsonKey(name: "total_capacity")
  final int totalCapacity;
  @JsonKey(name: "total_exist")
  final int totalExist;

  const WarehouseCapacityModel({
    this.totalCapacity = 0,
    this.totalExist = 0,
  });

  factory WarehouseCapacityModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseCapacityModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseCapacityModelToJson(this);
}
