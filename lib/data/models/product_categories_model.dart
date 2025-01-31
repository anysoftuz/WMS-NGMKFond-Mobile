// To parse this JSON data, do
//
//     final productCategoriesModel = productCategoriesModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'product_categories_model.g.dart';

ProductCategoriesModel productCategoriesModelFromJson(String str) =>
    ProductCategoriesModel.fromJson(json.decode(str));

String productCategoriesModelToJson(ProductCategoriesModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ProductCategoriesModel {
  @JsonKey(name: "product_categories")
  final List<ProductCategory> productCategories;

 const ProductCategoriesModel({this.productCategories = const []});

  factory ProductCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoriesModelToJson(this);
}

@JsonSerializable()
class ProductCategory {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;

  ProductCategory({
    required this.id,
    required this.name,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}
