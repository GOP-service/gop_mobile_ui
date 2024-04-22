import 'dart:async';
import 'package:gop_passenger/core/dio_manager.dart';
import 'package:gop_passenger/core/result_type.dart';
import 'package:gop_passenger/src/data/model/auth_model.dart';
import 'package:gop_passenger/src/data/data_source/auth_controller.dart';
import 'package:gop_passenger/src/data/data_source/local_data_source.dart';
import 'package:gop_passenger/src/data/model/customer_model.dart';
import "dart:developer" as developer;

class AuthRepository {
  late final DioManager _dioManager;

  final StreamController<Failure> _authStreamController =
      StreamController<Failure>();

  Stream get authStream => _authStreamController.stream;

  AuthRepository() {
    _dioManager = DioManager(authSink: _authStreamController.sink);
  }

  late final AuthController authController =
      AuthController(dioManager: _dioManager);

  DioManager get dio => _dioManager;

  void dispose() {
    _authStreamController.close();
  }

  Future<Result> refresh() async {
    try {
      return await _dioManager.refreshToken();
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Result> signin(String email, String password) async {
    try {
      final response = await authController.signin(email, password);
      final token = AuthModel.fromJson(response.data);
      await LocalDataSource().saveToken(token.accessToken, token.refreshToken);
      return Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Result> signup(String email, String password, String fullName) async {
    try {
      await authController.signup(email, password, fullName);
    } catch (e) {
      return Failure(e.toString());
    }
    return Success(null);
  }

  Future<Result> verifyOTP(String email, String otp) async {
    try {
      await authController.verifyOTP(email, otp);
    } catch (e) {
      return Failure(e.toString());
    }
    return Success(null);
  }

  Future<Result> logout() async {
    try {
      await LocalDataSource().deleteToken();
    } catch (e) {
      return Failure(e.toString());
    }
    return Success(null);
  }
}
