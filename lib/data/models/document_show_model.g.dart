// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentShowModel _$DocumentShowModelFromJson(Map<String, dynamic> json) =>
    DocumentShowModel(
      document: json['document'] == null
          ? const DocumentShow()
          : DocumentShow.fromJson(json['document'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DocumentShowModelToJson(DocumentShowModel instance) =>
    <String, dynamic>{
      'document': instance.document,
    };

DocumentShow _$DocumentShowFromJson(Map<String, dynamic> json) => DocumentShow(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      date: json['date'] as String? ?? '',
      number: json['number'] as String? ?? '',
      status: json['status'] as String? ?? '',
      toId: (json['to_id'] as num?)?.toInt() ?? 0,
      toType: json['to_type'] as String? ?? '',
      toName: json['to_name'] as String? ?? '',
      subject: json['subject'] as String? ?? '',
      content: json['content'] as String? ?? '',
      fromId: (json['from_id'] as num?)?.toInt() ?? 0,
      fromType: json['from_type'] as String? ?? '',
      fromName: json['from_name'] as String? ?? '',
      fileLink: json['file_link'] as String? ?? '',
      toRoleTitle: json['to_role_title'] as String? ?? '',
      fromRoleTitle: json['from_role_title'] as String? ?? '',
      fileInfo: json['file_info'] == null
          ? const FileInfo()
          : FileInfo.fromJson(json['file_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DocumentShowToJson(DocumentShow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'date': instance.date,
      'number': instance.number,
      'status': instance.status,
      'to_id': instance.toId,
      'to_type': instance.toType,
      'to_name': instance.toName,
      'to_role_title': instance.toRoleTitle,
      'from_role_title': instance.fromRoleTitle,
      'subject': instance.subject,
      'content': instance.content,
      'from_id': instance.fromId,
      'from_type': instance.fromType,
      'from_name': instance.fromName,
      'file_link': instance.fileLink,
      'file_info': instance.fileInfo,
    };

FileInfo _$FileInfoFromJson(Map<String, dynamic> json) => FileInfo(
      size: json['size'] as String? ?? '',
      mimeType: json['mimeType'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$FileInfoToJson(FileInfo instance) => <String, dynamic>{
      'size': instance.size,
      'mimeType': instance.mimeType,
      'name': instance.name,
    };
