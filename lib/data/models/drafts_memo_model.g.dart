// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drafts_memo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DraftsMemoModel _$DraftsMemoModelFromJson(Map<String, dynamic> json) =>
    DraftsMemoModel(
      documents: (json['documents'] as List<dynamic>?)
              ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      paginator: json['paginator'] == null
          ? const Paginator()
          : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DraftsMemoModelToJson(DraftsMemoModel instance) =>
    <String, dynamic>{
      'documents': instance.documents,
      'paginator': instance.paginator,
    };

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      number: json['number'] as String,
      subject: json['subject'] as String? ?? '',
      status: json['status'] as String,
      fromName: json['from_name'] as String,
      toName: json['to_name'] as String,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'number': instance.number,
      'subject': instance.subject,
      'status': instance.status,
      'from_name': instance.fromName,
      'to_name': instance.toName,
    };

Paginator _$PaginatorFromJson(Map<String, dynamic> json) => Paginator(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 0,
      perPage: (json['per_page'] as num?)?.toInt() ?? 0,
      hasMore: json['has_more'] as bool? ?? false,
      itemsCount: (json['items_count'] as num?)?.toInt() ?? 0,
      totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
      pagesCount: (json['pages_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PaginatorToJson(Paginator instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'has_more': instance.hasMore,
      'items_count': instance.itemsCount,
      'total_count': instance.totalCount,
      'pages_count': instance.pagesCount,
    };
