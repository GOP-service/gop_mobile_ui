part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthSigninInitial extends AuthState {
  AuthSigninInitial({required this.email, required this.password});

  final String email;
  final String password;
}

class AuthSigninInProgress extends AuthState {}

class AuthSigninSuccess extends AuthState {}

class AuthSigninFailure extends AuthState {
  AuthSigninFailure(this.message);

  final String message;
}


class AuthSignupInProgress extends AuthState {}

class AuthSignupSuccess extends AuthState {}

class AuthSignupFailure extends AuthState {
  AuthSignupFailure(this.message);

  final String message;
}

class AuthAuthenticateSuccess extends AuthState {
  AuthAuthenticateSuccess(this.token);

  final String token;
}

class AuthAuthenticateUnauthenticated extends AuthState {}

class AuthAuthenticateFailure extends AuthState {
  AuthAuthenticateFailure(this.message);

  final String message;
}

class AuthLogoutSuccess extends AuthState {}

class AuthLogoutFailure extends AuthState {
  AuthLogoutFailure(this.message);

  final String message;
}
