import 'package:dio/dio.dart';
import 'package:sklad/data/abstract_repo/apis_repo.dart';
import 'package:sklad/data/common/response_model.dart';
import 'package:sklad/data/models/drafts_memo_model.dart';
import 'package:sklad/data/models/visitors_model.dart';
import 'package:sklad/data/models/warehouse_capacity_model.dart';
import 'package:sklad/infrastructure/apis/apis_datasource.dart';
import 'package:sklad/infrastructure/core/exceptions/exceptions.dart';
import 'package:sklad/infrastructure/core/exceptions/failures.dart';
import 'package:sklad/utils/either.dart';

class ApisRepoImpl implements ApisRepo {
  final ApisDatasourceImpl datasourceImpl;

  ApisRepoImpl({required this.datasourceImpl});
  @override
  Future<Either<Failure, ResponseModel<VisitorsModel>>> getVisitors() async {
    try {
      final result = await datasourceImpl.getVisitors();
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
  Future<Either<Failure, ResponseModel<WarehouseCapacityModel>>>
      getWarehouseCapacity() async {
    try {
      final result = await datasourceImpl.getWarehouseCapacity();
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
  Future<Either<Failure, ResponseModel<DraftsMemoModel>>> getDrafts(
    Map<String, dynamic> query,
  ) async {
    try {
      final result = await datasourceImpl.getDrafts(query);
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
