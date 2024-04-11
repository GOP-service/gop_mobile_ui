import 'package:dio/dio.dart';

class DioManager {
  late final Dio _dio;

  final String _baseUrl =
      'https://api-gateway.purplesand-fad3fa4f.southeastasia.azurecontainerapps.io';

  DioManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
      ),
    );
  }

  Dio get dio => _dio;

  void clearToken() {
    _dio.interceptors.clear();
  }

  void setToken(String token) {
    _dio.interceptors.clear();

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          // Do something with response data
          return handler.next(response); // continue
        },
        onError: (e, handler) {
          // Do something with response error
          return handler.next(e); //continue
        },
      ),
    );
  }
}
