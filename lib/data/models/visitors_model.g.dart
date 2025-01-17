// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorsModel _$VisitorsModelFromJson(Map<String, dynamic> json) =>
    VisitorsModel(
      visitors: json['visitors'] == null
          ? const Visitors()
          : Visitors.fromJson(json['visitors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VisitorsModelToJson(VisitorsModel instance) =>
    <String, dynamic>{
      'visitors': instance.visitors,
    };

Visitors _$VisitorsFromJson(Map<String, dynamic> json) => Visitors(
      free: (json['free'] as num?)?.toInt() ?? 0,
      paid: (json['paid'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$VisitorsToJson(Visitors instance) => <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
