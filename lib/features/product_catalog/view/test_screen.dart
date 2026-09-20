import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_catalog/app_base/constants/colors.dart';
import 'package:product_catalog/features/product_catalog/cubit/product_catalog_cubit.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
    final productCatalogCubit = context.read<ProductCatalogCubit>();
    productCatalogCubit.loadProductCatalog();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.accent);
  }
}
