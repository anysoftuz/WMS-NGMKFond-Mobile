// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respondents_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RespondentsListModel _$RespondentsListModelFromJson(
        Map<String, dynamic> json) =>
    RespondentsListModel(
      respondents: (json['respondents'] as List<dynamic>?)
              ?.map((e) => Respondent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RespondentsListModelToJson(
        RespondentsListModel instance) =>
    <String, dynamic>{
      'respondents': instance.respondents,
    };

Respondent _$RespondentFromJson(Map<String, dynamic> json) => Respondent(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      modelType: json['model_type'] as String,
    );

Map<String, dynamic> _$RespondentToJson(Respondent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'model_type': instance.modelType,
    };
