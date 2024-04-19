part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthStarted extends AuthEvent {}

class AuthSigninStarted extends AuthEvent {
  AuthSigninStarted({
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

class AuthLogout extends AuthEvent {
  AuthLogout({
    this.message,
  });

  final String? message;
}

class ShowSnackBar extends AuthEvent {
  ShowSnackBar({
    required this.context,
    required this.message,
  });

  final BuildContext context;
  final String message;
}
