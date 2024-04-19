part of 'auth_bloc.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Unauthenticated extends AuthState {
  Unauthenticated([this.message]);
  final String? message;
}

class Authenticated extends AuthState {}

class AuthAuthenticateFailure extends AuthState {
  AuthAuthenticateFailure(this.message);

  final String message;
}

class AuthAuthenticateSuccess extends AuthState {
  AuthAuthenticateSuccess(this.token);

  final String token;
}

class AuthAuthenticateNeedVerify extends AuthState {}

//* signup states
class AuthSignupSuccess extends AuthState {}

class AuthSignupFailure extends AuthState {
  AuthSignupFailure(this.message);

  final String message;
}

//* verify otp states
class AuthVerifyOTPFailure extends AuthState {
  final String message;

  AuthVerifyOTPFailure(this.message);
}

class AuthVerifyOTPSuccess extends AuthState {}
