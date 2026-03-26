import 'package:movie_app/app/env/app_config.dart';
import 'package:movie_app/app/env/flavor.dart';

class AppEnv {
  static late AppConfig config;
  static late Flavor flavor;

  static void setUp(){
    const envStr = String.fromEnvironment('ENV', defaultValue: 'development');
    const baseUrl = String.fromEnvironment('BASE_URL');
    const apiKey = String.fromEnvironment('API_KEY');
    const showLogs = bool.fromEnvironment('SHOW_LOGS', defaultValue: true);

    // 🔥 convert string → enum
    flavor = _mapFlavor(envStr);

    config = AppConfig(
      baseUrl: baseUrl,
      apiKey: apiKey,
      enableLogs: showLogs,
      env: envStr,
    );

    print("🔥 ENV: $envStr");
  }

  static Flavor _mapFlavor(String env) {
    switch (env) {
      case 'prod':
        return Flavor.production;
      case 'staging':
        return Flavor.staging;
      case 'mock':
      default:
        return Flavor.development;
    }
  }

}