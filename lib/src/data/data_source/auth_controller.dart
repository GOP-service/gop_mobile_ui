import 'package:dio/dio.dart';
import 'package:gop_passenger/core/dio_manager.dart';
import 'package:gop_passenger/core/result_type.dart';
import 'package:gop_passenger/src/data/model/otp_verify_model.dart';
import 'package:gop_passenger/src/data/model/signin_model.dart';
import 'package:gop_passenger/src/data/model/signup_model.dart';

class AuthController {
  final DioManager dioManager;

  AuthController({required this.dioManager});

  Future<Response> signin(String email, String password) async {
    return await dioManager.dio.post('/auth/signin',
        data: SigninModel(email: email, password: password).toJson());
  }

  Future<Response> signup(
      String email, String password, String fullName) async {
    return await dioManager.dio.post('/auth/signup',
        data: SignupModel(
          email: email,
          password: password,
          fullName: fullName,
        ).toJson());
  }

  Future<Response> verifyOTP(String email, String otp) async {
    return await dioManager.dio.post('/auth/verify-otp',
        data: OTPVerifyModel(email: email, otp: otp).toJson());
  }
}
