import 'package:equatable/equatable.dart';

class DocumentModel extends Equatable {
  final Document document;
  final Act act;

  const DocumentModel({
    required this.document,
    required this.act,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      document: Document.fromJson(json['Document']),
      act: Act.fromJson(json['Act']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Document': document.toJson(),
      'Act': act.toJson(),
    };
  }

  DocumentModel copyWith({
    Document? document,
    Act? act,
  }) {
    return DocumentModel(
      document: document ?? this.document,
      act: act ?? this.act,
    );
  }

  @override
  List<Object?> get props => [document, act];
}

// -------------------- Document --------------------

class Document extends Equatable {
  final int docTypeId;
  final String date;
  final String number;
  final int fromId;
  final String fromType;
  final int toId;
  final String toType;
  final String subject;
  final String throughWhom;
  final String basis;
  final String shippingMethod;
  final String status;
  final List<Product> products;

  const Document({
    required this.docTypeId,
    required this.date,
    required this.number,
    required this.fromId,
    required this.fromType,
    required this.toId,
    required this.toType,
    required this.subject,
    required this.throughWhom,
    required this.basis,
    required this.shippingMethod,
    required this.status,
    required this.products,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      docTypeId: json['doc_type_id'],
      date: json['date'],
      number: json['number'],
      fromId: json['from_id'],
      fromType: json['from_type'],
      toId: json['to_id'],
      toType: json['to_type'],
      subject: json['subject'],
      throughWhom: json['through_whom'],
      basis: json['basis'],
      shippingMethod: json['shipping_method'],
      status: json['status'],
      products:
          (json['products'] as List).map((e) => Product.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doc_type_id': docTypeId,
      'date': date,
      'number': number,
      'from_id': fromId,
      'from_type': fromType,
      'to_id': toId,
      'to_type': toType,
      'subject': subject,
      'through_whom': throughWhom,
      'basis': basis,
      'shipping_method': shippingMethod,
      'status': status,
      'products': products.map((e) => e.toJson()).toList(),
    };
  }

  Document copyWith({
    int? docTypeId,
    String? date,
    String? number,
    int? fromId,
    String? fromType,
    int? toId,
    String? toType,
    String? subject,
    String? throughWhom,
    String? basis,
    String? shippingMethod,
    String? status,
    List<Product>? products,
  }) {
    return Document(
      docTypeId: docTypeId ?? this.docTypeId,
      date: date ?? this.date,
      number: number ?? this.number,
      fromId: fromId ?? this.fromId,
      fromType: fromType ?? this.fromType,
      toId: toId ?? this.toId,
      toType: toType ?? this.toType,
      subject: subject ?? this.subject,
      throughWhom: throughWhom ?? this.throughWhom,
      basis: basis ?? this.basis,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
        docTypeId,
        date,
        number,
        fromId,
        fromType,
        toId,
        toType,
        subject,
        throughWhom,
        basis,
        shippingMethod,
        status,
        products
      ];
}

// -------------------- Act --------------------

class Act extends Equatable {
  final String number;
  final String subject;
  final String content;
  final String shippingMethod;
  final List<ProductAct> products;
  final List<DocSigner> docSigners;

  const Act({
    required this.number,
    required this.subject,
    required this.content,
    required this.shippingMethod,
    required this.products,
    required this.docSigners,
  });

  factory Act.fromJson(Map<String, dynamic> json) {
    return Act(
      number: json['number'],
      subject: json['subject'],
      content: json['content'],
      shippingMethod: json['shipping_method'],
      products: (json['products'] as List)
          .map((e) => ProductAct.fromJson(e))
          .toList(),
      docSigners: (json['doc_signers'] as List)
          .map((e) => DocSigner.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'subject': subject,
      'content': content,
      'shipping_method': shippingMethod,
      'products': products.map((e) => e.toJson()).toList(),
      'doc_signers': docSigners.map((e) => e.toJson()).toList(),
    };
  }

  Act copyWith({
    String? number,
    String? subject,
    String? content,
    String? shippingMethod,
    List<ProductAct>? products,
    List<DocSigner>? docSigners,
  }) {
    return Act(
      number: number ?? this.number,
      subject: subject ?? this.subject,
      content: content ?? this.content,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      products: products ?? this.products,
      docSigners: docSigners ?? this.docSigners,
    );
  }

  @override
  List<Object?> get props =>
      [number, subject, content, shippingMethod, products, docSigners];
}

// -------------------- Product --------------------

class Product extends Equatable {
  final int categoryId;
  final int productTypeId;
  final String quantity;
  final int unitId;
  final int price;
  final String unit;
  final String? name;

  const Product({
    required this.categoryId,
    required this.productTypeId,
    required this.quantity,
    required this.unitId,
    required this.price,
    required this.unit,
    this.name,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      categoryId: json['category_id'],
      productTypeId: json['product_type_id'],
      quantity: json['quantity'],
      unitId: json['unit_id'],
      price: json['price'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() => {
        'category_id': categoryId,
        'product_type_id': productTypeId,
        'quantity': quantity,
        'unit_id': unitId,
        'price': price,
        'unit': unit,
      };

  @override
  List<Object?> get props =>
      [categoryId, productTypeId, quantity, unitId, price, unit];
}

// -------------------- DocSigner --------------------

class DocSigner extends Equatable {
  final int signerId;

  const DocSigner({required this.signerId});

  factory DocSigner.fromJson(Map<String, dynamic> json) =>
      DocSigner(signerId: json['signer_id']);

  Map<String, dynamic> toJson() => {'signer_id': signerId};

  @override
  List<Object?> get props => [signerId];
}

class ProductAct extends Equatable {
  final String? countProduct;
  final String contractDetails;
  final String contractDetailsDate;
  final String manufacturer;
  final String shippingMethod;
  final String licence;
  final String licenceDate;
  final String sanitary;
  final String sanitaryDate;
  final String vetirinary;
  final String vetirinaryDate;
  final String quality;
  final String qualityDate;
  final String quantity;
  final int categoryId;
  final int productTypeId;
  final int unitId;
  final int price;
  final String unit;

  const ProductAct({
    required this.countProduct,
    required this.contractDetails,
    required this.contractDetailsDate,
    required this.manufacturer,
    required this.shippingMethod,
    required this.licence,
    required this.licenceDate,
    required this.sanitary,
    required this.sanitaryDate,
    required this.vetirinary,
    required this.vetirinaryDate,
    required this.quality,
    required this.qualityDate,
    required this.quantity,
    required this.categoryId,
    required this.productTypeId,
    required this.unitId,
    required this.price,
    required this.unit,
  });

  factory ProductAct.fromJson(Map<String, dynamic> json) {
    return ProductAct(
      countProduct: json['count_product'],
      contractDetails: json['contract_details'],
      contractDetailsDate: json['contract_details_date'],
      manufacturer: json['manufacturer'],
      shippingMethod: json['shipping_method'],
      licence: json['licence'],
      licenceDate: json['licence_date'],
      sanitary: json['sanitary'],
      sanitaryDate: json['sanitary_date'],
      vetirinary: json['vetirinary'],
      vetirinaryDate: json['vetirinary_date'],
      quality: json['quality'],
      qualityDate: json['quality_date'],
      quantity: json['quantity'],
      categoryId: json['category_id'],
      productTypeId: json['product_type_id'],
      unitId: json['unit_id'],
      price: json['price'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count_product': countProduct,
      'contract_details': contractDetails,
      'contract_details_date': contractDetailsDate,
      'manufacturer': manufacturer,
      'shipping_method': shippingMethod,
      'licence': licence,
      'licence_date': licenceDate,
      'sanitary': sanitary,
      'sanitary_date': sanitaryDate,
      'vetirinary': vetirinary,
      'vetirinary_date': vetirinaryDate,
      'quality': quality,
      'quality_date': qualityDate,
      'quantity': quantity,
      'category_id': categoryId,
      'product_type_id': productTypeId,
      'unit_id': unitId,
      'price': price,
      'unit': unit,
    };
  }

  ProductAct copyWith({
    String? countProduct,
    String? contractDetails,
    String? contractDetailsDate,
    String? manufacturer,
    String? shippingMethod,
    String? licence,
    String? licenceDate,
    String? sanitary,
    String? sanitaryDate,
    String? vetirinary,
    String? vetirinaryDate,
    String? quality,
    String? qualityDate,
    String? quantity,
    int? categoryId,
    int? productTypeId,
    int? unitId,
    int? price,
    String? unit,
  }) {
    return ProductAct(
      countProduct: countProduct ?? this.countProduct,
      contractDetails: contractDetails ?? this.contractDetails,
      contractDetailsDate: contractDetailsDate ?? this.contractDetailsDate,
      manufacturer: manufacturer ?? this.manufacturer,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      licence: licence ?? this.licence,
      licenceDate: licenceDate ?? this.licenceDate,
      sanitary: sanitary ?? this.sanitary,
      sanitaryDate: sanitaryDate ?? this.sanitaryDate,
      vetirinary: vetirinary ?? this.vetirinary,
      vetirinaryDate: vetirinaryDate ?? this.vetirinaryDate,
      quality: quality ?? this.quality,
      qualityDate: qualityDate ?? this.qualityDate,
      quantity: quantity ?? this.quantity,
      categoryId: categoryId ?? this.categoryId,
      productTypeId: productTypeId ?? this.productTypeId,
      unitId: unitId ?? this.unitId,
      price: price ?? this.price,
      unit: unit ?? this.unit,
    );
  }

  @override
  List<Object?> get props => [
        countProduct,
        contractDetails,
        contractDetailsDate,
        manufacturer,
        shippingMethod,
        licence,
        licenceDate,
        sanitary,
        sanitaryDate,
        vetirinary,
        vetirinaryDate,
        quality,
        qualityDate,
        quantity,
        categoryId,
        productTypeId,
        unitId,
        price,
        unit,
      ];
}
