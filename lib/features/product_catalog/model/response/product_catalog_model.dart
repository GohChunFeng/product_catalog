import 'package:product_catalog/generated/json/base/json_field.dart';
import 'package:product_catalog/generated/json/product_catalog_model.g.dart';

import 'dart:convert';

export 'package:product_catalog/generated/json/product_catalog_model.g.dart';

@JsonSerializable()
class ProductCatalogModel {
  List<ProductCatalogProducts>? products;
  int? total;
  int? skip;
  int? limit;

  ProductCatalogModel();

  factory ProductCatalogModel.fromJson(Map<String, dynamic> json) =>
      $ProductCatalogModelFromJson(json);

  Map<String, dynamic> toJson() => $ProductCatalogModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductCatalogProducts {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  ProductCatalogProductsDimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<ProductCatalogProductsReviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  ProductCatalogProductsMeta? meta;
  List<String>? images;
  String? thumbnail;

  ProductCatalogProducts();

  factory ProductCatalogProducts.fromJson(Map<String, dynamic> json) =>
      $ProductCatalogProductsFromJson(json);

  Map<String, dynamic> toJson() => $ProductCatalogProductsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductCatalogProductsDimensions {
  double? width;
  double? height;
  double? depth;

  ProductCatalogProductsDimensions();

  factory ProductCatalogProductsDimensions.fromJson(
    Map<String, dynamic> json,
  ) => $ProductCatalogProductsDimensionsFromJson(json);

  Map<String, dynamic> toJson() =>
      $ProductCatalogProductsDimensionsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductCatalogProductsReviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  ProductCatalogProductsReviews();

  factory ProductCatalogProductsReviews.fromJson(Map<String, dynamic> json) =>
      $ProductCatalogProductsReviewsFromJson(json);

  Map<String, dynamic> toJson() => $ProductCatalogProductsReviewsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductCatalogProductsMeta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  ProductCatalogProductsMeta();

  factory ProductCatalogProductsMeta.fromJson(Map<String, dynamic> json) =>
      $ProductCatalogProductsMetaFromJson(json);

  Map<String, dynamic> toJson() => $ProductCatalogProductsMetaToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
