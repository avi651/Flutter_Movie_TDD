import '../../app/env/app_env.dart';

class AppLogger {
  AppLogger._();

  static void d(String message) {
    if (AppEnv.config.enableLogs) {
      print("🐛 DEBUG: $message");
    }
  }

  static void i(String message) {
    if (AppEnv.config.enableLogs) {
      print("ℹ️ INFO: $message");
    }
  }

  static void w(String message) {
    if (AppEnv.config.enableLogs) {
      print("⚠️ WARNING: $message");
    }
  }

  static void e(String message, [Object? error]) {
    if (AppEnv.config.enableLogs) {
      print("❌ ERROR: $message");
      if (error != null) {
        print("👉 $error");
      }
    }
  }
}