import 'package:product_catalog/generated/json/base/json_convert_content.dart';
import 'package:product_catalog/features/product_catalog/model/response/product_detail_model.dart';

ProductDetailModel $ProductDetailModelFromJson(Map<String, dynamic> json) {
  final ProductDetailModel productDetailModel = ProductDetailModel();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    productDetailModel.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    productDetailModel.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    productDetailModel.description = description;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    productDetailModel.category = category;
  }
  final double? price = jsonConvert.convert<double>(json['price']);
  if (price != null) {
    productDetailModel.price = price;
  }
  final double? discountPercentage = jsonConvert.convert<double>(
    json['discountPercentage'],
  );
  if (discountPercentage != null) {
    productDetailModel.discountPercentage = discountPercentage;
  }
  final double? rating = jsonConvert.convert<double>(json['rating']);
  if (rating != null) {
    productDetailModel.rating = rating;
  }
  final int? stock = jsonConvert.convert<int>(json['stock']);
  if (stock != null) {
    productDetailModel.stock = stock;
  }
  final List<String>? tags = (json['tags'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (tags != null) {
    productDetailModel.tags = tags;
  }
  final String? brand = jsonConvert.convert<String>(json['brand']);
  if (brand != null) {
    productDetailModel.brand = brand;
  }
  final String? sku = jsonConvert.convert<String>(json['sku']);
  if (sku != null) {
    productDetailModel.sku = sku;
  }
  final int? weight = jsonConvert.convert<int>(json['weight']);
  if (weight != null) {
    productDetailModel.weight = weight;
  }
  final ProductDetailDimensions? dimensions = jsonConvert
      .convert<ProductDetailDimensions>(json['dimensions']);
  if (dimensions != null) {
    productDetailModel.dimensions = dimensions;
  }
  final String? warrantyInformation = jsonConvert.convert<String>(
    json['warrantyInformation'],
  );
  if (warrantyInformation != null) {
    productDetailModel.warrantyInformation = warrantyInformation;
  }
  final String? shippingInformation = jsonConvert.convert<String>(
    json['shippingInformation'],
  );
  if (shippingInformation != null) {
    productDetailModel.shippingInformation = shippingInformation;
  }
  final String? availabilityStatus = jsonConvert.convert<String>(
    json['availabilityStatus'],
  );
  if (availabilityStatus != null) {
    productDetailModel.availabilityStatus = availabilityStatus;
  }
  final List<ProductDetailReviews>? reviews =
      (json['reviews'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<ProductDetailReviews>(e)
                    as ProductDetailReviews,
          )
          .toList();
  if (reviews != null) {
    productDetailModel.reviews = reviews;
  }
  final String? returnPolicy = jsonConvert.convert<String>(
    json['returnPolicy'],
  );
  if (returnPolicy != null) {
    productDetailModel.returnPolicy = returnPolicy;
  }
  final int? minimumOrderQuantity = jsonConvert.convert<int>(
    json['minimumOrderQuantity'],
  );
  if (minimumOrderQuantity != null) {
    productDetailModel.minimumOrderQuantity = minimumOrderQuantity;
  }
  final ProductDetailMeta? meta = jsonConvert.convert<ProductDetailMeta>(
    json['meta'],
  );
  if (meta != null) {
    productDetailModel.meta = meta;
  }
  final List<String>? images = (json['images'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (images != null) {
    productDetailModel.images = images;
  }
  final String? thumbnail = jsonConvert.convert<String>(json['thumbnail']);
  if (thumbnail != null) {
    productDetailModel.thumbnail = thumbnail;
  }
  return productDetailModel;
}

Map<String, dynamic> $ProductDetailModelToJson(ProductDetailModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['category'] = entity.category;
  data['price'] = entity.price;
  data['discountPercentage'] = entity.discountPercentage;
  data['rating'] = entity.rating;
  data['stock'] = entity.stock;
  data['tags'] = entity.tags;
  data['brand'] = entity.brand;
  data['sku'] = entity.sku;
  data['weight'] = entity.weight;
  data['dimensions'] = entity.dimensions?.toJson();
  data['warrantyInformation'] = entity.warrantyInformation;
  data['shippingInformation'] = entity.shippingInformation;
  data['availabilityStatus'] = entity.availabilityStatus;
  data['reviews'] = entity.reviews?.map((v) => v.toJson()).toList();
  data['returnPolicy'] = entity.returnPolicy;
  data['minimumOrderQuantity'] = entity.minimumOrderQuantity;
  data['meta'] = entity.meta?.toJson();
  data['images'] = entity.images;
  data['thumbnail'] = entity.thumbnail;
  return data;
}

extension ProductDetailModelExtension on ProductDetailModel {
  ProductDetailModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    ProductDetailDimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<ProductDetailReviews>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    ProductDetailMeta? meta,
    List<String>? images,
    String? thumbnail,
  }) {
    return ProductDetailModel()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..description = description ?? this.description
      ..category = category ?? this.category
      ..price = price ?? this.price
      ..discountPercentage = discountPercentage ?? this.discountPercentage
      ..rating = rating ?? this.rating
      ..stock = stock ?? this.stock
      ..tags = tags ?? this.tags
      ..brand = brand ?? this.brand
      ..sku = sku ?? this.sku
      ..weight = weight ?? this.weight
      ..dimensions = dimensions ?? this.dimensions
      ..warrantyInformation = warrantyInformation ?? this.warrantyInformation
      ..shippingInformation = shippingInformation ?? this.shippingInformation
      ..availabilityStatus = availabilityStatus ?? this.availabilityStatus
      ..reviews = reviews ?? this.reviews
      ..returnPolicy = returnPolicy ?? this.returnPolicy
      ..minimumOrderQuantity = minimumOrderQuantity ?? this.minimumOrderQuantity
      ..meta = meta ?? this.meta
      ..images = images ?? this.images
      ..thumbnail = thumbnail ?? this.thumbnail;
  }
}

ProductDetailDimensions $ProductDetailDimensionsFromJson(
  Map<String, dynamic> json,
) {
  final ProductDetailDimensions productDetailDimensions =
      ProductDetailDimensions();
  final double? width = jsonConvert.convert<double>(json['width']);
  if (width != null) {
    productDetailDimensions.width = width;
  }
  final double? height = jsonConvert.convert<double>(json['height']);
  if (height != null) {
    productDetailDimensions.height = height;
  }
  final double? depth = jsonConvert.convert<double>(json['depth']);
  if (depth != null) {
    productDetailDimensions.depth = depth;
  }
  return productDetailDimensions;
}

Map<String, dynamic> $ProductDetailDimensionsToJson(
  ProductDetailDimensions entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['width'] = entity.width;
  data['height'] = entity.height;
  data['depth'] = entity.depth;
  return data;
}

extension ProductDetailDimensionsExtension on ProductDetailDimensions {
  ProductDetailDimensions copyWith({
    double? width,
    double? height,
    double? depth,
  }) {
    return ProductDetailDimensions()
      ..width = width ?? this.width
      ..height = height ?? this.height
      ..depth = depth ?? this.depth;
  }
}

ProductDetailReviews $ProductDetailReviewsFromJson(Map<String, dynamic> json) {
  final ProductDetailReviews productDetailReviews = ProductDetailReviews();
  final int? rating = jsonConvert.convert<int>(json['rating']);
  if (rating != null) {
    productDetailReviews.rating = rating;
  }
  final String? comment = jsonConvert.convert<String>(json['comment']);
  if (comment != null) {
    productDetailReviews.comment = comment;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    productDetailReviews.date = date;
  }
  final String? reviewerName = jsonConvert.convert<String>(
    json['reviewerName'],
  );
  if (reviewerName != null) {
    productDetailReviews.reviewerName = reviewerName;
  }
  final String? reviewerEmail = jsonConvert.convert<String>(
    json['reviewerEmail'],
  );
  if (reviewerEmail != null) {
    productDetailReviews.reviewerEmail = reviewerEmail;
  }
  return productDetailReviews;
}

Map<String, dynamic> $ProductDetailReviewsToJson(ProductDetailReviews entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rating'] = entity.rating;
  data['comment'] = entity.comment;
  data['date'] = entity.date;
  data['reviewerName'] = entity.reviewerName;
  data['reviewerEmail'] = entity.reviewerEmail;
  return data;
}

extension ProductDetailReviewsExtension on ProductDetailReviews {
  ProductDetailReviews copyWith({
    int? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail,
  }) {
    return ProductDetailReviews()
      ..rating = rating ?? this.rating
      ..comment = comment ?? this.comment
      ..date = date ?? this.date
      ..reviewerName = reviewerName ?? this.reviewerName
      ..reviewerEmail = reviewerEmail ?? this.reviewerEmail;
  }
}

ProductDetailMeta $ProductDetailMetaFromJson(Map<String, dynamic> json) {
  final ProductDetailMeta productDetailMeta = ProductDetailMeta();
  final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
  if (createdAt != null) {
    productDetailMeta.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
  if (updatedAt != null) {
    productDetailMeta.updatedAt = updatedAt;
  }
  final String? barcode = jsonConvert.convert<String>(json['barcode']);
  if (barcode != null) {
    productDetailMeta.barcode = barcode;
  }
  final String? qrCode = jsonConvert.convert<String>(json['qrCode']);
  if (qrCode != null) {
    productDetailMeta.qrCode = qrCode;
  }
  return productDetailMeta;
}

Map<String, dynamic> $ProductDetailMetaToJson(ProductDetailMeta entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['createdAt'] = entity.createdAt;
  data['updatedAt'] = entity.updatedAt;
  data['barcode'] = entity.barcode;
  data['qrCode'] = entity.qrCode;
  return data;
}

extension ProductDetailMetaExtension on ProductDetailMeta {
  ProductDetailMeta copyWith({
    String? createdAt,
    String? updatedAt,
    String? barcode,
    String? qrCode,
  }) {
    return ProductDetailMeta()
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..barcode = barcode ?? this.barcode
      ..qrCode = qrCode ?? this.qrCode;
  }
}
