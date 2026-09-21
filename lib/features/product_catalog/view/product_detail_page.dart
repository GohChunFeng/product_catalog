import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_catalog/app_base/constants/colors.dart';
import 'package:product_catalog/app_base/constants/text_styles.dart';

import '../../../widgets/app_style_bar.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: _wAppBar(context),
      body: Container(color: AppColors.primary),
    );
  }

  AppBar _wAppBar(BuildContext context) {
    return AppStyleBar.buildHeaderTitleAppbar(
      context,
      showLeading: true,
      // leadingWidth: 52,
      title: 'Product Detail',
      // titleWidget: Text(
      //   'DummyStore',
      //   style: AppTextStyles.labelSmall.copyWith(
      //     fontVariations: [FontVariation('wght', 700)],
      //   ),
      // ),
    );
  }
}
