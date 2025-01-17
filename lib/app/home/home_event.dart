part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetVisitorsEvent extends HomeEvent {}

class GetWarehouseCapacityEvent extends HomeEvent {}

class GetDraftsEvent extends HomeEvent {
  final String? docType;
  final String? search;

  GetDraftsEvent({
    this.docType,
    this.search,
  });
}
