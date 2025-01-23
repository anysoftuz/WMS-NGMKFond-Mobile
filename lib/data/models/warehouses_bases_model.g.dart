// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouses_bases_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehousesBasesModel _$WarehousesBasesModelFromJson(
        Map<String, dynamic> json) =>
    WarehousesBasesModel(
      baseWarehouses: (json['base_warehouses'] as List<dynamic>?)
              ?.map((e) => BaseWarehouse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      paginator: json['paginator'] == null
          ? const Paginator()
          : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WarehousesBasesModelToJson(
        WarehousesBasesModel instance) =>
    <String, dynamic>{
      'base_warehouses': instance.baseWarehouses,
      'paginator': instance.paginator,
    };

BaseWarehouse _$BaseWarehouseFromJson(Map<String, dynamic> json) =>
    BaseWarehouse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      base: json['base'] as String,
      capacity: (json['capacity'] as num).toInt(),
      measureUnit: json['measure_unit'] as String,
      status: json['status'] as String,
      workshopName: json['workshop_name'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseWarehouseToJson(BaseWarehouse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base': instance.base,
      'capacity': instance.capacity,
      'measure_unit': instance.measureUnit,
      'status': instance.status,
      'workshop_name': instance.workshopName,
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
