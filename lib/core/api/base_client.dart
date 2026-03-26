import 'package:dio/dio.dart';
import '../../app/env/app_env.dart';

class BaseClient {
  late final Dio dio;

  BaseClient() {
    dio = Dio(_baseOptions());

    dio.interceptors.addAll([
      _authInterceptor(),
      _retryInterceptor(),
      _errorInterceptor(),
      _loggingInterceptor(),
    ]);
  }

  /// 🌍 Base config
  BaseOptions _baseOptions() {
    return BaseOptions(
      baseUrl: AppEnv.config.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      responseType: ResponseType.json,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
  }

  /// 🔐 Auth + API Key
  Interceptor _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Example: token from storage
        final token = await _getToken();

        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }

        options.queryParameters['api_key'] = AppEnv.config.apiKey;

        return handler.next(options);
      },
    );
  }

  /// 🔁 Retry logic (basic)
  Interceptor _retryInterceptor() {
    return InterceptorsWrapper(
      onError: (e, handler) async {
        if (_shouldRetry(e)) {
          try {
            final response = await dio.request(
              e.requestOptions.path,
              options: Options(method: e.requestOptions.method),
              data: e.requestOptions.data,
              queryParameters: e.requestOptions.queryParameters,
            );
            return handler.resolve(response);
          } catch (_) {}
        }
        return handler.next(e);
      },
    );
  }

  /// ❌ Central error handling
  Interceptor _errorInterceptor() {
    return InterceptorsWrapper(
      onError: (e, handler) {
        String message = _handleError(e);
        return handler.reject(
          DioException(
            requestOptions: e.requestOptions,
            error: message,
          ),
        );
      },
    );
  }

  /// 🧾 Logging (dev only)
  Interceptor _loggingInterceptor() {
    return LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) {
        if (AppEnv.config.enableLogs) {
          print("🌐 $obj");
        }
      },
    );
  }

  /// 🧠 Error parser
  String _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout";
      case DioExceptionType.receiveTimeout:
        return "Server took too long";
      case DioExceptionType.badResponse:
        return "Server error: ${e.response?.statusCode}";
      case DioExceptionType.cancel:
        return "Request cancelled";
      default:
        return "Unexpected error occurred";
    }
  }

  /// 🔁 Retry condition
  bool _shouldRetry(DioException e) {
    return e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout;
  }

  /// 🔑 Mock token getter (replace with secure storage)
  Future<String?> _getToken() async {
    return null; // TODO: integrate secure storage
  }

  /// ================= API METHODS =================

  Future<Response> get(String path,
      {Map<String, dynamic>? query}) async {
    return await dio.get(path, queryParameters: query);
  }

  Future<Response> post(String path,
      {dynamic data}) async {
    return await dio.post(path, data: data);
  }

  Future<Response> put(String path,
      {dynamic data}) async {
    return await dio.put(path, data: data);
  }

  Future<Response> delete(String path) async {
    return await dio.delete(path);
  }
}