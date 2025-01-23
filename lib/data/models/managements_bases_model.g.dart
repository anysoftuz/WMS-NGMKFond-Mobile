// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managements_bases_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagementsBasesModel _$ManagementsBasesModelFromJson(
        Map<String, dynamic> json) =>
    ManagementsBasesModel(
      managements: (json['managements'] as List<dynamic>?)
              ?.map((e) => Management.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ManagementsBasesModelToJson(
        ManagementsBasesModel instance) =>
    <String, dynamic>{
      'managements': instance.managements,
    };

Management _$ManagementFromJson(Map<String, dynamic> json) => Management(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      bases: (json['bases'] as List<dynamic>)
          .map((e) => Base.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ManagementToJson(Management instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bases': instance.bases,
    };

Base _$BaseFromJson(Map<String, dynamic> json) => Base(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$BaseToJson(Base instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
