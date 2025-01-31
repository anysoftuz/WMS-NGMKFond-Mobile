// To parse this JSON data, do
//
//     final draftsMemoModel = draftsMemoModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:sklad/data/models/products_bases_model.dart';

part 'drafts_memo_model.g.dart';

DraftsMemoModel draftsMemoModelFromJson(String str) =>
    DraftsMemoModel.fromJson(json.decode(str));

String draftsMemoModelToJson(DraftsMemoModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class DraftsMemoModel {
  @JsonKey(name: "documents")
  final List<Document> documents;
  @JsonKey(name: "paginator")
  final Paginator paginator;

  const DraftsMemoModel({
    this.documents = const [],
    this.paginator = const Paginator(),
  });

  factory DraftsMemoModel.fromJson(Map<String, dynamic> json) =>
      _$DraftsMemoModelFromJson(json);

  Map<String, dynamic> toJson() => _$DraftsMemoModelToJson(this);
}

@JsonSerializable()
class Document {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "date")
  final DateTime date;
  @JsonKey(name: "number")
  final String number;
  @JsonKey(name: "subject")
  final String subject;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "from_name")
  final String fromName;
  @JsonKey(name: "to_name")
  final String toName;
  @JsonKey(name: "basis")
  final String basis;

  Document({
    required this.id,
    required this.date,
    required this.number,
    this.subject = '',
    this.basis = '',
    required this.status,
    required this.fromName,
    required this.toName,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
