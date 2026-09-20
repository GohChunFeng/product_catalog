import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_catalog/features/product_catalog/model/response/product_detail_model.dart';
import 'package:product_catalog/utils/load_state.dart';

import '../model/response/product_catalog_model.dart';

part 'product_catalog_state.freezed.dart';

@freezed
sealed class ProductCatalogState with _$ProductCatalogState {
  const factory ProductCatalogState({
    @Default(PageLoadData.init())
    PageLoadData<ProductCatalogModel> productCatalogPageLoadData,

    @Default(LoadData.init())
    LoadData<ProductDetailModel> productDetailLoadData,
  }) = _ProductCatalogState;

  factory ProductCatalogState.initial() => ProductCatalogState(
    productCatalogPageLoadData: const PageLoadData.init(),
    productDetailLoadData: const LoadData.init(),
  );
}
