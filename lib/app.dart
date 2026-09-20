import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_catalog/app_base/constants/colors.dart';
import 'package:product_catalog/features/product_catalog/cubit/product_catalog_cubit.dart';
import 'package:product_catalog/features/product_catalog/view/test_screen.dart';
import 'package:product_catalog/services/api/product_catalog_api.dart';
import 'package:product_catalog/services/repositories/product_catalog_repository.dart';

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
        child: TestScreen(),
      ),
    );
  }
}
