import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sklad/data/abstract_repo/apis_repo.dart';
import 'package:sklad/data/models/drafts_memo_model.dart';
import 'package:sklad/data/models/respondents_list_model.dart';
import 'package:sklad/data/models/visitors_model.dart';
import 'package:sklad/data/models/warehouse_capacity_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApisRepo _repository;
  HomeBloc(this._repository) : super(const HomeState()) {
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
      Map<String, dynamic> query = {};
      if (event.docType != null) {
        query['doc_type'] = 'memo';
      }
      final result = await _repository.getReceived(query);
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
      Map<String, dynamic> query = {};
      if (event.docType != null) {
        query['doc_type'] = 'memo';
      }
      final result = await _repository.getSent(query);
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
      Map<String, dynamic> query = {};
      if (event.docType != null) {
        query['doc_type'] = 'memo';
      }
      final result = await _repository.getDrafts(query);
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
