import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exception_mapper.dart';

/// 🔥 Generic safe API wrapper
class BaseDataSource {
  Future<T> safeCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ExceptionMapper.map(e);
    }
  }

  /// 🎯 Dio error → clean app error
  Exception _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Exception("Connection timeout");

      case DioExceptionType.sendTimeout:
        return Exception("Request timeout");

      case DioExceptionType.receiveTimeout:
        return Exception("Server timeout");

      case DioExceptionType.badResponse:
        return Exception(
          "Server error: ${e.response?.statusCode}",
        );

      case DioExceptionType.cancel:
        return Exception("Request cancelled");

      case DioExceptionType.connectionError:
        return Exception("No internet connection");

      default:
        return Exception("Something went wrong");
    }
  }
}