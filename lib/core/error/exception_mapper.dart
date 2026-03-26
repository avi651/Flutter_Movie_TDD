import 'package:dio/dio.dart';
import 'failure.dart';

class ExceptionMapper {
  ExceptionMapper._();

  static Failure map(dynamic error) {
    if (error is DioException) {
      return _mapDioError(error);
    }

    if (error is Exception) {
      return Failure(error.toString());
    }

    return Failure("Unexpected error occurred");
  }

  /// 🔥 Dio → Failure
  static Failure _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Failure("Connection timeout");

      case DioExceptionType.sendTimeout:
        return Failure("Request timeout");

      case DioExceptionType.receiveTimeout:
        return Failure("Server timeout");

      case DioExceptionType.badResponse:
        return _handleResponseError(e);

      case DioExceptionType.cancel:
        return Failure("Request cancelled");

      case DioExceptionType.connectionError:
        return Failure("No internet connection");

      default:
        return Failure("Something went wrong");
    }
  }

  /// 🎯 Server error parsing
  static Failure _handleResponseError(DioException e) {
    final statusCode = e.response?.statusCode;

    switch (statusCode) {
      case 400:
        return Failure("Bad request", code: 400);

      case 401:
        return Failure("Unauthorized", code: 401);

      case 403:
        return Failure("Forbidden", code: 403);

      case 404:
        return Failure("Not found", code: 404);

      case 500:
        return Failure("Server error", code: 500);

      default:
        return Failure(
          "Error: $statusCode",
          code: statusCode,
        );
    }
  }
}