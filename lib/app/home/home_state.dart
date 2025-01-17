// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus statusVisitors;
  final FormzSubmissionStatus statusWarehouseCapacity;
  final VisitorsModel visitorsModel;
  final WarehouseCapacityModel warehouseCapacityModel;
  const HomeState({
    this.statusVisitors = FormzSubmissionStatus.initial,
    this.statusWarehouseCapacity = FormzSubmissionStatus.initial,
    this.visitorsModel = const VisitorsModel(),
    this.warehouseCapacityModel= const WarehouseCapacityModel(),
  });

  @override
  List<Object> get props => [
        statusVisitors,
        statusWarehouseCapacity,
        visitorsModel,
        warehouseCapacityModel,
      ];

  HomeState copyWith({
    FormzSubmissionStatus? statusVisitors,
    FormzSubmissionStatus? statusWarehouseCapacity,
    VisitorsModel? visitorsModel,
    WarehouseCapacityModel? warehouseCapacityModel,
  }) {
    return HomeState(
      statusVisitors: statusVisitors ?? this.statusVisitors,
      statusWarehouseCapacity: statusWarehouseCapacity ?? this.statusWarehouseCapacity,
      visitorsModel: visitorsModel ?? this.visitorsModel,
      warehouseCapacityModel: warehouseCapacityModel ?? this.warehouseCapacityModel,
    );
  }
}
