part of 'auth_bloc.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignupSuccess extends AuthState {}

class AuthSignupFailure extends AuthState {
  AuthSignupFailure(this.message);

  final String message;
}

class AuthAuthenticateSuccess extends AuthState {}

class AuthAuthenticateNeedVerify extends AuthState {}

class AuthAuthenticateFailure extends AuthState {
  AuthAuthenticateFailure(this.message);

  final String message;
}

class AuthVerifyOTPSuccess extends AuthState {}

class AuthVerifyOTPFailure extends AuthState {
  AuthVerifyOTPFailure(this.message);

  final String message;
}
