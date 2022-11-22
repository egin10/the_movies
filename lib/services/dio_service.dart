import 'package:dio/dio.dart';

import 'api_interceptor.dart';

class DioService {
  static Dio initInstance() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/',
        connectTimeout: 60 * 1000, // 60 seconds
      ),
    );

    dio.interceptors.add(ApiInterceptor());

    return dio;
  }
}
