import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

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
    return Container(color: CupertinoColors.systemBackground);
  }
}
