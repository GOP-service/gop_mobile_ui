import 'dart:async';
import "dart:developer" as developer;
import 'package:dio/dio.dart';
import 'package:gop_driver/core/result_type.dart';
import 'package:gop_driver/src/data/data_source/local_data_source.dart';

class DioManager {
  late final Dio _dio;
  StreamSink<Failure> authSink;

  final String _baseUrl =
      'https://api-gateway.purplesand-fad3fa4f.southeastasia.azurecontainerapps.io';

  DioManager({required this.authSink}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
      ),
    );
  }

  Dio get dio => _dio;

  Future<Result> refreshToken() async {
    try {
      final refreshToken = await LocalDataSource().getRefreshToken();

      if (refreshToken == '') {
        return Failure('No refresh token found');
      }

      final response = await _dio.post('/auth/refresh',
          options: Options(headers: {'Authorization': 'Bearer $refreshToken'}));

      if (response.statusCode == 201) {
        final accessToken = response.data['accessToken'];
        final refreshToken = response.data['refreshToken'];
        await LocalDataSource().saveToken(accessToken, refreshToken);
        return Success(null);
      }
      return Failure(response.data['msg']);
    } on DioException catch (e) {
      // developer.log(e.toString());
      // throw Exception(e.toString());
      return Failure(e.response!.data['msg'].toString());
    }
  }

  Future<Result> toggleRequest(
      Future<Response> Function(String token) httpRequest,
      String requestDetails,
      {bool isRefresh = false}) async {
    if (!isRefresh) developer.log("Trying to $requestDetails.");
    String accessToken = await LocalDataSource().getAccessToken();

    if (accessToken == '') {
      developer.log("[Access token] Empty, no account");
      authSink.add(Failure("401"));
      throw Exception("No access token found");
    }

    try {
      final response =
          await httpRequest(accessToken).timeout(const Duration(seconds: 5));

      switch (response.statusCode) {
        case 200:
        case 201:
          return Success(response.data);
        case 401:
          //* Implement your refresh token logic here
          if (!isRefresh) {
            if (await refreshToken() is Success) {
              developer.log("[Access token] Refreshed");
              return await toggleRequest(httpRequest, requestDetails,
                  isRefresh: true);
            }
          }
          developer.log("[Access token & Refresh token] Expired both!");
          authSink.add(Failure("401"));
          throw Exception("Token expired");
        default:
          developer.log(
              "Failed HTTP when compiling $requestDetails. Error HTTP: ${response.statusCode}.");
          developer.log("Response body: ${response.data}");
          throw Exception("Failed HTTP code ${response.statusCode}");
      }
    } on TimeoutException catch (e, s) {
      developer.log("The request for $requestDetails took too long. S: $s");
      return Failure("Request took too long");
    }
  }

  Future<Response> get(String path, String token) async {
    return await _dio.get(path,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
  }

  Future<Response> post(String path, String token, {dynamic data}) async {
    return await _dio.post(path,
        data: data,
        options: Options(headers: {'Authorization ': 'Bearer $token'}));
  }

  Future<Response> patch(String path, String token, {dynamic data}) async {
    return await _dio.patch(path,
        data: data,
        options: Options(headers: {'Authorization ': 'Bearer $token'}));
  }
}
