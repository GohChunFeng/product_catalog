import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_catalog/features/product_catalog/cubit/product_catalog_state.dart';
import 'package:product_catalog/services/repositories/product_catalog_repository.dart';

class ProductCatalogCubit extends Cubit<ProductCatalogState> {
  final ProductCatalogRepository _productCatalogRepository;

  ProductCatalogCubit({required this._productCatalogRepository})
    : super(ProductCatalogState.initial());

  Future<void> loadProductCatalog({bool refresh = true}) async {
    final response = await _productCatalogRepository.getProductListing(
      limit: 20,
      skip: 50,
    );
    print("list catalog: $response");
  }

  Future<void> loadProductCatalogBySearch({bool refresh = true}) async {
    final response = await _productCatalogRepository.getProductListingBySearch(
      keyword: 'phone',
      limit: 20,
      skip: 0,
    );
    print("list catalog by search: $response");
  }

  Future<void> loadProductDetailById(String id) async {
    final response = await _productCatalogRepository.getProductDetail(id);

    print("product detail: $response");
  }
}
