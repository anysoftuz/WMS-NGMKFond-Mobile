import 'package:dio/dio.dart';
import 'package:sklad/data/abstract_repo/apis_repo.dart';
import 'package:sklad/data/common/response_model.dart';
import 'package:sklad/data/models/document_show_model.dart';
import 'package:sklad/data/models/drafts_memo_model.dart';
import 'package:sklad/data/models/managements_bases_model.dart';
import 'package:sklad/data/models/product_categories_model.dart';
import 'package:sklad/data/models/product_types_model.dart';
import 'package:sklad/data/models/products_bases_model.dart';
import 'package:sklad/data/models/respondents_list_model.dart';
import 'package:sklad/data/models/users_model.dart';
import 'package:sklad/data/models/visitors_model.dart';
import 'package:sklad/data/models/warehouse_capacity_model.dart';
import 'package:sklad/data/models/warehouses_bases_model.dart';
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

  @override
  Future<Either<Failure, ResponseModel<DraftsMemoModel>>> getReceived(
    Map<String, dynamic> query,
  ) async {
    try {
      final result = await datasourceImpl.getReceived(query);
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
  Future<Either<Failure, ResponseModel<DraftsMemoModel>>> getSent(
    Map<String, dynamic> query,
  ) async {
    try {
      final result = await datasourceImpl.getSent(query);
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
  Future<Either<Failure, ResponseModel<RespondentsListModel>>>
      getRespondentsList(Map<String, dynamic> query) async {
    try {
      final result = await datasourceImpl.getRespondentsList(query);
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
  Future<Either<Failure, ResponseModel<ManagementsBasesModel>>>
      getManagementsBases() async {
    try {
      final result = await datasourceImpl.getManagementsBases();
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
  Future<Either<Failure, num>> getFillingPercentage(int id) async {
    try {
      final result = await datasourceImpl.getFillingPercentage(id);
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
  Future<Either<Failure, ResponseModel<ProductsBasesModel>>> getProductBese(
    int id,
  ) async {
    try {
      final result = await datasourceImpl.getProductBese(id);
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
  Future<Either<Failure, ResponseModel<WarehousesBasesModel>>> getWarehouses(
    int id,
  ) async {
    try {
      final result = await datasourceImpl.getWarehouses(id);
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
  Future<Either<Failure, ResponseModel<ProductsBasesModel>>> getInvoicesBese(
    int id,
  ) async {
    try {
      final result = await datasourceImpl.getInvoicesBese(id);
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
  Future<Either<Failure, bool>> postDocument(Map<String, dynamic> data) async {
    try {
      final result = await datasourceImpl.postDocument(data);
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
  Future<Either<Failure, ResponseModel<DocumentShowModel>>> getDocumentShow(
    String id,
  ) async {
    try {
      final result = await datasourceImpl.getDocumentShow(id);
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
  Future<Either<Failure, bool>> putDocument(
    String id,
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await datasourceImpl.putDocument(id, data);
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
  Future<Either<Failure, ResponseModel<ProductTypesModel>>> getProducTypes(
    int id,
  ) async {
    try {
      final result = await datasourceImpl.getProducTypes(id);
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
  Future<Either<Failure, ResponseModel<ProductCategoriesModel>>>
      getProductCategories() async {
    try {
      final result = await datasourceImpl.getProductCategories();
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
  Future<Either<Failure, ResponseModel<UsersModel>>> getUsers(
    Map<String, dynamic> query,
  ) async {
    try {
      final result = await datasourceImpl.getUsers(query);
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
