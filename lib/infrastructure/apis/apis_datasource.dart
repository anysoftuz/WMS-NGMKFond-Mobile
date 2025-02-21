import 'package:sklad/data/common/error_handle.dart';
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
import 'package:sklad/infrastructure/core/dio_settings.dart';
import 'package:sklad/infrastructure/core/service_locator.dart';

abstract class ApisDatasource {
  Future<ResponseModel<VisitorsModel>> getVisitors();
  Future<ResponseModel<WarehouseCapacityModel>> getWarehouseCapacity();
  Future<ResponseModel<DraftsMemoModel>> getDrafts(Map<String, dynamic> query);
  Future<ResponseModel<DraftsMemoModel>> getSent(Map<String, dynamic> query);
  Future<ResponseModel<DraftsMemoModel>> getReceived(
    Map<String, dynamic> query,
  );
  Future<ResponseModel<RespondentsListModel>> getRespondentsList(
      Map<String, dynamic> query);
  Future<ResponseModel<ManagementsBasesModel>> getManagementsBases();
  Future<num> getFillingPercentage(int id);
  Future<ResponseModel<ProductsBasesModel>> getProductBese(int id);
  Future<ResponseModel<ProductCategoriesModel>> getProductCategories();
  Future<ResponseModel<ProductTypesModel>> getProducTypes(int id);
  Future<ResponseModel<WarehousesBasesModel>> getWarehouses(int id);
  Future<ResponseModel<ProductsBasesModel>> getInvoicesBese(int id);
  Future<bool> postDocument(Map<String, dynamic> data);
  Future<bool> putDocument(String id, Map<String, dynamic> data);
  Future<ResponseModel<DocumentShowModel>> getDocumentShow(String id);
  Future<ResponseModel<UsersModel>> getUsers(Map<String, dynamic> query);
}

class ApisDatasourceImpl implements ApisDatasource {
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<ResponseModel<VisitorsModel>> getVisitors() {
    return _handle.apiCantrol(
      request: () => dio.get('statistics/visitors'),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => VisitorsModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<WarehouseCapacityModel>> getWarehouseCapacity() {
    return _handle.apiCantrol(
      request: () => dio.get('statistics/warehouse-capacity'),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => WarehouseCapacityModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<DraftsMemoModel>> getDrafts(Map<String, dynamic> query) {
    return _handle.apiCantrol(
      request: () => dio.get('documents/drafts', queryParameters: query),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => DraftsMemoModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<DraftsMemoModel>> getReceived(
      Map<String, dynamic> query) {
    return _handle.apiCantrol(
      request: () => dio.get('documents/received', queryParameters: query),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => DraftsMemoModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<DraftsMemoModel>> getSent(Map<String, dynamic> query) {
    return _handle.apiCantrol(
      request: () => dio.get('documents/sent', queryParameters: query),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => DraftsMemoModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<RespondentsListModel>> getRespondentsList(
      Map<String, dynamic> query) {
    return _handle.apiCantrol(
      request: () => dio.get(
        'documents/respondents-list',
        queryParameters: query,
      ),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => RespondentsListModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<ManagementsBasesModel>> getManagementsBases() {
    return _handle.apiCantrol(
      request: () => dio.get('managements/with-bases'),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => ManagementsBasesModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<num> getFillingPercentage(int id) {
    return _handle.apiCantrol(
      request: () => dio.get('base-warehouses/$id/filling-percentage'),
      body: (response) =>
          (response as Map<String, dynamic>)['data']['percentage'],
    );
  }

  @override
  Future<ResponseModel<ProductsBasesModel>> getProductBese(int id) {
    return _handle.apiCantrol(
      request: () => dio.get('base-warehouses/$id/products'),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => ProductsBasesModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<WarehousesBasesModel>> getWarehouses(int id) {
    return _handle.apiCantrol(
      request: () => dio.get('base-warehouses?per_page=100&base_id=$id'),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => WarehousesBasesModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<ProductsBasesModel>> getInvoicesBese(int id) {
    return _handle.apiCantrol(
      request: () => dio.get('base-warehouses/$id/invoices'),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => ProductsBasesModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<bool> postDocument(Map<String, dynamic> data) {
    return _handle.apiCantrol(
      request: () => dio.post('documents', data: data),
      body: (response) => (response as Map<String, dynamic>)['success'],
    );
  }

  @override
  Future<ResponseModel<DocumentShowModel>> getDocumentShow(String id) {
    return _handle.apiCantrol(
      request: () => dio.get('documents/$id'),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => DocumentShowModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<bool> putDocument(String id, Map<String, dynamic> data) {
    return _handle.apiCantrol(
      request: () => dio.put('documents/$id', data: data),
      body: (response) => (response as Map<String, dynamic>)['success'],
    );
  }

  @override
  Future<ResponseModel<ProductCategoriesModel>> getProductCategories() {
    return _handle.apiCantrol(
      request: () => dio.get('product-types/categories'),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => ProductCategoriesModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<ProductTypesModel>> getProducTypes(int id) {
    return _handle.apiCantrol(
      request: () => dio.get('product-types?parent_id=$id'),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => ProductTypesModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<UsersModel>> getUsers(Map<String, dynamic> query) {
    return _handle.apiCantrol(
      request: () => dio.get('users', queryParameters: query),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => UsersModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }
}
