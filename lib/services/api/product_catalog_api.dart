import 'package:product_catalog/app_base/network/api_data.dart';
import 'package:product_catalog/app_base/network/net_core.dart';
import 'package:product_catalog/app_base/network/net_request_helper.dart';
import 'package:product_catalog/features/product_catalog/model/response/product_catalog_model.dart';

class ProductCatalogApi {
  Future<HttpResult<List<ProductCatalogModel>>> getProductListing({
    int? page,
    int? pageSize,
  }) {
    Map<String, dynamic> params = {'limit': pageSize, 'skip': page};

    return getApiClient().get('/products/', parameters: params).thenHttpResult((
      jsonList,
    ) {
      return (jsonList as List)
          .map((json) => ProductCatalogModel.fromJson(json))
          .toList();
    });
  }
}
