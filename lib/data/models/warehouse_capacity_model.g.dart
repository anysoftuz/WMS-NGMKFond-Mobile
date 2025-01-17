// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_capacity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseCapacityModel _$WarehouseCapacityModelFromJson(
        Map<String, dynamic> json) =>
    WarehouseCapacityModel(
      totalCapacity: (json['total_capacity'] as num?)?.toInt() ?? 0,
      totalExist: (json['total_exist'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$WarehouseCapacityModelToJson(
        WarehouseCapacityModel instance) =>
    <String, dynamic>{
      'total_capacity': instance.totalCapacity,
      'total_exist': instance.totalExist,
    };
