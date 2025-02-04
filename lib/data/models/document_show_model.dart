// To parse this JSON data, do
//
//     final documentShowModel = documentShowModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'document_show_model.g.dart';

DocumentShowModel documentShowModelFromJson(String str) =>
    DocumentShowModel.fromJson(json.decode(str));

String documentShowModelToJson(DocumentShowModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class DocumentShowModel {
  @JsonKey(name: "document")
  final DocumentShow document;

  const DocumentShowModel({this.document = const DocumentShow()});

  factory DocumentShowModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentShowModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentShowModelToJson(this);
}

@JsonSerializable()
class DocumentShow {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "number")
  final String number;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "to_id")
  final int toId;
  @JsonKey(name: "to_type")
  final String toType;
  @JsonKey(name: "to_name")
  final String toName;
  @JsonKey(name: "to_role_title")
  final String toRoleTitle;
  @JsonKey(name: "from_role_title")
  final String fromRoleTitle;
  @JsonKey(name: "subject")
  final String subject;
  @JsonKey(name: "content")
  final String content;
  @JsonKey(name: "from_id")
  final int fromId;
  @JsonKey(name: "from_type")
  final String fromType;
  @JsonKey(name: "from_name")
  final String fromName;
  @JsonKey(name: "file_link")
  final String fileLink;
  @JsonKey(name: "file_info")
  final FileInfo fileInfo;

  const DocumentShow({
    this.id = '',
    this.type = '',
    this.date = '',
    this.number = '',
    this.status = '',
    this.toId = 0,
    this.toType = '',
    this.toName = '',
    this.subject = '',
    this.content = '',
    this.fromId = 0,
    this.fromType = '',
    this.fromName = '',
    this.fileLink = '',
    this.toRoleTitle = '',
    this.fromRoleTitle = '',
    this.fileInfo = const FileInfo(),
  });

  factory DocumentShow.fromJson(Map<String, dynamic> json) =>
      _$DocumentShowFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentShowToJson(this);
}

@JsonSerializable()
class FileInfo {
  @JsonKey(name: "size")
  final String size;
  @JsonKey(name: "mimeType")
  final String mimeType;
  @JsonKey(name: "name")
  final String name;

  const FileInfo({
    this.size = '',
    this.mimeType = '',
    this.name = '',
  });

  factory FileInfo.fromJson(Map<String, dynamic> json) =>
      _$FileInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FileInfoToJson(this);
}
