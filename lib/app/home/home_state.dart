// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus statusVisitors;
  final FormzSubmissionStatus statusWarehouseCapacity;
  final FormzSubmissionStatus statusDraftsMemo;
  final FormzSubmissionStatus statusRespondents;
  final VisitorsModel visitorsModel;
  final WarehouseCapacityModel warehouseCapacityModel;
  final DraftsMemoModel draftsMemoModel;
  final RespondentsListModel respondentsListModel;
  const HomeState({
    this.statusVisitors = FormzSubmissionStatus.initial,
    this.statusWarehouseCapacity = FormzSubmissionStatus.initial,
    this.statusDraftsMemo = FormzSubmissionStatus.initial,
    this.statusRespondents = FormzSubmissionStatus.initial,
    this.visitorsModel = const VisitorsModel(),
    this.warehouseCapacityModel = const WarehouseCapacityModel(),
    this.draftsMemoModel = const DraftsMemoModel(),
    this.respondentsListModel = const RespondentsListModel(),
  });

  @override
  List<Object> get props => [
        statusVisitors,
        statusWarehouseCapacity,
        statusDraftsMemo,
        statusRespondents,
        visitorsModel,
        warehouseCapacityModel,
        draftsMemoModel,
        respondentsListModel,
      ];

  HomeState copyWith({
    FormzSubmissionStatus? statusVisitors,
    FormzSubmissionStatus? statusWarehouseCapacity,
    FormzSubmissionStatus? statusDraftsMemo,
    FormzSubmissionStatus? statusRespondents,
    VisitorsModel? visitorsModel,
    WarehouseCapacityModel? warehouseCapacityModel,
    DraftsMemoModel? draftsMemoModel,
    RespondentsListModel? respondentsListModel,
  }) {
    return HomeState(
      statusVisitors: statusVisitors ?? this.statusVisitors,
      statusWarehouseCapacity: statusWarehouseCapacity ?? this.statusWarehouseCapacity,
      statusDraftsMemo: statusDraftsMemo ?? this.statusDraftsMemo,
      statusRespondents: statusRespondents ?? this.statusRespondents,
      visitorsModel: visitorsModel ?? this.visitorsModel,
      warehouseCapacityModel: warehouseCapacityModel ?? this.warehouseCapacityModel,
      draftsMemoModel: draftsMemoModel ?? this.draftsMemoModel,
      respondentsListModel: respondentsListModel ?? this.respondentsListModel,
    );
  }
}
