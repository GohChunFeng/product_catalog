import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog/features/global/cubit/global_cubit.dart';
import 'package:product_catalog/features/product_catalog/view/product_listing_page.dart';

import '../../features/product_catalog/cubit/product_catalog_cubit.dart';
import '../../features/product_catalog/view/product_detail_page.dart';
import '../../services/repositories/product_catalog_repository.dart';

part 'app_router.g.dart';

@TypedGoRoute<ProductListingRoute>(path: '/home')
class ProductListingRoute extends GoRouteData with $ProductListingRoute {
  const ProductListingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProductListingPage();
}

@TypedGoRoute<ProductDetailRoute>(path: '/product_detail')
class ProductDetailRoute extends GoRouteData with $ProductDetailRoute {
  final String productId;
  const ProductDetailRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (context) => ProductCatalogCubit(
      globalCubit: context.read<GlobalCubit>(),
      productCatalogRepository: context.read<ProductCatalogRepository>(),
    ),
    child: ProductDetailPage(productId: productId),
  );
}
