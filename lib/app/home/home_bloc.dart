import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sklad/data/abstract_repo/apis_repo.dart';
import 'package:sklad/data/models/visitors_model.dart';
import 'package:sklad/data/models/warehouse_capacity_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApisRepo _repository;
  HomeBloc(this._repository) : super(const HomeState()) {
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
      emit(state.copyWith(statusWarehouseCapacity: FormzSubmissionStatus.inProgress));
      final result = await _repository.getWarehouseCapacity();
      if (result.isRight) {
        emit(state.copyWith(
          statusWarehouseCapacity: FormzSubmissionStatus.success,
          warehouseCapacityModel: result.right.data,
        ));
      } else {
        emit(state.copyWith(statusWarehouseCapacity: FormzSubmissionStatus.failure));
      }
    });
  }
}
