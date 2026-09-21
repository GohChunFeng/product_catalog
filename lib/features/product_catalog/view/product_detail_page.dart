import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_catalog/app_base/constants/colors.dart';
import 'package:product_catalog/app_base/constants/text_styles.dart';
import 'package:product_catalog/widgets/app_skeletonizer.dart';

import '../../../widgets/app_style_bar.dart';
import '../../../widgets/widget_size_ext.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: _wAppBar(context),
      body: Container(
        color: AppColors.appBg,
        child: SafeArea(
          // child: _wProductDetail().withPadding(EdgeInsetsGeometry.all(16)),
          child: _wProductDetailPlaceholder().withPadding(
            EdgeInsetsGeometry.all(16),
          ),
        ),
      ),
    );
  }

  Column _wProductDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //     // color: AppColors.neutral0,
        //     borderRadius: BorderRadius.circular(16),
        //     border: Border.all(color: AppColors.neutral200),
        //     // boxShadow: [AppColors.regularShadowXSmall],
        //   ),
        //   child: Center(
        //     child: CachedNetworkImage(
        //       imageUrl: 'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp',
        //     ),
        //   ),
        // ),
        _buildCarouselView(
          images: [
            'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp',
            'https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/1.webp',
            'https://cdn.dummyjson.com/product-images/beauty/powder-canister/1.webp',
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.sky300,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                'Beauty & Personal Care',
                style: AppTextStyles.labelXSmall.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                  Icon(Icons.circle, size: 6, color: AppColors.neutral500),
                  Text(
                    'In Stock (5)',
                    style: AppTextStyles.labelXSmall.copyWith(
                      color: AppColors.neutral500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          'ESSENCE',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: AppTextStyles.labelMedium.copyWith(color: AppColors.primary),
        ),
        Text(
          'Essence Mascara Lash Princess Essence Mascara Lash Princess Essence Mascara Lash Princess',
          style: AppTextStyles.labelLarge.copyWith(
            fontVariations: [FontVariation('wght', 700)],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.sky300,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                  Icon(Icons.star, size: 12, color: AppColors.primary),
                  Text(
                    '4.94',
                    style: AppTextStyles.subHeading2XSmall.copyWith(),
                  ),
                ],
              ),
            ),
            Text(
              '120 verified customer reviews',
              style: AppTextStyles.label2XSmall.copyWith(),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsetsGeometry.all(32),
          decoration: BoxDecoration(
            color: AppColors.sky300,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Text(
                '\$9.99',
                style: AppTextStyles.titleH2Title.copyWith(
                  fontVariations: [FontVariation('wght', 700)],
                  height: 1.0,
                ),
              ),
              Text(
                '\$${_calculateOriginalPrice(9.99, 7.17)}',
                style: AppTextStyles.titleH5Title.copyWith(
                  color: AppColors.neutral500,
                  decoration: TextDecoration.lineThrough,
                  height: 1.0,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.pink100,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '-15% OFF',
                  style: AppTextStyles.subHeading2XSmall.copyWith(
                    color: AppColors.red950,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _wProductDetailPlaceholder() {
    return AppSkeletonizer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
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
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.sky300,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  'Beauty & Personal Care',
                  style: AppTextStyles.labelXSmall.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Icon(Icons.circle, size: 6, color: AppColors.neutral500),
                    Text(
                      'In Stock (5)',
                      style: AppTextStyles.labelXSmall.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            'ESSENCE',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppTextStyles.labelMedium.copyWith(color: AppColors.primary),
          ),
          Text(
            'Essence Mascara Lash Princess Essence Mascara Lash Princess Essence Mascara Lash Princess',
            style: AppTextStyles.labelLarge.copyWith(
              fontVariations: [FontVariation('wght', 700)],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.sky300,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Icon(Icons.star, size: 12, color: AppColors.primary),
                    Text(
                      '4.94',
                      style: AppTextStyles.subHeading2XSmall.copyWith(),
                    ),
                  ],
                ),
              ),
              Text(
                '120 verified customer reviews',
                style: AppTextStyles.label2XSmall.copyWith(),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsetsGeometry.all(32),
            decoration: BoxDecoration(
              color: AppColors.sky300,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                Text(
                  '\$9.99',
                  style: AppTextStyles.titleH2Title.copyWith(
                    fontVariations: [FontVariation('wght', 700)],
                    height: 1.0,
                  ),
                ),
                Text(
                  '\$${_calculateOriginalPrice(9.99, 7.17)}',
                  style: AppTextStyles.titleH5Title.copyWith(
                    color: AppColors.neutral500,
                    decoration: TextDecoration.lineThrough,
                    height: 1.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.pink100,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '-15% OFF',
                    style: AppTextStyles.subHeading2XSmall.copyWith(
                      color: AppColors.red950,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _wAppBar(BuildContext context) {
    return AppStyleBar.buildHeaderTitleAppbar(
      context,
      showLeading: true,
      title: 'Product Detail',
    );
  }

  Widget _buildCarouselView({
    required List<String> images,
    bool isPlaceholder = false,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16.0,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              // viewportFraction: 1,
              height: 180,
              // enlargeFactor: 0,
              enableInfiniteScroll: true,
              disableCenter: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            carouselController: _controller,
            items: images
                .map(
                  (img) => Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: isPlaceholder
                          ? Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: AppColors.neutral200,
                              ),
                            )
                          : CachedNetworkImage(
                              imageUrl: img,
                              fit: BoxFit.contain,
                              // alignment: Alignment(0.0, -0.3),
                              // progressIndicatorBuilder: (context, url, progress) {
                              //   return Center(child: const CircularProgressIndicator());
                              // },
                              errorWidget: (context, url, error) {
                                return Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: AppColors.neutral200,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                )
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: images.asMap().entries.map((entry) {
              final int index = entry.key;
              final bool isActive = index == _current;
              return GestureDetector(
                onTap: () => _controller.animateToPage(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: 4,
                  width: isActive ? 16 : 8,
                  // margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: isActive ? AppColors.accent : AppColors.bgSub300,
                  ),
                ),
              );
            }).toList(),
          ).withHeight(16),
        ],
      ),
    ).withPadding(const EdgeInsets.only(top: 24));
  }

  String _calculateOriginalPrice(double salePrice, double discountPercent) {
    // Divide sale price by the remaining percentage factor
    return (salePrice / (1 - (discountPercent / 100))).toStringAsFixed(2);
  }
}
