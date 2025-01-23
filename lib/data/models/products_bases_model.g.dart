// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_bases_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsBasesModel _$ProductsBasesModelFromJson(Map<String, dynamic> json) =>
    ProductsBasesModel(
      warehouseProducts: (json['warehouse_products'] as List<dynamic>?)
              ?.map((e) => WarehouseProduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      paginator: json['paginator'] == null
          ? const Paginator()
          : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsBasesModelToJson(ProductsBasesModel instance) =>
    <String, dynamic>{
      'warehouse_products': instance.warehouseProducts,
      'paginator': instance.paginator,
    };

Paginator _$PaginatorFromJson(Map<String, dynamic> json) => Paginator(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 0,
      perPage: (json['per_page'] as num?)?.toInt() ?? 0,
      hasMore: json['has_more'] as bool? ?? false,
      itemsCount: (json['items_count'] as num?)?.toInt() ?? 0,
      totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
      pagesCount: (json['pages_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PaginatorToJson(Paginator instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'has_more': instance.hasMore,
      'items_count': instance.itemsCount,
      'total_count': instance.totalCount,
      'pages_count': instance.pagesCount,
    };

WarehouseProduct _$WarehouseProductFromJson(Map<String, dynamic> json) =>
    WarehouseProduct(
      id: (json['id'] as num).toInt(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      priceFormatted: json['price_formatted'] as String,
    );

Map<String, dynamic> _$WarehouseProductToJson(WarehouseProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'quantity': instance.quantity,
      'price': instance.price,
      'price_formatted': instance.priceFormatted,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      measure: json['measure'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'measure': instance.measure,
    };
