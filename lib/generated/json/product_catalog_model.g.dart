import 'package:product_catalog/generated/json/base/json_convert_content.dart';
import 'package:product_catalog/features/product_catalog/model/response/product_catalog_model.dart';

ProductCatalogModel $ProductCatalogModelFromJson(Map<String, dynamic> json) {
  final ProductCatalogModel productCatalogModel = ProductCatalogModel();
  final List<ProductCatalogProducts>? products =
      (json['products'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<ProductCatalogProducts>(e)
                    as ProductCatalogProducts,
          )
          .toList();
  if (products != null) {
    productCatalogModel.products = products;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    productCatalogModel.total = total;
  }
  final int? skip = jsonConvert.convert<int>(json['skip']);
  if (skip != null) {
    productCatalogModel.skip = skip;
  }
  final int? limit = jsonConvert.convert<int>(json['limit']);
  if (limit != null) {
    productCatalogModel.limit = limit;
  }
  return productCatalogModel;
}

Map<String, dynamic> $ProductCatalogModelToJson(ProductCatalogModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['products'] = entity.products?.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['skip'] = entity.skip;
  data['limit'] = entity.limit;
  return data;
}

extension ProductCatalogModelExtension on ProductCatalogModel {
  ProductCatalogModel copyWith({
    List<ProductCatalogProducts>? products,
    int? total,
    int? skip,
    int? limit,
  }) {
    return ProductCatalogModel()
      ..products = products ?? this.products
      ..total = total ?? this.total
      ..skip = skip ?? this.skip
      ..limit = limit ?? this.limit;
  }
}

ProductCatalogProducts $ProductCatalogProductsFromJson(
  Map<String, dynamic> json,
) {
  final ProductCatalogProducts productCatalogProducts =
      ProductCatalogProducts();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    productCatalogProducts.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    productCatalogProducts.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    productCatalogProducts.description = description;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    productCatalogProducts.category = category;
  }
  final double? price = jsonConvert.convert<double>(json['price']);
  if (price != null) {
    productCatalogProducts.price = price;
  }
  final double? discountPercentage = jsonConvert.convert<double>(
    json['discountPercentage'],
  );
  if (discountPercentage != null) {
    productCatalogProducts.discountPercentage = discountPercentage;
  }
  final double? rating = jsonConvert.convert<double>(json['rating']);
  if (rating != null) {
    productCatalogProducts.rating = rating;
  }
  final int? stock = jsonConvert.convert<int>(json['stock']);
  if (stock != null) {
    productCatalogProducts.stock = stock;
  }
  final List<String>? tags = (json['tags'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (tags != null) {
    productCatalogProducts.tags = tags;
  }
  final String? brand = jsonConvert.convert<String>(json['brand']);
  if (brand != null) {
    productCatalogProducts.brand = brand;
  }
  final String? sku = jsonConvert.convert<String>(json['sku']);
  if (sku != null) {
    productCatalogProducts.sku = sku;
  }
  final int? weight = jsonConvert.convert<int>(json['weight']);
  if (weight != null) {
    productCatalogProducts.weight = weight;
  }
  final ProductCatalogProductsDimensions? dimensions = jsonConvert
      .convert<ProductCatalogProductsDimensions>(json['dimensions']);
  if (dimensions != null) {
    productCatalogProducts.dimensions = dimensions;
  }
  final String? warrantyInformation = jsonConvert.convert<String>(
    json['warrantyInformation'],
  );
  if (warrantyInformation != null) {
    productCatalogProducts.warrantyInformation = warrantyInformation;
  }
  final String? shippingInformation = jsonConvert.convert<String>(
    json['shippingInformation'],
  );
  if (shippingInformation != null) {
    productCatalogProducts.shippingInformation = shippingInformation;
  }
  final String? availabilityStatus = jsonConvert.convert<String>(
    json['availabilityStatus'],
  );
  if (availabilityStatus != null) {
    productCatalogProducts.availabilityStatus = availabilityStatus;
  }
  final List<ProductCatalogProductsReviews>? reviews =
      (json['reviews'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<ProductCatalogProductsReviews>(e)
                    as ProductCatalogProductsReviews,
          )
          .toList();
  if (reviews != null) {
    productCatalogProducts.reviews = reviews;
  }
  final String? returnPolicy = jsonConvert.convert<String>(
    json['returnPolicy'],
  );
  if (returnPolicy != null) {
    productCatalogProducts.returnPolicy = returnPolicy;
  }
  final int? minimumOrderQuantity = jsonConvert.convert<int>(
    json['minimumOrderQuantity'],
  );
  if (minimumOrderQuantity != null) {
    productCatalogProducts.minimumOrderQuantity = minimumOrderQuantity;
  }
  final ProductCatalogProductsMeta? meta = jsonConvert
      .convert<ProductCatalogProductsMeta>(json['meta']);
  if (meta != null) {
    productCatalogProducts.meta = meta;
  }
  final List<String>? images = (json['images'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (images != null) {
    productCatalogProducts.images = images;
  }
  final String? thumbnail = jsonConvert.convert<String>(json['thumbnail']);
  if (thumbnail != null) {
    productCatalogProducts.thumbnail = thumbnail;
  }
  return productCatalogProducts;
}

Map<String, dynamic> $ProductCatalogProductsToJson(
  ProductCatalogProducts entity,
) {
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

extension ProductCatalogProductsExtension on ProductCatalogProducts {
  ProductCatalogProducts copyWith({
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
    ProductCatalogProductsDimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<ProductCatalogProductsReviews>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    ProductCatalogProductsMeta? meta,
    List<String>? images,
    String? thumbnail,
  }) {
    return ProductCatalogProducts()
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

ProductCatalogProductsDimensions $ProductCatalogProductsDimensionsFromJson(
  Map<String, dynamic> json,
) {
  final ProductCatalogProductsDimensions productCatalogProductsDimensions =
      ProductCatalogProductsDimensions();
  final double? width = jsonConvert.convert<double>(json['width']);
  if (width != null) {
    productCatalogProductsDimensions.width = width;
  }
  final double? height = jsonConvert.convert<double>(json['height']);
  if (height != null) {
    productCatalogProductsDimensions.height = height;
  }
  final double? depth = jsonConvert.convert<double>(json['depth']);
  if (depth != null) {
    productCatalogProductsDimensions.depth = depth;
  }
  return productCatalogProductsDimensions;
}

Map<String, dynamic> $ProductCatalogProductsDimensionsToJson(
  ProductCatalogProductsDimensions entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['width'] = entity.width;
  data['height'] = entity.height;
  data['depth'] = entity.depth;
  return data;
}

extension ProductCatalogProductsDimensionsExtension
    on ProductCatalogProductsDimensions {
  ProductCatalogProductsDimensions copyWith({
    double? width,
    double? height,
    double? depth,
  }) {
    return ProductCatalogProductsDimensions()
      ..width = width ?? this.width
      ..height = height ?? this.height
      ..depth = depth ?? this.depth;
  }
}

ProductCatalogProductsReviews $ProductCatalogProductsReviewsFromJson(
  Map<String, dynamic> json,
) {
  final ProductCatalogProductsReviews productCatalogProductsReviews =
      ProductCatalogProductsReviews();
  final int? rating = jsonConvert.convert<int>(json['rating']);
  if (rating != null) {
    productCatalogProductsReviews.rating = rating;
  }
  final String? comment = jsonConvert.convert<String>(json['comment']);
  if (comment != null) {
    productCatalogProductsReviews.comment = comment;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    productCatalogProductsReviews.date = date;
  }
  final String? reviewerName = jsonConvert.convert<String>(
    json['reviewerName'],
  );
  if (reviewerName != null) {
    productCatalogProductsReviews.reviewerName = reviewerName;
  }
  final String? reviewerEmail = jsonConvert.convert<String>(
    json['reviewerEmail'],
  );
  if (reviewerEmail != null) {
    productCatalogProductsReviews.reviewerEmail = reviewerEmail;
  }
  return productCatalogProductsReviews;
}

Map<String, dynamic> $ProductCatalogProductsReviewsToJson(
  ProductCatalogProductsReviews entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rating'] = entity.rating;
  data['comment'] = entity.comment;
  data['date'] = entity.date;
  data['reviewerName'] = entity.reviewerName;
  data['reviewerEmail'] = entity.reviewerEmail;
  return data;
}

extension ProductCatalogProductsReviewsExtension
    on ProductCatalogProductsReviews {
  ProductCatalogProductsReviews copyWith({
    int? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail,
  }) {
    return ProductCatalogProductsReviews()
      ..rating = rating ?? this.rating
      ..comment = comment ?? this.comment
      ..date = date ?? this.date
      ..reviewerName = reviewerName ?? this.reviewerName
      ..reviewerEmail = reviewerEmail ?? this.reviewerEmail;
  }
}

ProductCatalogProductsMeta $ProductCatalogProductsMetaFromJson(
  Map<String, dynamic> json,
) {
  final ProductCatalogProductsMeta productCatalogProductsMeta =
      ProductCatalogProductsMeta();
  final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
  if (createdAt != null) {
    productCatalogProductsMeta.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
  if (updatedAt != null) {
    productCatalogProductsMeta.updatedAt = updatedAt;
  }
  final String? barcode = jsonConvert.convert<String>(json['barcode']);
  if (barcode != null) {
    productCatalogProductsMeta.barcode = barcode;
  }
  final String? qrCode = jsonConvert.convert<String>(json['qrCode']);
  if (qrCode != null) {
    productCatalogProductsMeta.qrCode = qrCode;
  }
  return productCatalogProductsMeta;
}

Map<String, dynamic> $ProductCatalogProductsMetaToJson(
  ProductCatalogProductsMeta entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['createdAt'] = entity.createdAt;
  data['updatedAt'] = entity.updatedAt;
  data['barcode'] = entity.barcode;
  data['qrCode'] = entity.qrCode;
  return data;
}

extension ProductCatalogProductsMetaExtension on ProductCatalogProductsMeta {
  ProductCatalogProductsMeta copyWith({
    String? createdAt,
    String? updatedAt,
    String? barcode,
    String? qrCode,
  }) {
    return ProductCatalogProductsMeta()
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..barcode = barcode ?? this.barcode
      ..qrCode = qrCode ?? this.qrCode;
  }
}
