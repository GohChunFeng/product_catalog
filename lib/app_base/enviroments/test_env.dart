import '../../app.dart';
import 'app_config.dart';

void main() async {
  AppConfig.curEnv = AppConfig.testEnv;
  await runMyApp();
}
