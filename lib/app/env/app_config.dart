class AppConfig {
  final String baseUrl;
  final String apiKey;
  final bool enableLogs;
  final String env;

  AppConfig({
    required this.baseUrl,
    required this.apiKey,
    required this.enableLogs,
    required this.env,
  });
}