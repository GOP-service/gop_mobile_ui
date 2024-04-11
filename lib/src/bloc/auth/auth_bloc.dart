import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gop_passenger/core/result_type.dart';
import 'package:gop_passenger/core/validate_operations.dart';
import 'package:gop_passenger/src/data/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthStarted>(_onStarted);
    on<AuthSigninStarted>(_onSigninStarted);
    on<AuthSignupStarted>(_onSignupStarted);
    on<AuthVerifyOTPStarted>(_onVerifyOTPStarted);
  }

  final AuthRepository authRepository;

  void _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    //emit(AuthLoading());
    // final result = await authRepository.refresh();
    // return (switch (result) {
    //   Success() => emit(AuthAuthenticateSuccess()),
    //   Failure() => emit(AuthAuthenticateFailure(result.message)),
    // });
  }

  void _onSigninStarted(
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
      Success() => emit(AuthAuthenticateSuccess()),
      Failure() => {
          if (result.message == 'need_verify')
            {emit(AuthAuthenticateNeedVerify())}
          else
            {emit(AuthAuthenticateFailure(result.message))}
        }
    });
  }

  void _onSignupStarted(
      AuthSignupStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepository.signup(
        event.email, event.password, event.fullName);
    return (switch (result) {
      Success() => emit(AuthSignupSuccess()),
      Failure() => emit(AuthSignupFailure(result.message)),
    });
  }

  void _onVerifyOTPStarted(
      AuthVerifyOTPStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepository.verifyOTP(event.email, event.otp);
    return (switch (result) {
      Success() => emit(AuthVerifyOTPSuccess()),
      Failure() => emit(AuthVerifyOTPFailure(result.message)),
    });
  }
}
