import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gop_driver/core/app_color.dart';
import 'package:gop_driver/core/result_type.dart';
import 'package:gop_driver/core/validate_operations.dart';
import 'package:gop_driver/src/data/repository/auth_repository.dart';
import "dart:developer" as developer;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthStarted>(_onStarted);
    on<AuthSigninStarted>(_onSigninStarted);
    on<AuthSignupStarted>(_onSignupStarted);
    on<AuthVerifyOTPStarted>(_onVerifyOTPStarted);
    on<AuthLogout>(_onLogout);
    on<ShowSnackBar>(
        (event, emit) => _showSnackBar(event.context, event.message));

    authRepository.authStream.listen((event) {
      if (event is Failure) {
        add(AuthLogout());
      }
    });
  }

  final AuthRepository authRepository;

  void _showSnackBar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
          backgroundColor: AppColor.redColor,
        ),
      );

  FutureOr<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepository.refresh();
    return (switch (result) {
      Success() => emit(Authenticated()),
      Failure() => emit(AuthAuthenticateFailure(result.message)),
    });
  }

  FutureOr<void> _onSigninStarted(
      AuthSigninStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    if (!ValidateOperations.emailValidation(event.email)) {
      return emit(AuthAuthenticateFailure('Invalid Email Address'));
    } else if (!ValidateOperations.passwordValidation(event.password)) {
      return emit(
          AuthAuthenticateFailure('Password must be at least 6 characters'));
    }
    final result = await authRepository.signin(event.email, event.password);
    return (switch (result) {
      Success() => emit(Authenticated()),
      Failure() => {
          if (result.message == 'need_verify')
            {emit(AuthAuthenticateFailure('Please verify your email'))}
          else
            {emit(AuthAuthenticateFailure(result.message))}
        }
    });
  }

  FutureOr<void> _onSignupStarted(
      AuthSignupStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepository.signup(
        event.email, event.password, event.fullName);
    return (switch (result) {
      Success() => emit(AuthSignupSuccess()),
      Failure() => emit(AuthSignupFailure(result.message)),
    });
  }

  FutureOr<void> _onVerifyOTPStarted(
      AuthVerifyOTPStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepository.verifyOTP(event.email, event.otp);
    return (switch (result) {
      Success() => emit(AuthVerifyOTPSuccess()),
      Failure() => emit(AuthVerifyOTPFailure(result.message)),
    });
  }

  FutureOr<void> _onLogout(AuthLogout event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepository.logout();
    return (switch (result) {
      Success() => emit(Unauthenticated()),
      Failure() => emit(Unauthenticated()),
    });
  }
}
