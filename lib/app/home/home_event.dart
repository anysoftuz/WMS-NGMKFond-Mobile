part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetVisitorsEvent extends HomeEvent {}

class GetBranchEvent extends HomeEvent {}

class GetDocumentShowEvent extends HomeEvent {
  final String id;
  final Function(DocumentShowModel model) onSucces;

  GetDocumentShowEvent({required this.id, required this.onSucces});
}

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
  final FilterModel model;

  GetDraftsEvent({required this.model});
}

class GetSentEvent extends HomeEvent {
  final FilterModel model;

  GetSentEvent({required this.model});
}

class GetReceivedEvent extends HomeEvent {
  final FilterModel model;

  GetReceivedEvent({required this.model});
}

class CreateDocEvent extends HomeEvent {
  final Map<String, dynamic> data;
  final VoidCallback onSucces;

  CreateDocEvent({
    required this.data,
    required this.onSucces,
  });
}

class UpdateDocEvent extends HomeEvent {
  final String id;
  final Map<String, dynamic> data;
  final VoidCallback onSucces;

  UpdateDocEvent({
    required this.id,
    required this.data,
    required this.onSucces,
  });
}
