part of 'doc_create_bloc.dart';

sealed class DocCreateEvent {}

class GetMerchandiserEvent extends DocCreateEvent {}

class PostDocEvent extends DocCreateEvent {
  final Map<String, dynamic> data;
  final VoidCallback onSucces;

  PostDocEvent({required this.data, required this.onSucces});
}

class GetManagerBaseEvent extends DocCreateEvent {}

class GetHeadWarehouseEvent extends DocCreateEvent {}

class GetCategoriesEvent extends DocCreateEvent {}

class GetTypesEvent extends DocCreateEvent {
  final int id;
  final Function(ProductTypesModel? productTypesModel) onSucces;

  GetTypesEvent({
    required this.id,
    required this.onSucces,
  });
}

class GetRespondentsEvent extends DocCreateEvent {
  final Map<String, dynamic>? query;
  final bool isBase;

  GetRespondentsEvent({required this.isBase, this.query});
}
