import 'dart:developer';

import 'package:gop_mobile_ui/core/result_type.dart';
import 'package:gop_mobile_ui/src/data/model/auth_model.dart';
import 'package:gop_mobile_ui/src/data/service/auth_service.dart';

class AuthRepository {
  final AuthService authService;
  AuthRepository({required this.authService});

  Future<Result<void>> signin(String email, String password) async {
    try {
      final token = await authService.signin(email, password);
      await authService.saveAccessToken(token.accessToken);
      await authService.saveRefreshToken(token.refreshToken);
    } catch (e) {
      log(e.toString());
      return Failure(e.toString());
    }
    return Success(null);
  }

  Future<Result<void>> signup(String email, String password, String fullName) async {
    try {
      await authService.signup(email, password, fullName);

    } catch (e) {
      log(e.toString());
      return Failure(e.toString());
    }
    return Success(null);
  }

  Future<Result<void>> verifyOTP(String email, String otp) async {
    try {
      await authService.verifyOTP(email, otp);
    } catch (e) {
      log(e.toString());
      return Failure(e.toString());
    }
    return Success(null);
  }

  Future<Result<void>> logout() async {
    try {
      await authService.deleteToken();
    } catch (e) {
      log(e.toString());
      return Failure(e.toString());
    }
    return Success(null);
  }

  Future<Result<void>> getToken() async {
    try {
      final token = await authService.getRefreshToken();
      return Success(token);
    } catch (e) {
      log(e.toString());
      return Failure(e.toString());
    }
  }
}