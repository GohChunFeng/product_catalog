import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_catalog/app_base/constants/colors.dart';
import 'package:product_catalog/app_base/constants/text_styles.dart';
import 'package:product_catalog/features/product_catalog/cubit/product_catalog_cubit.dart';
import 'package:product_catalog/generated/assets/assets.gen.dart';
import 'package:product_catalog/utils/debounce_helper.dart';
import 'package:product_catalog/widgets/app_search_text_field.dart';
import 'package:product_catalog/widgets/widget_size_ext.dart';

import '../../../widgets/app_style_bar.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TextEditingController _searchController = TextEditingController();
  final DebounceHelper searchDebounceHelper = DebounceHelper();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // _testApi();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    searchDebounceHelper.dispose();
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
                onChange: (String keyword) {
                  searchDebounceHelper.run(() {
                    print("start query");
                  });
                },
              ).withPadding(const EdgeInsetsGeometry.all(16)),
              Expanded(
                child:
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          _wProductCard(),
                          _wProductCard(),
                          _wProductCard(),
                          _wProductCard(),
                          _wProductCard(),
                          _wProductCard(),
                          _wProductCard(),
                          _wProductCard(),
                        ],
                      ),
                    ).withPadding(
                      const EdgeInsetsGeometry.symmetric(horizontal: 16),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _wProductCard() {
    return Container(
      decoration: BoxDecoration(
        // color: AppColors.green50,
        color: AppColors.neutral0,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CachedNetworkImage(
          //   imageUrl: 'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp',
          // ),
          Center(
            child: CachedNetworkImage(
              height: 150,
              width: 150,
              imageUrl: 'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp',
            ),
          ),

          Text('ESSENCE', style: AppTextStyles.labelSmall),
          Text(
            'Essence Mascara Lash Princess',
            style: AppTextStyles.labelMedium,
          ),
        ],
      ).withPadding(const EdgeInsetsGeometry.all(8)),
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

  Future<void> _testApi() async {
    final productCatalogCubit = context.read<ProductCatalogCubit>();
    await productCatalogCubit.loadProductCatalog();
    await productCatalogCubit.loadProductCatalogBySearch();
    await productCatalogCubit.loadProductDetailById("1");
  }
}
