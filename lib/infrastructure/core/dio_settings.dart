import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sklad/assets/constants/storage_keys.dart';
import 'package:sklad/infrastructure/repo/storage_repository.dart';
import 'package:sklad/utils/device_info.dart';
import 'package:sklad/utils/log_service.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: "https://wms-api.ngmkfond.uz/api/v1/",
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    headers: <String, dynamic>{
      'Accept': 'application/json',
      'x-device-type': getDeviceType(),
      'x-device-model': StorageRepository.getString(StorageKeys.deviceModel),
      'x-app-version': '0.0.1',
      'x-app-build': '1',
      'x-device-uid': StorageRepository.getString(StorageKeys.deviceId),
      'x-app-lang': StorageRepository.getString(
        StorageKeys.LANGUAGE,
        defValue: 'uz',
      ),
      'Authorization':
          'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang, String? token}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: "https://wms-api.ngmkfond.uz/api/v1/",
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 35000),
      headers: <String, dynamic>{
        'Accept': 'application/json',
        'x-device-type': getDeviceType(),
        'x-device-model': StorageRepository.getString(StorageKeys.deviceModel),
        'x-app-version': '0.0.1',
        'x-app-build': '1',
        'x-device-uid': StorageRepository.getString(StorageKeys.deviceId),
        'x-app-lang': lang ??
            StorageRepository.getString(
              StorageKeys.LANGUAGE,
              defValue: 'uz',
            ),
        'Authorization':
            'Bearer ${token ?? StorageRepository.getString(StorageKeys.TOKEN)}',
      },
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  final BaseOptions _dioBaseOptionsForAuth = BaseOptions(
    baseUrl: "https://wms-api.ngmkfond.uz/api/v1/",
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    headers: <String, dynamic>{
      'Accept': 'application/json',
      'x-device-type': getDeviceType(),
      'x-device-model': StorageRepository.getString(StorageKeys.deviceModel),
      'x-app-version': '0.0.1',
      'x-app-build': '1',
      'x-device-uid': StorageRepository.getString(StorageKeys.deviceId),
      'x-app-lang': StorageRepository.getString(
        StorageKeys.LANGUAGE,
        defValue: 'uz',
      ),
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  BaseOptions get dioBaseOptionsForAuth => _dioBaseOptionsForAuth;

  Dio get dio => Dio(_dioBaseOptions)
    ..interceptors.addAll(
      [
        LogInterceptor(
          requestBody: kDebugMode,
          request: kDebugMode,
          requestHeader: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: kDebugMode,
          error: kDebugMode,
        ),
        ErrorHandlerInterceptor(),
      ],
    );

  Dio get dioForAuth => Dio(_dioBaseOptionsForAuth)
    ..interceptors.addAll(
      [
        LogInterceptor(
          requestBody: kDebugMode,
          request: kDebugMode,
          requestHeader: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: kDebugMode,
          error: kDebugMode,
        ),
        ErrorHandlerInterceptor(),
      ],
    );
}

class ErrorHandlerInterceptor implements Interceptor {
  ErrorHandlerInterceptor._();

  static final _instance = ErrorHandlerInterceptor._();

  factory ErrorHandlerInterceptor() => _instance;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.connectionTimeout) {
      Log.e("Time Out");
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401) {}
    handler.next(response);
  }
}
