import 'package:bloc/bloc.dart';
import 'package:product_catalog/features/product_catalog/cubit/product_catalog_state.dart';
import 'package:product_catalog/services/repositories/product_catalog_repository.dart';

class ProductCatalogCubit extends Cubit<ProductCatalogState> {
  final ProductCatalogRepository _productCatalogRepository;

  ProductCatalogCubit({required this._productCatalogRepository})
    : super(ProductCatalogState.initial());

  Future<void> loadProductCatalog({bool refresh = true}) async {
    final response = await _productCatalogRepository.getCategoryList(
      page: 0,
      pageSize: 5,
    );
  }
}
