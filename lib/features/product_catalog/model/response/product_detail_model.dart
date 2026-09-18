import 'package:product_catalog/generated/json/base/json_field.dart';
import 'package:product_catalog/generated/json/product_detail_model.g.dart';

import 'dart:convert';

export 'package:product_catalog/generated/json/product_detail_model.g.dart';

@JsonSerializable()
class ProductDetailModel {
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
  ProductDetailDimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<ProductDetailReviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  ProductDetailMeta? meta;
  List<String>? images;
  String? thumbnail;

  ProductDetailModel();

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      $ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => $ProductDetailModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductDetailDimensions {
  double? width;
  double? height;
  double? depth;

  ProductDetailDimensions();

  factory ProductDetailDimensions.fromJson(Map<String, dynamic> json) =>
      $ProductDetailDimensionsFromJson(json);

  Map<String, dynamic> toJson() => $ProductDetailDimensionsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductDetailReviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  ProductDetailReviews();

  factory ProductDetailReviews.fromJson(Map<String, dynamic> json) =>
      $ProductDetailReviewsFromJson(json);

  Map<String, dynamic> toJson() => $ProductDetailReviewsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductDetailMeta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  ProductDetailMeta();

  factory ProductDetailMeta.fromJson(Map<String, dynamic> json) =>
      $ProductDetailMetaFromJson(json);

  Map<String, dynamic> toJson() => $ProductDetailMetaToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
