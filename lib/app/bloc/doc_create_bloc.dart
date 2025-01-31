import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sklad/data/abstract_repo/apis_repo.dart';
import 'package:sklad/data/models/product_categories_model.dart';
import 'package:sklad/data/models/product_types_model.dart';
import 'package:sklad/data/models/respondents_list_model.dart';
import 'package:sklad/data/models/users_model.dart';

part 'doc_create_event.dart';
part 'doc_create_state.dart';

class DocCreateBloc extends Bloc<DocCreateEvent, DocCreateState> {
  final ApisRepo _repository;
  DocCreateBloc(this._repository) : super(const DocCreateState()) {
    on<PostDocEvent>((event, emit) async {
      emit(state.copyWith(statusCreate: FormzSubmissionStatus.inProgress));
      final result = await _repository.postDocument(event.data);
      if (result.isRight) {
        emit(state.copyWith(statusCreate: FormzSubmissionStatus.success));
        event.onSucces();
      } else {
        emit(state.copyWith(statusCreate: FormzSubmissionStatus.failure));
      }
    });
    on<GetRespondentsEvent>((event, emit) async {
      emit(state.copyWith(statusRespondents: FormzSubmissionStatus.inProgress));
      final result = await _repository.getRespondentsList(event.query ?? {});
      if (result.isRight) {
        emit(state.copyWith(statusRespondents: FormzSubmissionStatus.success));
        if (event.isBase) {
          emit(state.copyWith(respondentsBase: result.right.data));
        } else {
          emit(state.copyWith(respondentsProvider: result.right.data));
        }
      } else {
        emit(state.copyWith(statusRespondents: FormzSubmissionStatus.failure));
      }
    });
    on<GetMerchandiserEvent>((event, emit) async {
      emit(state.copyWith(statusUsers: FormzSubmissionStatus.inProgress));
      final result = await _repository.getUsers(
        {'per_page': 100, 'role_name': 'merchandiser'},
      );
      if (result.isRight) {
        emit(state.copyWith(
          usersMerchandiser: result.right.data,
          statusUsers: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(statusUsers: FormzSubmissionStatus.failure));
      }
    });
    on<GetManagerBaseEvent>((event, emit) async {
      emit(state.copyWith(statusUsers: FormzSubmissionStatus.inProgress));
      final result = await _repository.getUsers(
        {'per_page': 100, 'role_name': 'manager-base'},
      );
      if (result.isRight) {
        emit(state.copyWith(
          usersManagerBase: result.right.data,
          statusUsers: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(statusUsers: FormzSubmissionStatus.failure));
      }
    });
    on<GetHeadWarehouseEvent>((event, emit) async {
      emit(state.copyWith(statusUsers: FormzSubmissionStatus.inProgress));
      final result = await _repository.getUsers(
        {'per_page': 100, 'role_name': 'head-warehouse'},
      );
      if (result.isRight) {
        emit(state.copyWith(
          usersHeadWarehouse: result.right.data,
          statusUsers: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(statusUsers: FormzSubmissionStatus.failure));
      }
    });

    on<GetCategoriesEvent>((event, emit) async {
      emit(state.copyWith(statusCategory: FormzSubmissionStatus.inProgress));
      final result = await _repository.getProductCategories();
      if (result.isRight) {
        emit(state.copyWith(
          productCategoriesModel: result.right.data,
          statusCategory: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(statusCategory: FormzSubmissionStatus.failure));
      }
    });

    on<GetTypesEvent>((event, emit) async {
      emit(state.copyWith(statusCategory: FormzSubmissionStatus.inProgress));
      final result = await _repository.getProducTypes(event.id);
      if (result.isRight) {
        emit(state.copyWith(
          productTypesModel: result.right.data,
          statusCategory: FormzSubmissionStatus.success,
        ));
        event.onSucces(result.right.data);
      } else {
        emit(state.copyWith(statusCategory: FormzSubmissionStatus.failure));
      }
    });
  }
}
