part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetVisitorsEvent extends HomeEvent {}

class GetBranchEvent extends HomeEvent {}

class GetFillingPercentageEvent extends HomeEvent {
  final int id;

  GetFillingPercentageEvent({required this.id});
}

class GetProductBeseEvent extends HomeEvent {
  final int id;

  GetProductBeseEvent({required this.id});
}

class GetInvoicesBeseEvent extends HomeEvent {
  final int id;

  GetInvoicesBeseEvent({required this.id});
}

class GetWarehousesBeseEvent extends HomeEvent {
  final int id;

  GetWarehousesBeseEvent({required this.id});
}

class GetWarehousesChengeEvent extends HomeEvent {
  final int id;
  final int index;

  GetWarehousesChengeEvent({
    required this.id,
    required this.index,
  });
}

class GetRespondentsListEvent extends HomeEvent {}

class GetWarehouseCapacityEvent extends HomeEvent {}

class GetDraftsEvent extends HomeEvent {
  final String? docType;
  final String? search;

  GetDraftsEvent({
    this.docType,
    this.search,
  });
}

class GetSentEvent extends HomeEvent {
  final String? docType;
  final String? search;

  GetSentEvent({
    this.docType,
    this.search,
  });
}

class GetReceivedEvent extends HomeEvent {
  final String? docType;
  final String? search;

  GetReceivedEvent({
    this.docType,
    this.search,
  });
}
