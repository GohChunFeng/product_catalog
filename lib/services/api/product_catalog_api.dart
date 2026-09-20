import 'package:product_catalog/app_base/network/api_data.dart';
import 'package:product_catalog/app_base/network/net_core.dart';
import 'package:product_catalog/app_base/network/net_request_helper.dart';
import 'package:product_catalog/features/product_catalog/model/response/product_catalog_model.dart';
import 'package:product_catalog/features/product_catalog/model/response/product_detail_model.dart';

class ProductCatalogApi {
  Future<ProductCatalogModel> getProductListing({int? limit, int? skip}) {
    Map<String, dynamic> params = {'limit': limit, 'skip': skip};

    /// will not use this chunk of code, can check for the api_data.dart file for more details.
    // return getApiClient().get('/products/', parameters: params).thenHttpResult((
    //   jsonList,
    // ) {
    //   return (jsonList as List)
    //       .map((json) => ProductCatalogModel.fromJson(json))
    //       .toList();
    // });

    /// use this instead, no more HttpResult wrapper
    return getApiClient().get('/products/', parameters: params).thenCustom((
      jsonData,
    ) {
      return ProductCatalogModel.fromJson(jsonData);
    });
  }

  Future<ProductCatalogModel> getProductListingBySearch({
    String? keyword,
    int? limit,
    int? skip,
  }) {
    Map<String, dynamic> params = {'q': keyword, 'limit': limit, 'skip': skip};
    return getApiClient()
        .get('/products/search', parameters: params)
        .thenCustom((jsonData) {
          return ProductCatalogModel.fromJson(jsonData);
        });
  }

  Future<ProductDetailModel> getProductDetailById(String id) {
    return getApiClient().get('/products/$id').thenCustom((jsonData) {
      return ProductDetailModel.fromJson(jsonData);
    });
  }
}
