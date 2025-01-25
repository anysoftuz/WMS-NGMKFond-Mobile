import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sklad/data/abstract_repo/apis_repo.dart';
import 'package:sklad/data/models/drafts_memo_model.dart';
import 'package:sklad/data/models/filter_model.dart';
import 'package:sklad/data/models/managements_bases_model.dart';
import 'package:sklad/data/models/products_bases_model.dart';
import 'package:sklad/data/models/respondents_list_model.dart';
import 'package:sklad/data/models/visitors_model.dart';
import 'package:sklad/data/models/warehouse_capacity_model.dart';
import 'package:sklad/data/models/warehouses_bases_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApisRepo _repository;
  HomeBloc(this._repository) : super(const HomeState()) {
    on<CreateDocEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await _repository.postDocument(event.data);
      if (result.isRight) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        event.onSucces();
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
    on<GetWarehousesChengeEvent>((event, emit) async {
      emit(state.copyWith(warehousesSel: event.index));
      add(GetFillingPercentageEvent(
        id: state.warehousesBasesModel.baseWarehouses[event.index].id,
      ));
      add(GetProductBeseEvent(
        id: state.warehousesBasesModel.baseWarehouses[event.index].id,
      ));
      add(GetInvoicesBeseEvent(
        id: state.warehousesBasesModel.baseWarehouses[event.index].id,
      ));
    });

    on<GetWarehousesBeseEvent>((event, emit) async {
      emit(state.copyWith(statusWarehouses: FormzSubmissionStatus.inProgress));
      final result = await _repository.getWarehouses(event.id);
      if (result.isRight) {
        emit(state.copyWith(
          statusWarehouses: FormzSubmissionStatus.success,
          warehousesBasesModel: result.right.data,
        ));
        if (result.right.data!.baseWarehouses.isNotEmpty) {
          add(GetFillingPercentageEvent(
            id: result.right.data?.baseWarehouses.first.id ?? 0,
          ));
          add(GetProductBeseEvent(
            id: result.right.data?.baseWarehouses.first.id ?? 0,
          ));
          add(GetInvoicesBeseEvent(
            id: result.right.data?.baseWarehouses.first.id ?? 0,
          ));
        }
      } else {
        emit(state.copyWith(statusWarehouses: FormzSubmissionStatus.failure));
      }
    });
    on<GetInvoicesBeseEvent>((event, emit) async {
      emit(state.copyWith(
        statusBaseInvoices: FormzSubmissionStatus.inProgress,
      ));
      final result = await _repository.getInvoicesBese(event.id);
      if (result.isRight) {
        emit(state.copyWith(
          statusBaseInvoices: FormzSubmissionStatus.success,
          invoicesBasesModel: result.right.data,
        ));
      } else {
        emit(state.copyWith(statusBaseInvoices: FormzSubmissionStatus.failure));
      }
    });
    on<GetProductBeseEvent>((event, emit) async {
      emit(state.copyWith(statusBaseProduct: FormzSubmissionStatus.inProgress));
      final result = await _repository.getProductBese(event.id);
      if (result.isRight) {
        emit(state.copyWith(
          statusBaseProduct: FormzSubmissionStatus.success,
          productsBasesModel: result.right.data,
        ));
      } else {
        emit(state.copyWith(statusBaseProduct: FormzSubmissionStatus.failure));
      }
    });
    on<GetFillingPercentageEvent>((event, emit) async {
      final result = await _repository.getFillingPercentage(event.id);
      if (result.isRight) {
        emit(state.copyWith(fillingPercentage: result.right));
      }
    });
    on<GetBranchEvent>((event, emit) async {
      emit(state.copyWith(statusBase: FormzSubmissionStatus.inProgress));
      final result = await _repository.getManagementsBases();
      if (result.isRight) {
        emit(state.copyWith(
          statusBase: FormzSubmissionStatus.success,
          managementsBasesModel: result.right.data,
        ));
      } else {
        emit(state.copyWith(statusBase: FormzSubmissionStatus.failure));
      }
    });
    on<GetRespondentsListEvent>((event, emit) async {
      emit(state.copyWith(statusRespondents: FormzSubmissionStatus.inProgress));
      final result = await _repository.getRespondentsList();
      if (result.isRight) {
        emit(state.copyWith(
          statusRespondents: FormzSubmissionStatus.success,
          respondentsListModel: result.right.data,
        ));
      } else {
        emit(state.copyWith(statusRespondents: FormzSubmissionStatus.failure));
      }
    });
    on<GetReceivedEvent>((event, emit) async {
      emit(state.copyWith(statusDraftsMemo: FormzSubmissionStatus.inProgress));
      final result = await _repository.getReceived(event.model.toJson());
      if (result.isRight) {
        emit(state.copyWith(
          statusDraftsMemo: FormzSubmissionStatus.success,
          draftsMemoModel: result.right.data,
        ));
      } else {
        emit(state.copyWith(statusDraftsMemo: FormzSubmissionStatus.failure));
      }
    });

    on<GetSentEvent>((event, emit) async {
      emit(state.copyWith(statusDraftsMemo: FormzSubmissionStatus.inProgress));
      final result = await _repository.getSent(event.model.toJson());
      if (result.isRight) {
        emit(state.copyWith(
          statusDraftsMemo: FormzSubmissionStatus.success,
          draftsMemoModel: result.right.data,
        ));
      } else {
        emit(state.copyWith(statusDraftsMemo: FormzSubmissionStatus.failure));
      }
    });

    on<GetDraftsEvent>((event, emit) async {
      emit(state.copyWith(statusDraftsMemo: FormzSubmissionStatus.inProgress));
      final result = await _repository.getDrafts(event.model.toJson());
      if (result.isRight) {
        emit(state.copyWith(
          statusDraftsMemo: FormzSubmissionStatus.success,
          draftsMemoModel: result.right.data,
        ));
      } else {
        emit(state.copyWith(statusDraftsMemo: FormzSubmissionStatus.failure));
      }
    });

    on<GetVisitorsEvent>((event, emit) async {
      emit(state.copyWith(statusVisitors: FormzSubmissionStatus.inProgress));
      final result = await _repository.getVisitors();
      if (result.isRight) {
        emit(state.copyWith(
          statusVisitors: FormzSubmissionStatus.success,
          visitorsModel: result.right.data,
        ));
      } else {
        emit(state.copyWith(statusVisitors: FormzSubmissionStatus.failure));
      }
    });

    on<GetWarehouseCapacityEvent>((event, emit) async {
      emit(state.copyWith(
        statusWarehouseCapacity: FormzSubmissionStatus.inProgress,
      ));
      final result = await _repository.getWarehouseCapacity();
      if (result.isRight) {
        emit(state.copyWith(
          statusWarehouseCapacity: FormzSubmissionStatus.success,
          warehouseCapacityModel: result.right.data,
        ));
      } else {
        emit(state.copyWith(
          statusWarehouseCapacity: FormzSubmissionStatus.failure,
        ));
      }
    });
  }
}
