import 'package:dio/dio.dart';
import 'package:sklad/assets/constants/storage_keys.dart';
import 'package:sklad/data/common/error_handle.dart';
import 'package:sklad/data/common/login_model.dart';
import 'package:sklad/data/common/response_model.dart';
import 'package:sklad/data/common/token_model.dart';
import 'package:sklad/data/models/forget_password_model.dart';
import 'package:sklad/data/models/send_code_model.dart';
import 'package:sklad/data/models/user_model.dart';
import 'package:sklad/data/models/verify_code_model.dart';
import 'package:sklad/infrastructure/core/dio_settings.dart';
import 'package:sklad/infrastructure/core/service_locator.dart';
import 'package:sklad/infrastructure/repo/storage_repository.dart';

abstract class AuthDatasource {
  Future<ResponseModel<UserModel>> getMe();
  Future<ResponseModel<SendCodeModel>> postSendCode(String phone);
  Future<ResponseModel<bool>> postForgotPassword(ForgetPasswordModel model);
  Future<ResponseModel<bool>> postVerifyCode(VerifyCodeModel model);
  Future<ResponseModel<TokenModel>> postLogin(LoginModel model);
  Future<ResponseModel<TokenModel>> refreshToken();
  Future<bool> logout();
}

class AuthDatasourceImpl implements AuthDatasource {
  final dioAuth = serviceLocator<DioSettings>().dioForAuth;
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<ResponseModel<UserModel>> getMe() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'auth/me',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          },
        ),
      ),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => UserModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<bool> logout() {
    return _handle.apiCantrol(
      request: () => dio.post('auth/logout'),
      body: (response) => true,
    );
  }

  @override
  Future<ResponseModel<TokenModel>> postLogin(LoginModel model) {
    return _handle.apiCantrol(
      request: () => dioAuth.post(
        'auth/login',
        data: model.toJson(),
      ),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => TokenModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<TokenModel>> refreshToken() {
    return _handle.apiCantrol(
      request: () => dio.get('auth/refresh'),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => TokenModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<bool>> postForgotPassword(ForgetPasswordModel model) {
    return _handle.apiCantrol(
      request: () => dioAuth.post(
        'auth/forgot-password',
        data: model.toJson(),
      ),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => true,
      ),
    );
  }

  @override
  Future<ResponseModel<SendCodeModel>> postSendCode(String phone) {
    return _handle.apiCantrol(
      request: () => dioAuth.post(
        'otp/send-code',
        data: {'phone': phone, 'reason': 'forgot_password'},
      ),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => SendCodeModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<bool>> postVerifyCode(VerifyCodeModel model) {
    return _handle.apiCantrol(
      request: () => dioAuth.post(
        'auth/verify-code',
        data: model.toJson(),
      ),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => true,
      ),
    );
  }
}
