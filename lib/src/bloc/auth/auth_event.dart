part of 'auth_bloc.dart';

class AuthEvent {}

class AuthStarted extends AuthEvent {}

class AuthSigninStarted extends AuthEvent {
  AuthSigninStarted({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class AuthSigninPrefilled extends AuthEvent {
  AuthSigninPrefilled({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class AuthSignupStarted extends AuthEvent {
  AuthSignupStarted({
    required this.email,
    required this.password,
    required this.fullName,
  });

  final String email;
  final String password;
  final String fullName;
}

class AuthVerifyOTPStarted extends AuthEvent {
  AuthVerifyOTPStarted({
    required this.email,
    required this.otp,
  });

  final String email;
  final String otp;
}


class AuthAuthenticateStarted extends AuthEvent {}

class AuthLogoutStarted extends AuthEvent {}
