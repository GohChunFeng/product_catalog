// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$productListingRoute, $productDetailRoute];

RouteBase get $productListingRoute => GoRouteData.$route(
  path: '/home',
  hasOverriddenOnExit: false,
  factory: $ProductListingRoute._fromState,
);

mixin $ProductListingRoute on GoRouteData {
  static ProductListingRoute _fromState(GoRouterState state) =>
      const ProductListingRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $productDetailRoute => GoRouteData.$route(
  path: '/product_detail',
  hasOverriddenOnExit: false,
  factory: $ProductDetailRoute._fromState,
);

mixin $ProductDetailRoute on GoRouteData {
  static ProductDetailRoute _fromState(GoRouterState state) =>
      ProductDetailRoute(productId: state.uri.queryParameters['product-id']!);

  ProductDetailRoute get _self => this as ProductDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/product_detail',
    queryParams: {'product-id': _self.productId},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
