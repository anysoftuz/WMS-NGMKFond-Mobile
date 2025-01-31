// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductTypesModel _$ProductTypesModelFromJson(Map<String, dynamic> json) =>
    ProductTypesModel(
      productTypes: (json['product_types'] as List<dynamic>?)
              ?.map((e) => ProductType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pagination: json['pagination'] == null
          ? const Paginator()
          : Paginator.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductTypesModelToJson(ProductTypesModel instance) =>
    <String, dynamic>{
      'product_types': instance.productTypes,
      'pagination': instance.pagination,
    };

ProductType _$ProductTypeFromJson(Map<String, dynamic> json) => ProductType(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      parentName: json['parent_name'] as String,
      image: json['image'],
      readyToEat: json['ready_to_eat'] as bool,
      unit: json['unit'] as String,
      unitId: (json['unit_id'] as num).toInt(),
    );

Map<String, dynamic> _$ProductTypeToJson(ProductType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parent_name': instance.parentName,
      'image': instance.image,
      'ready_to_eat': instance.readyToEat,
      'unit': instance.unit,
      'unit_id': instance.unitId,
    };
