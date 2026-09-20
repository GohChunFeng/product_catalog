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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _testApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.accent);
  }

  Future<void> _testApi() async {
    final productCatalogCubit = context.read<ProductCatalogCubit>();
    await productCatalogCubit.loadProductCatalog();
    await productCatalogCubit.loadProductCatalogBySearch();
    await productCatalogCubit.loadProductDetailById("1");
  }
}
