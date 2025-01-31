// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitsModel _$UnitsModelFromJson(Map<String, dynamic> json) => UnitsModel(
      units: (json['units'] as List<dynamic>)
          .map((e) => Unit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UnitsModelToJson(UnitsModel instance) =>
    <String, dynamic>{
      'units': instance.units,
    };

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      unit: json['unit'] as String,
      precision: json['precision'],
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': instance.unit,
      'precision': instance.precision,
    };
