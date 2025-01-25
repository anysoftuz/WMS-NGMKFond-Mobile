// ignore_for_file: public_member_api_docs, sort_constructors_first
class FilterModel {
  String? fromDate;
  String? toDate;
  String? number;
  String? subject;
  int? toId;
  int? fromId;
  String? docType;

  FilterModel({
    this.fromDate,
    this.toDate,
    this.number,
    this.subject,
    this.toId,
    this.fromId,
    this.docType,
  });

  FilterModel.fromJson(Map<String, dynamic> json) {
    fromDate = json['from_date'];
    toDate = json['to_date'];
    number = json['number'];
    subject = json['subject'];
    toId = json['to_id'];
    fromId = json['from_id'];
    docType = json['doc_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['number'] = number;
    data['subject'] = subject;
    data['to_id'] = toId;
    data['doc_type'] = docType;
    return data;
  }

  FilterModel copyWith({
    String? fromDate,
    String? toDate,
    String? number,
    String? subject,
    int? toId,
    int? fromId,
    String? docType,
  }) {
    return FilterModel(
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      number: number ?? this.number,
      subject: subject ?? this.subject,
      toId: toId ?? this.toId,
      fromId: fromId ?? this.fromId,
      docType: docType ?? this.docType,
    );
  }
}
