part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetVisitorsEvent extends HomeEvent {}

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
