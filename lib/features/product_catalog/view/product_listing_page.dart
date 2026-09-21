import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_catalog/app_base/constants/colors.dart';
import 'package:product_catalog/app_base/constants/text_styles.dart';
import 'package:product_catalog/app_base/router/app_router.dart';
import 'package:product_catalog/features/product_catalog/cubit/product_catalog_cubit.dart';
import 'package:product_catalog/features/product_catalog/cubit/product_catalog_state.dart';
import 'package:product_catalog/features/product_catalog/model/response/product_catalog_model.dart';
import 'package:product_catalog/features/product_catalog/view/product_detail_page.dart';
import 'package:product_catalog/generated/assets/assets.gen.dart';
import 'package:product_catalog/utils/debounce_helper.dart';
import 'package:product_catalog/utils/load_state.dart';
import 'package:product_catalog/widgets/app_search_text_field.dart';
import 'package:product_catalog/widgets/widget_size_ext.dart';

import '../../../widgets/app_skeletonizer.dart';
import '../../../widgets/app_style_bar.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  final TextEditingController _searchController = TextEditingController();
  final DebounceHelper searchDebounceHelper = DebounceHelper();
  final EasyRefreshController refreshController = EasyRefreshController(
    controlFinishLoad: true,
    controlFinishRefresh: true,
  );
  final bool _needRefresh = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getAll(refresh: true);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    searchDebounceHelper.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: _wAppBar(context),
      body: Container(
        color: AppColors.appBg,
        child: SafeArea(
          child: Column(
            children: [
              AppSearchTextField(
                searchTextController: _searchController,
                onClear: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _updateSearchKeyword("");
                },
                onChange: (String keyword) {
                  searchDebounceHelper.run(() {
                    FocusManager.instance.primaryFocus?.unfocus();
                    _updateSearchKeyword(keyword);
                  });
                },
              ).withPadding(const EdgeInsetsGeometry.all(16)),
              Expanded(
                child: BlocListener<ProductCatalogCubit, ProductCatalogState>(
                  listener: (context, state) {
                    if (state.total ==
                        state.productCatalogPageLoadData.value?.length) {
                      refreshController.finishLoad(IndicatorResult.noMore);
                    }
                  },
                  child: BlocBuilder<ProductCatalogCubit, ProductCatalogState>(
                    builder: (context, state) {
                      final productCatalogPageLoadData =
                          state.productCatalogPageLoadData;
                      return EasyRefresh(
                        header: const CupertinoHeader(),
                        footer: CupertinoFooter(emptyWidget: SizedBox.shrink()),
                        controller: refreshController,
                        onRefresh: () async {
                          await _getAll(refresh: true);
                          setState(() {});
                          refreshController.finishRefresh();
                          refreshController.resetFooter();
                        },
                        onLoad: () async {
                          await _getAll();
                        },
                        child: LoadStateUtil.switchPageLoadState(
                          productCatalogPageLoadData.state,
                          loading: () {
                            return GridView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    maxCrossAxisExtent: 300,
                                    childAspectRatio: 0.55,
                                  ),
                              itemBuilder: (context, index) {
                                return _wProductCardPlaceholder();
                              },
                              itemCount: 20,
                            );
                          },
                          success: () {
                            final dataList =
                                productCatalogPageLoadData.value ?? [];
                            return GridView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    maxCrossAxisExtent: 300,
                                    childAspectRatio: 0.55,
                                  ),
                              itemBuilder: (context, index) {
                                return _wProductCard(dataList[index]);
                                // return _wProductCardPlaceholder();
                              },
                              itemCount: dataList.length,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _wProductCard(ProductCatalogProducts product) {
    return GestureDetector(
      onTap: () {
        ProductDetailRoute(productId: product.id.toString()).push(context);
      },
      child: Container(
        decoration: BoxDecoration(
          // color: AppColors.green50,
          color: AppColors.neutral0,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            // CachedNetworkImage(
            //   imageUrl: 'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp',
            // ),
            Container(
              decoration: BoxDecoration(
                // color: AppColors.neutral0,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.neutral200),
                // boxShadow: [AppColors.regularShadowXSmall],
              ),
              child: Stack(
                children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: product.thumbnail ?? '',
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.pink100,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        '-${product.discountPercentage.toString()}%',
                        style: AppTextStyles.subHeading2XSmall.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 6,
                            color: AppColors.neutral500,
                          ),
                          Text(
                            '${product.availabilityStatus} (${product.stock})',
                            style: AppTextStyles.subHeading2XSmall.copyWith(
                              color: AppColors.neutral500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.brand ?? 'No branding',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyles.subHeading2XSmall.copyWith(
                    color: AppColors.neutral500,
                  ),
                ).flexible(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.sky300,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 0,
                    children: [
                      Icon(Icons.star, size: 12, color: AppColors.primary),
                      Text(
                        product.rating.toString(),
                        style: AppTextStyles.subHeading2XSmall.copyWith(),
                      ).withPadding(
                        const EdgeInsetsGeometry.only(left: 4, right: 2),
                      ),
                      Text(
                        product.reviews?.length != null
                            ? '(${product.reviews?.length.toString()})'
                            : '0',
                        style: AppTextStyles.label2XSmall.copyWith(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              product.title ?? 'No title',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: AppTextStyles.labelMedium.copyWith(
                fontVariations: [FontVariation('wght', 700)],
              ),
            ),
            SizedBox().expanded(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  '\$${product.price}',
                  style: AppTextStyles.labelMedium.copyWith(
                    fontVariations: [FontVariation('wght', 900)],
                    height: 1.0,
                  ),
                ),
                Text(
                  '\$${_calculateOriginalPrice(product.price ?? 0, product.discountPercentage ?? 0)}',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.neutral500,
                    decoration: TextDecoration.lineThrough,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ).withPadding(const EdgeInsetsGeometry.all(8)),
      ),
    );
  }

  Widget _wProductCardPlaceholder() {
    return AppSkeletonizer(
      child: Container(
        decoration: BoxDecoration(
          // color: AppColors.green50,
          color: AppColors.neutral0,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.neutral200,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.neutral200),
                  // boxShadow: [AppColors.regularShadowXSmall],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ESSENCE',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyles.subHeading2XSmall.copyWith(
                    color: AppColors.neutral500,
                  ),
                ).flexible(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.sky300,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 0,
                    children: [
                      Icon(Icons.star, size: 12, color: AppColors.primary),
                      Text(
                        '4.94',
                        style: AppTextStyles.subHeading2XSmall.copyWith(),
                      ).withPadding(
                        const EdgeInsetsGeometry.only(left: 4, right: 2),
                      ),
                      Text(
                        '(120)',
                        style: AppTextStyles.label2XSmall.copyWith(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              'Essence Mascara Lash Princess Essence Mascara Lash Princess Essence Mascara Lash Princess',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: AppTextStyles.labelMedium.copyWith(
                fontVariations: [FontVariation('wght', 700)],
              ),
            ),
            SizedBox().expanded(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  '\$9.99',
                  style: AppTextStyles.labelMedium.copyWith(
                    fontVariations: [FontVariation('wght', 900)],
                    height: 1.0,
                  ),
                ),
                Text(
                  '\$${_calculateOriginalPrice(9.99, 7.17)}',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.neutral500,
                    decoration: TextDecoration.lineThrough,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ).withPadding(const EdgeInsetsGeometry.all(8)),
      ),
    );
  }

  AppBar _wAppBar(BuildContext context) {
    return AppStyleBar.buildHeaderTitleAppbar(
      context,
      showLeading: true,
      leadingWidth: 52,
      customLeading: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: SvgPicture.asset(
            Assets.icons.store.path,
            height: 16,
            width: 16,
          ),
        ),
      ),
      titleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DummyStore',
            style: AppTextStyles.labelSmall.copyWith(
              fontVariations: [FontVariation('wght', 700)],
            ),
          ),
          Text('Catalog', style: AppTextStyles.labelXSmall),
        ],
      ),
    );
  }

  Future<void> _getAll({bool refresh = false}) async {
    final productCatalogCubit = context.read<ProductCatalogCubit>();
    await productCatalogCubit.loadProductCatalog(refresh: refresh);
    // await productCatalogCubit.loadProductCatalogBySearch();
    // await productCatalogCubit.loadProductDetailById("1");
  }

  void _updateSearchKeyword(String keyword) {
    final productCatalogCubit = context.read<ProductCatalogCubit>();
    productCatalogCubit.updateSearchKeyword(keyword);
  }

  String _calculateOriginalPrice(double salePrice, double discountPercent) {
    // Divide sale price by the remaining percentage factor
    return (salePrice / (1 - (discountPercent / 100))).toStringAsFixed(2);
  }
}
