import 'package:dio/dio.dart';
import 'package:gop_mobile_ui/core/dio_manager.dart';
import 'package:gop_mobile_ui/src/data/model/auth_model.dart';
import 'package:gop_mobile_ui/src/data/model/otp_verify_model.dart';
import 'package:gop_mobile_ui/src/data/model/signin_model.dart';
import 'package:gop_mobile_ui/src/data/model/signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{
  final DioManager dioManager;
  final SharedPreferences sf;
  AuthService({required this.dioManager, required this.sf});

  Future<AuthModel> signin(String email, String password) async {
    try {
      final response = await dioManager.dio.post(
        '/auth/signin', 
        data: SigninModel(
          email: email, 
          password: password
        ).toJson()
      );
      if (response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        throw Exception('Failed to sign in');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      } else {
        throw Exception(e.message);
      }
    }
  }

  Future<String> signup(String email, String password, String fullName) async {
    try {
      final response = await dioManager.dio.post(
        '/auth/signup', 
        data: SignupModel(
          email: email, 
          password: password,
          fullName: fullName
        ).toJson()
      );
      if (response.statusCode == 201) {
        return response.data['message'];
      } else {
        throw Exception('Failed to sign up');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      } else {
        throw Exception(e.message);
      }
    }
  }

  Future<String> verifyOTP(String email, String otp) async {
    try {
      final response = await dioManager.dio.post(
        '/auth/verify/otp',
        data: OTPVerifyModel(
          email: email,
          otp: otp
        ).toJson()
      );
      if (response.statusCode == 200) {
        return response.data['message'];
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      } else {
        throw Exception(e.message);
      }
    }
  }

  Future<AuthModel> refreshToken() async {
    try {
      final response = await dioManager.dio.post(
        '/auth/refresh',
      );
      if (response.statusCode == 200) {
        return response.data['message'];
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      } else {
        throw Exception(e.message);
      }
    }
  }

  Future<void> saveAccessToken(String token) async {
    await sf.setString('accessToken', token);
  }

  Future<String?> getAccessToken() async {
    return sf.getString('accessToken');
  }

  Future<void> saveRefreshToken(String token) async {
    await sf.setString('refreshToken', token);
  }

  Future<String?> getRefreshToken() async {
    return sf.getString('refreshToken');
  }

  Future<void> deleteToken() async {
    await sf.remove('accessToken');
    await sf.remove('refreshToken');
  }

}