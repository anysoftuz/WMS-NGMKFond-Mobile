// To parse this JSON data, do
//
//     final warehousesBasesModel = warehousesBasesModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:sklad/data/models/products_bases_model.dart';

part 'warehouses_bases_model.g.dart';

WarehousesBasesModel warehousesBasesModelFromJson(String str) =>
    WarehousesBasesModel.fromJson(json.decode(str));

String warehousesBasesModelToJson(WarehousesBasesModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class WarehousesBasesModel {
  @JsonKey(name: "base_warehouses")
  final List<BaseWarehouse> baseWarehouses;
  @JsonKey(name: "paginator")
  final Paginator paginator;

  const WarehousesBasesModel({
    this.baseWarehouses = const [],
    this.paginator = const Paginator(),
  });

  factory WarehousesBasesModel.fromJson(Map<String, dynamic> json) =>
      _$WarehousesBasesModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarehousesBasesModelToJson(this);
}

@JsonSerializable()
class BaseWarehouse {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "base")
  final String base;
  @JsonKey(name: "capacity")
  final int capacity;
  @JsonKey(name: "measure_unit")
  final String measureUnit;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "workshop_name")
  final String workshopName;
  @JsonKey(name: "products")
  final List<Product> products;

  BaseWarehouse({
    required this.id,
    required this.name,
    required this.base,
    required this.capacity,
    required this.measureUnit,
    required this.status,
    required this.workshopName,
    required this.products,
  });

  factory BaseWarehouse.fromJson(Map<String, dynamic> json) =>
      _$BaseWarehouseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseWarehouseToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;

  Product({
    required this.id,
    required this.name,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
