// To parse this JSON data, do
//
//     final productsBasesModel = productsBasesModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'products_bases_model.g.dart';

ProductsBasesModel productsBasesModelFromJson(String str) =>
    ProductsBasesModel.fromJson(json.decode(str));

String productsBasesModelToJson(ProductsBasesModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ProductsBasesModel {
  @JsonKey(name: "warehouse_products")
  final List<WarehouseProduct> warehouseProducts;
  @JsonKey(name: "paginator")
  final Paginator paginator;

  const ProductsBasesModel({
    this.warehouseProducts = const [],
    this.paginator = const Paginator(),
  });

  factory ProductsBasesModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsBasesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsBasesModelToJson(this);
}

@JsonSerializable()
class Paginator {
  @JsonKey(name: "current_page")
  final int currentPage;
  @JsonKey(name: "per_page")
  final int perPage;
  @JsonKey(name: "has_more")
  final bool hasMore;
  @JsonKey(name: "items_count")
  final int itemsCount;
  @JsonKey(name: "total_count")
  final int totalCount;
  @JsonKey(name: "pages_count")
  final int pagesCount;

  const Paginator({
    this.currentPage = 0,
    this.perPage = 0,
    this.hasMore = false,
    this.itemsCount = 0,
    this.totalCount = 0,
    this.pagesCount = 0,
  });

  factory Paginator.fromJson(Map<String, dynamic> json) =>
      _$PaginatorFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatorToJson(this);
}

@JsonSerializable()
class WarehouseProduct {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "product")
  final Product product;
  @JsonKey(name: "quantity")
  final int quantity;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "price_formatted")
  final String priceFormatted;

  WarehouseProduct({
    required this.id,
    required this.product,
    required this.quantity,
    required this.price,
    required this.priceFormatted,
  });

  factory WarehouseProduct.fromJson(Map<String, dynamic> json) =>
      _$WarehouseProductFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseProductToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "measure")
  final String measure;

  Product({
    required this.id,
    required this.name,
    required this.measure,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
