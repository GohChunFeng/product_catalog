import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_catalog/features/product_catalog/model/response/product_detail_model.dart';
import 'package:product_catalog/utils/load_state.dart';

import '../model/response/product_catalog_model.dart';

part 'product_catalog_state.freezed.dart';

@freezed
sealed class ProductCatalogState with _$ProductCatalogState {
  const factory ProductCatalogState({
    @Default(20) int? limit,

    @Default(0) int? skip,

    @Default(0) int? total,

    @Default(PageLoadData.init())
    PageLoadData<ProductCatalogProducts> productCatalogPageLoadData,

    @Default('') String keyword,

    @Default(LoadData.init())
    LoadData<ProductDetailModel> productDetailLoadData,
  }) = _ProductCatalogState;

  factory ProductCatalogState.initial() => ProductCatalogState(
    productCatalogPageLoadData: const PageLoadData.init(),
    productDetailLoadData: const LoadData.init(),
  );
}
