import 'package:sklad/data/common/response_model.dart';
import 'package:sklad/data/models/visitors_model.dart';
import 'package:sklad/data/models/warehouse_capacity_model.dart';
import 'package:sklad/infrastructure/core/exceptions/failures.dart';
import 'package:sklad/utils/either.dart';

abstract class ApisRepo {
  Future<Either<Failure, ResponseModel<VisitorsModel>>> getVisitors();
  Future<Either<Failure, ResponseModel<WarehouseCapacityModel>>>
      getWarehouseCapacity();
}
