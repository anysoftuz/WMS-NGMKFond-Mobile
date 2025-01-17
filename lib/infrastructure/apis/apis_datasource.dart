import 'package:sklad/data/common/error_handle.dart';
import 'package:sklad/data/common/response_model.dart';
import 'package:sklad/data/models/visitors_model.dart';
import 'package:sklad/data/models/warehouse_capacity_model.dart';
import 'package:sklad/infrastructure/core/dio_settings.dart';
import 'package:sklad/infrastructure/core/service_locator.dart';

abstract class ApisDatasource {
  Future<ResponseModel<VisitorsModel>> getVisitors();
  Future<ResponseModel<WarehouseCapacityModel>> getWarehouseCapacity();
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
}
