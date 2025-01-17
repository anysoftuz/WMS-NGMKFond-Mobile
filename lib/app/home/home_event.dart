part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetVisitorsEvent extends HomeEvent {}

class GetWarehouseCapacityEvent extends HomeEvent {}
