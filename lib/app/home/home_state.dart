// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus statusVisitors;
  final FormzSubmissionStatus statusWarehouseCapacity;
  final FormzSubmissionStatus statusDraftsMemo;
  final VisitorsModel visitorsModel;
  final WarehouseCapacityModel warehouseCapacityModel;
  final DraftsMemoModel draftsMemoModel;
  const HomeState({
    this.statusVisitors = FormzSubmissionStatus.initial,
    this.statusWarehouseCapacity = FormzSubmissionStatus.initial,
    this.statusDraftsMemo = FormzSubmissionStatus.initial,
    this.visitorsModel = const VisitorsModel(),
    this.warehouseCapacityModel = const WarehouseCapacityModel(),
    this.draftsMemoModel = const DraftsMemoModel(),
  });

  @override
  List<Object> get props => [
        statusVisitors,
        statusWarehouseCapacity,
        statusDraftsMemo,
        visitorsModel,
        warehouseCapacityModel,
        draftsMemoModel,
      ];

  HomeState copyWith({
    FormzSubmissionStatus? statusVisitors,
    FormzSubmissionStatus? statusWarehouseCapacity,
    FormzSubmissionStatus? statusDraftsMemo,
    VisitorsModel? visitorsModel,
    WarehouseCapacityModel? warehouseCapacityModel,
    DraftsMemoModel? draftsMemoModel,
  }) {
    return HomeState(
      statusVisitors: statusVisitors ?? this.statusVisitors,
      statusWarehouseCapacity: statusWarehouseCapacity ?? this.statusWarehouseCapacity,
      statusDraftsMemo: statusDraftsMemo ?? this.statusDraftsMemo,
      visitorsModel: visitorsModel ?? this.visitorsModel,
      warehouseCapacityModel: warehouseCapacityModel ?? this.warehouseCapacityModel,
      draftsMemoModel: draftsMemoModel ?? this.draftsMemoModel,
    );
  }
}
