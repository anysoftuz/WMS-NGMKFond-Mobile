// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoriesModel _$ProductCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoriesModel(
      productCategories: (json['product_categories'] as List<dynamic>?)
              ?.map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ProductCategoriesModelToJson(
        ProductCategoriesModel instance) =>
    <String, dynamic>{
      'product_categories': instance.productCategories,
    };

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) =>
    ProductCategory(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProductCategoryToJson(ProductCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
