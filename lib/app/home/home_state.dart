// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus statusVisitors;
  final FormzSubmissionStatus statusWarehouseCapacity;
  final FormzSubmissionStatus statusDraftsMemo;
  final FormzSubmissionStatus statusRespondents;
  final FormzSubmissionStatus statusBase;
  final FormzSubmissionStatus statusBaseProduct;
  final FormzSubmissionStatus statusBaseInvoices;
  final FormzSubmissionStatus statusWarehouses;
  final FormzSubmissionStatus status;
  final FormzSubmissionStatus statusShow;
  final VisitorsModel visitorsModel;
  final WarehouseCapacityModel warehouseCapacityModel;
  final DraftsMemoModel draftsMemoModel;
  final RespondentsListModel respondentsListModel;
  final ManagementsBasesModel managementsBasesModel;
  final ProductsBasesModel productsBasesModel;
  final WarehousesBasesModel warehousesBasesModel;
  final ProductsBasesModel invoicesBasesModel;
  final num fillingPercentage;
  final int warehousesSel;
  const HomeState({
    this.status = FormzSubmissionStatus.initial,
    this.statusShow = FormzSubmissionStatus.initial,
    this.statusVisitors = FormzSubmissionStatus.initial,
    this.statusWarehouseCapacity = FormzSubmissionStatus.initial,
    this.statusDraftsMemo = FormzSubmissionStatus.initial,
    this.statusRespondents = FormzSubmissionStatus.initial,
    this.statusBase = FormzSubmissionStatus.initial,
    this.statusBaseProduct = FormzSubmissionStatus.initial,
    this.statusWarehouses = FormzSubmissionStatus.initial,
    this.statusBaseInvoices = FormzSubmissionStatus.initial,
    this.visitorsModel = const VisitorsModel(),
    this.warehouseCapacityModel = const WarehouseCapacityModel(),
    this.draftsMemoModel = const DraftsMemoModel(),
    this.respondentsListModel = const RespondentsListModel(),
    this.managementsBasesModel = const ManagementsBasesModel(),
    this.productsBasesModel = const ProductsBasesModel(),
    this.warehousesBasesModel = const WarehousesBasesModel(),
    this.invoicesBasesModel = const ProductsBasesModel(),
    this.fillingPercentage = 0,
    this.warehousesSel = 0,
  });

  @override
  List<Object> get props => [
        status,
        statusShow,
        statusVisitors,
        statusWarehouseCapacity,
        statusDraftsMemo,
        statusRespondents,
        statusBaseProduct,
        statusWarehouses,
        statusBaseInvoices,
        visitorsModel,
        warehouseCapacityModel,
        draftsMemoModel,
        respondentsListModel,
        statusBase,
        managementsBasesModel,
        productsBasesModel,
        invoicesBasesModel,
        warehousesBasesModel,
        fillingPercentage,
        warehousesSel,
      ];

  HomeState copyWith({
    FormzSubmissionStatus? statusVisitors,
    FormzSubmissionStatus? statusWarehouseCapacity,
    FormzSubmissionStatus? statusDraftsMemo,
    FormzSubmissionStatus? statusRespondents,
    FormzSubmissionStatus? statusBase,
    FormzSubmissionStatus? statusBaseProduct,
    FormzSubmissionStatus? statusBaseInvoices,
    FormzSubmissionStatus? statusWarehouses,
    FormzSubmissionStatus? status,
    FormzSubmissionStatus? statusShow,
    VisitorsModel? visitorsModel,
    WarehouseCapacityModel? warehouseCapacityModel,
    DraftsMemoModel? draftsMemoModel,
    RespondentsListModel? respondentsListModel,
    ManagementsBasesModel? managementsBasesModel,
    ProductsBasesModel? productsBasesModel,
    WarehousesBasesModel? warehousesBasesModel,
    ProductsBasesModel? invoicesBasesModel,
    num? fillingPercentage,
    int? warehousesSel,
  }) {
    return HomeState(
      statusVisitors: statusVisitors ?? this.statusVisitors,
      statusWarehouseCapacity: statusWarehouseCapacity ?? this.statusWarehouseCapacity,
      statusDraftsMemo: statusDraftsMemo ?? this.statusDraftsMemo,
      statusRespondents: statusRespondents ?? this.statusRespondents,
      statusBase: statusBase ?? this.statusBase,
      statusBaseProduct: statusBaseProduct ?? this.statusBaseProduct,
      statusBaseInvoices: statusBaseInvoices ?? this.statusBaseInvoices,
      statusWarehouses: statusWarehouses ?? this.statusWarehouses,
      status: status ?? this.status,
      statusShow: statusShow ?? this.statusShow,
      visitorsModel: visitorsModel ?? this.visitorsModel,
      warehouseCapacityModel: warehouseCapacityModel ?? this.warehouseCapacityModel,
      draftsMemoModel: draftsMemoModel ?? this.draftsMemoModel,
      respondentsListModel: respondentsListModel ?? this.respondentsListModel,
      managementsBasesModel: managementsBasesModel ?? this.managementsBasesModel,
      productsBasesModel: productsBasesModel ?? this.productsBasesModel,
      warehousesBasesModel: warehousesBasesModel ?? this.warehousesBasesModel,
      invoicesBasesModel: invoicesBasesModel ?? this.invoicesBasesModel,
      fillingPercentage: fillingPercentage ?? this.fillingPercentage,
      warehousesSel: warehousesSel ?? this.warehousesSel,
    );
  }
}
