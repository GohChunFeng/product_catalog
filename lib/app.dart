import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog/app_base/constants/colors.dart';
import 'package:product_catalog/features/product_catalog/cubit/product_catalog_cubit.dart';
import 'package:product_catalog/services/api/product_catalog_api.dart';
import 'package:product_catalog/services/repositories/product_catalog_repository.dart';
import 'package:product_catalog/utils/global.dart';

import 'app_base/router/app_router.dart';
import 'features/product_catalog/view/product_listing_page.dart';

// add whatever you want to trigger before the app start, service initialization etc
Future<void> runMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set orientation to portrait only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

// initialization of the app, router, language, theme, etc
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = _getRouterConfig();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              ProductCatalogRepository(productCatalogApi: ProductCatalogApi()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductCatalogCubit(
              productCatalogRepository: context
                  .read<ProductCatalogRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(routerConfig: _router),
      ),
    );
  }

  GoRouter _getRouterConfig() {
    return GoRouter(
      routes: $appRoutes,
      navigatorKey: appNavKey,
      initialLocation: ProductListingRoute().location,
      redirect: (context, state) async {
        return null;
      },
    );
  }
}
