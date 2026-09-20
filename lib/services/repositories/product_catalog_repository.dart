import 'package:product_catalog/app_base/network/api_data.dart';
import 'package:product_catalog/features/product_catalog/model/response/product_catalog_model.dart';
import 'package:product_catalog/services/api/product_catalog_api.dart';

class ProductCatalogRepository {
  final ProductCatalogApi _productCatalogApi;
  ProductCatalogRepository({required this._productCatalogApi});

  Future<HttpResult<List<ProductCatalogModel>>> getCategoryList({
    int? page,
    int? pageSize,
  }) {
    return _productCatalogApi.getProductListing(page: page, pageSize: pageSize);
  }
}
