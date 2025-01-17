import 'package:dio/dio.dart';
import 'package:sklad/assets/constants/storage_keys.dart';
import 'package:sklad/data/abstract_repo/auth_repo.dart';
import 'package:sklad/data/common/login_model.dart';
import 'package:sklad/data/common/response_model.dart';
import 'package:sklad/data/common/token_model.dart';
import 'package:sklad/data/models/forget_password_model.dart';
import 'package:sklad/data/models/send_code_model.dart';
import 'package:sklad/data/models/user_model.dart';
import 'package:sklad/data/models/verify_code_model.dart';
import 'package:sklad/infrastructure/apis/auth_datasource.dart';
import 'package:sklad/infrastructure/core/dio_settings.dart';
import 'package:sklad/infrastructure/core/exceptions/exceptions.dart';
import 'package:sklad/infrastructure/core/exceptions/failures.dart';
import 'package:sklad/infrastructure/core/service_locator.dart';
import 'package:sklad/infrastructure/repo/storage_repository.dart';
import 'package:sklad/utils/either.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDatasourceImpl dataSourcheImpl;

  AuthRepoImpl({required this.dataSourcheImpl});
  @override
  Future<Either<Failure, ResponseModel<UserModel>>> getMe() async {
    try {
      final result = await dataSourcheImpl.getMe();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final result = await dataSourcheImpl.logout();
      await StorageRepository.putString(StorageKeys.TOKEN, '');
      await StorageRepository.putString(StorageKeys.REFRESH, '');
      serviceLocator<DioSettings>().setBaseOptions(token: '');
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, ResponseModel<TokenModel>>> postLogin(
    LoginModel model,
  ) async {
    try {
      final result = await dataSourcheImpl.postLogin(model);
      await StorageRepository.putString(
        StorageKeys.TOKEN,
        result.data?.token.accessToken ?? "",
      );
      await StorageRepository.putString(
        StorageKeys.REFRESH,
        result.data?.refreshToken.refreshToken ?? "",
      );
      serviceLocator<DioSettings>().setBaseOptions(
        token: result.data?.token.accessToken,
      );
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, ResponseModel<TokenModel>>> refreshToken() async {
    try {
      final result = await dataSourcheImpl.refreshToken();
      await StorageRepository.putString(
        StorageKeys.TOKEN,
        result.data?.token.accessToken ?? '',
      );
      await StorageRepository.putString(
        StorageKeys.REFRESH,
        result.data?.refreshToken.refreshToken ?? "",
      );
      serviceLocator<DioSettings>().setBaseOptions(
        token: result.data?.token.accessToken,
      );
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, ResponseModel<bool>>> postForgotPassword(
    ForgetPasswordModel model,
  ) async {
    try {
      final result = await dataSourcheImpl.postForgotPassword(model);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, ResponseModel<SendCodeModel>>> postSendCode(
    String phone,
  ) async {
    try {
      final result = await dataSourcheImpl.postSendCode(phone);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, ResponseModel<bool>>> postVerifyCode(
    VerifyCodeModel model,
  ) async {
    try {
      final result = await dataSourcheImpl.postVerifyCode(model);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }
}
