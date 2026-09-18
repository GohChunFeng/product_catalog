import '../../app.dart';
import 'app_config.dart';

void main() async {
  AppConfig.curEnv = AppConfig.devEnv;
  await runMyApp();
}
