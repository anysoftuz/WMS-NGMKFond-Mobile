import 'package:sklad/data/common/response_model.dart';
import 'package:sklad/data/models/drafts_memo_model.dart';
import 'package:sklad/data/models/managements_bases_model.dart';
import 'package:sklad/data/models/products_bases_model.dart';
import 'package:sklad/data/models/respondents_list_model.dart';
import 'package:sklad/data/models/visitors_model.dart';
import 'package:sklad/data/models/warehouse_capacity_model.dart';
import 'package:sklad/data/models/warehouses_bases_model.dart';
import 'package:sklad/infrastructure/core/exceptions/failures.dart';
import 'package:sklad/utils/either.dart';

abstract class ApisRepo {
  Future<Either<Failure, ResponseModel<VisitorsModel>>> getVisitors();
  Future<Either<Failure, ResponseModel<WarehouseCapacityModel>>>
      getWarehouseCapacity();
  Future<Either<Failure, ResponseModel<DraftsMemoModel>>> getDrafts(
    Map<String, dynamic> query,
  );
  Future<Either<Failure, ResponseModel<DraftsMemoModel>>> getSent(
    Map<String, dynamic> query,
  );
  Future<Either<Failure, ResponseModel<DraftsMemoModel>>> getReceived(
    Map<String, dynamic> query,
  );
  Future<Either<Failure, ResponseModel<RespondentsListModel>>>
      getRespondentsList();

  Future<Either<Failure, ResponseModel<ManagementsBasesModel>>>
      getManagementsBases();
  Future<Either<Failure, num>> getFillingPercentage(int id);

  Future<Either<Failure, ResponseModel<ProductsBasesModel>>> getProductBese(
    int id,
  );
  Future<Either<Failure, ResponseModel<ProductsBasesModel>>> getInvoicesBese(
    int id,
  );
  Future<Either<Failure, ResponseModel<WarehousesBasesModel>>> getWarehouses(
    int id,
  );
}
