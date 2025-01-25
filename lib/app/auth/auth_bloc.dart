import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sklad/assets/constants/storage_keys.dart';
import 'package:sklad/data/abstract_repo/auth_repo.dart';
import 'package:sklad/data/common/login_model.dart';
import 'package:sklad/data/models/forget_password_model.dart';
import 'package:sklad/data/models/send_code_model.dart';
import 'package:sklad/data/models/user_model.dart';
import 'package:sklad/data/models/verify_code_model.dart';
import 'package:sklad/infrastructure/repo/storage_repository.dart';
import 'package:sklad/utils/log_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  loading,
  cancelLoading,
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _repository;
  AuthBloc(this._repository) : super(const AuthState()) {
    on<CheckUserEvent>((event, emit) {
      final token = StorageRepository.getString(StorageKeys.TOKEN);
      if (token.isEmpty) {
        emit(state.copyWith(statusAuth: AuthenticationStatus.unauthenticated));
      } else {
        add(GetMeEvent());
      }
    });

    on<SendCodeEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await _repository.postSendCode(event.phone);
      if (result.isRight) {
        if (result.right.success) {
          emit(state.copyWith(status: FormzSubmissionStatus.success));
          event.onSucces(result.right.data!);
        } else {
          try {
            event.onError(result.right.error['message']);
          } catch (e) {
            Log.i(e);
          }
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }
      } else {
        event.onError("Malumot topilmadi");
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });

    on<VerifyCodeEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await _repository.postVerifyCode(VerifyCodeModel(
        phone: event.phone,
        code: event.code,
        otpSessionId: event.otpSessionId,
      ));
      if (result.isRight) {
        if (result.right.success) {
          emit(state.copyWith(status: FormzSubmissionStatus.success));
          event.onSucces();
        } else {
          try {
            event.onError(result.right.error['message']);
          } catch (e) {
            Log.i(e);
          }
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }
      } else {
        event.onError("Malumot topilmadi");
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });

    on<ForgotPasswordEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await _repository.postForgotPassword(ForgetPasswordModel(
        phone: event.phone,
        code: event.code,
        otpSessionId: event.otpSessionId,
        newPassword: event.newPassword,
        passwordConfirmation: event.newPassword,
      ));
      if (result.isRight) {
        if (result.right.success) {
          emit(state.copyWith(status: FormzSubmissionStatus.success));
          event.onSucces();
        } else {
          try {
            event.onError(result.right.error['message']);
          } catch (e) {
            Log.i(e);
          }
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }
      } else {
        event.onError("Malumot topilmadi");
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });

    on<GetMeEvent>((event, emit) async {
      emit(state.copyWith(statusAuth: AuthenticationStatus.loading));
      final result = await _repository.getMe();
      if (result.isRight) {
        if (result.right.success) {
          emit(state.copyWith(
            userModel: result.right.data,
            statusAuth: AuthenticationStatus.authenticated,
            status: FormzSubmissionStatus.success,
          ));
        } else {
          emit(state.copyWith(
            statusAuth: AuthenticationStatus.unauthenticated,
          ));
        }
      } else {
        emit(state.copyWith(statusAuth: AuthenticationStatus.unauthenticated));
      }
    });

    on<RefreshEvent>((event, emit) async {
      await _repository.refreshToken();
    });

    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await _repository.postLogin(LoginModel(
        phone: event.phone,
        password: event.password,
      ));
      if (result.isRight) {
        if (result.right.success) {
          add(GetMeEvent());
        } else {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
          event.onError(result.right.error['message']);
        }
      } else {
        emit(state.copyWith(
          statusAuth: AuthenticationStatus.unauthenticated,
          status: FormzSubmissionStatus.failure,
        ));
      }
    });

    on<LogOutEvent>((event, emit) async {
      final result = await _repository.logout();
      if (result.isRight) {
        emit(state.copyWith(
          statusAuth: AuthenticationStatus.unauthenticated,
          status: FormzSubmissionStatus.failure,
        ));
      } else {
        emit(state.copyWith(
          statusAuth: AuthenticationStatus.unauthenticated,
          status: FormzSubmissionStatus.failure,
        ));
      }
    });
  }
}
