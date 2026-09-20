import 'package:product_catalog/app_base/network/api_data.dart';
import 'package:product_catalog/features/product_catalog/model/response/product_catalog_model.dart';
import 'package:product_catalog/features/product_catalog/model/response/product_detail_model.dart';
import 'package:product_catalog/services/api/product_catalog_api.dart';

class ProductCatalogRepository {
  final ProductCatalogApi _productCatalogApi;
  ProductCatalogRepository({required this._productCatalogApi});

  Future<ProductCatalogModel> getProductListing({int? limit, int? skip}) {
    return _productCatalogApi.getProductListing(limit: limit, skip: skip);
  }

  Future<ProductCatalogModel> getProductListingBySearch({
    String? keyword,
    int? limit,
    int? skip,
  }) {
    return _productCatalogApi.getProductListingBySearch(
      keyword: keyword,
      limit: limit,
      skip: skip,
    );
  }

  Future<ProductDetailModel> getProductDetail(String id) {
    return _productCatalogApi.getProductDetailById(id);
  }
}
