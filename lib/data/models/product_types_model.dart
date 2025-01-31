// To parse this JSON data, do
//
//     final productTypesModel = productTypesModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:sklad/data/models/products_bases_model.dart';

part 'product_types_model.g.dart';

ProductTypesModel productTypesModelFromJson(String str) =>
    ProductTypesModel.fromJson(json.decode(str));

String productTypesModelToJson(ProductTypesModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ProductTypesModel {
  @JsonKey(name: "product_types")
  final List<ProductType> productTypes;
  @JsonKey(name: "pagination")
  final Paginator pagination;

  const ProductTypesModel({
    this.productTypes = const [],
    this.pagination = const Paginator(),
  });

  factory ProductTypesModel.fromJson(Map<String, dynamic> json) =>
      _$ProductTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTypesModelToJson(this);
}

@JsonSerializable()
class ProductType {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "parent_name")
  final String parentName;
  @JsonKey(name: "image")
  final dynamic image;
  @JsonKey(name: "ready_to_eat")
  final bool readyToEat;
  @JsonKey(name: "unit")
  final String unit;
  @JsonKey(name: "unit_id")
  final int unitId;

  ProductType({
    required this.id,
    required this.name,
    required this.parentName,
    required this.image,
    required this.readyToEat,
    required this.unit,
    required this.unitId,
  });

  factory ProductType.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTypeToJson(this);
}
