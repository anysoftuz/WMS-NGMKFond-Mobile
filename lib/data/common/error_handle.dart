import 'package:dio/dio.dart';
import 'package:sklad/app/auth/auth_bloc.dart';
import 'package:sklad/infrastructure/core/exceptions/exceptions.dart';
import 'package:sklad/infrastructure/core/exceptions/failures.dart';
import 'package:sklad/infrastructure/core/service_locator.dart';
import 'package:sklad/utils/log_service.dart';

class ErrorHandle {
  Future<R> apiCantrol<T, R>(
      {required Future<Response<T>?> Function() request,
      required R Function(T response) body}) async {
    try {
      final response = await request();
      if (response!.statusCode! >= 200 && response.statusCode! < 300) {
        return body(response.data as T);
      }
      if (response.statusCode == 401) {
        serviceLocator<AuthBloc>().add(RefreshEvent());
      }
      Log.e(response.statusCode);
      throw ServerException(
        statusCode: response.statusCode ?? 0,
        errorMessage: response.statusMessage ?? "",
        // errorMessage: response.statusMessage ?? "",
      );
    } on ServerException {
      rethrow;
    } on DioException catch (e) {
      Log.e(e);
      throw DioException(requestOptions: e.requestOptions);
    } on ParsingException catch (e) {
      Log.e(e);
      throw ParsingException(errorMessage: e.toString());
    } catch (e) {
      Log.e(e);
      rethrow;
    }
  }
}
