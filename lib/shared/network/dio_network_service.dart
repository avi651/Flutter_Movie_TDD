import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/app/app_globals.dart';
import 'package:movie_app/core/app_env.dart';
import 'package:movie_app/models/response/response.dart' as response;
import 'package:movie_app/shared/network/end_points.dart';
import 'package:movie_app/shared/network/mixin/network_handler_mixin.dart';
import 'package:movie_app/shared/network/network_service.dart';
import 'package:movie_app/shared/util/app_exceptions.dart';


class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  late Dio dio;

  DioNetworkService() {
    dio = Dio();
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20));

  @override
  String get baseUrl => AppEnv.baseUrl;

  @override
  String get apiKey => AppEnv.apiKey;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeaders(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = headers;
    }
    return header;
  }



@override
Future<Either<AppException, response.Response>> get(
  String endPoint, {
  Map<String, dynamic>? queryParams,
}) async {
  final params = {
    ...?queryParams,
    Params.apiKey: apiKey,
  };

  return await handleException(
    () => dio.get(
      endPoint,
      queryParameters: params,
    ),
    endPoint: endPoint,
  );
}

  @override
  Future<Either<AppException, response.Response>> post(String endPoint,
      {Map<String, dynamic>? data}) {
    // queryParams[Params.apiKey] = apiKey;
    final res = handleException(
        () => dio.post(
              endPoint,
              data: data,
            ),
        endPoint: endPoint);
    return res;
  }
}
