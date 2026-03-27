class AppEnv {
  AppEnv._();

  static late final String env;
  static late final String baseUrl;
  static late final String apiKey;
  static late final bool enableLogs;

  static void setup() {
    env = const String.fromEnvironment('ENV', defaultValue: 'dev');

    baseUrl = const String.fromEnvironment(
      'BASE_URL',
      defaultValue: '',
    );

    apiKey = const String.fromEnvironment(
      'API_KEY',
      defaultValue: '',
    );

    enableLogs = const bool.fromEnvironment(
      'SHOW_LOGS',
      defaultValue: true,
    );

    _validate();

    // Debug print
    if (enableLogs) {
      print("🔥 ENV: $env");
      print("🌍 BASE_URL: $baseUrl");
    }
  }

  /// 🔥 Safety check
  static void _validate() {
    if (baseUrl.isEmpty) {
      throw Exception("BASE_URL is missing");
    }

    if (apiKey.isEmpty) {
      throw Exception("API_KEY is missing");
    }
  }
}