import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_catalog/features/product_catalog/cubit/product_catalog_state.dart';
import 'package:product_catalog/features/product_catalog/model/response/product_catalog_model.dart';
import 'package:product_catalog/services/repositories/product_catalog_repository.dart';

import '../../global/cubit/global_cubit.dart';

class ProductCatalogCubit extends Cubit<ProductCatalogState> {
  final GlobalCubit _globalCubit;
  final ProductCatalogRepository _productCatalogRepository;

  ProductCatalogCubit({
    required this._globalCubit,
    required this._productCatalogRepository,
  }) : super(ProductCatalogState.initial());

  void updateSearchKeyword(String keyword) {
    emit(state.copyWith(keyword: keyword));
    loadProductCatalog(refresh: true);
  }

  Future<void> loadProductCatalog({bool refresh = false}) async {
    _globalCubit.showLoading();
    try {
      emit(
        state.copyWith(
          productCatalogPageLoadData: state.productCatalogPageLoadData.load(
            refresh,
          ),
        ),
      );
      late ProductCatalogModel response;
      if (state.keyword != '') {
        response = await _productCatalogRepository.getProductListingBySearch(
          keyword: state.keyword,
          limit: state.limit,
          skip: refresh ? 0 : (state.skip! + state.limit!),
        );
      } else {
        response = await _productCatalogRepository.getProductListing(
          limit: state.limit,
          skip: refresh ? 0 : (state.skip! + state.limit!),
        );
      }
      emit(
        state.copyWith(
          // limit: response.limit,
          skip: response.skip,
          total: response.total,
          productCatalogPageLoadData: state.productCatalogPageLoadData.success(
            response.products,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          limit: 20,
          skip: 0,
          total: 0,
          productCatalogPageLoadData: state.productCatalogPageLoadData.failure(
            e,
          ),
        ),
      );
    }

    _globalCubit.hideLoading();
    // print("list catalog: $response");
  }

  Future<void> loadProductDetailById(String id) async {
    _globalCubit.showLoading();
    try {
      final response = await _productCatalogRepository.getProductDetail(id);
      emit(
        state.copyWith(
          productDetailLoadData: state.productDetailLoadData.success(response),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          limit: 20,
          skip: 0,
          total: 0,
          productCatalogPageLoadData: state.productCatalogPageLoadData.failure(
            e,
          ),
        ),
      );
    }

    _globalCubit.hideLoading();
  }
}
