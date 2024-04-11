import 'dart:developer';

import 'package:gop_passenger/core/result_type.dart';
import 'package:gop_passenger/src/data/model/customer_model.dart';
import 'package:gop_passenger/src/data/service/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<Result<void>> logout() async {
    try {
      authService.logout();
      await authService.deleteToken();
    } catch (e) {
      return Failure(e.toString());
    }
    return Success(null);
  }

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

  Future<Result<void>> signup(
      String email, String password, String fullName) async {
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

  Future<Result<void>> refresh() async {
    try {
      authService.refreshToken();
      return Success(null);
    } catch (e) {
      log(e.toString());
      return Failure(e.toString());
    }
  }

  Future<Result<CustomerModel>> getProfile() async {
    try {
      return Success(await authService.getProfile());
    } catch (e) {
      log(e.toString());
      return Failure(e.toString());
    }
  }
}
