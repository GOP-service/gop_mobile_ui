import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gop_mobile_ui/src/data/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthStarted>(_onStarted);
    // on<AuthSigninStarted>(_onSigninStarted);
    // on<AuthSigninPrefilled>(_onSigninPrefilled);
    // on<AuthSignupStarted>(_onSignupStarted);
    // on<AuthVerifyOTPStarted>(_onVerifyOTPStarted);
    // on<AuthAuthenticateStarted>(_onAuthenticateStarted);
    // on<AuthLogoutStarted>(_onLogoutStarted);
  }

  final AuthRepository authRepository;

  void _onStarted(AuthStarted event, Emitter<AuthState> emit) {
    final token = authRepository.getToken();
  }

  // void _onSigninStarted(AuthSigninStarted event, Emitter<AuthState> emit) async {
  //   emit(AuthSigninInProgress());
  //   final result = await authRepository.signin(event.email, event.password);
  //   result.when(
  //     success: (_) => emit(AuthSigninSuccess()),
  //     failure: (message) => emit(AuthSigninFailure(message)),
  //   );
  // }

  // void _onSigninPrefilled(AuthSigninPrefilled event, Emitter<AuthState> emit) {
  //   emit(AuthSigninInitial(email: event.email, password: event.password));
  // }

  // void _onSignupStarted(AuthSignupStarted event, Emitter<AuthState> emit) async {
  //   emit(AuthSignupInProgress());
  //   final result = await authRepository.signup(event.email, event.password, event.fullName);
  //   result.when(
  //     success: (_) => emit(AuthSignupSuccess()),
  //     failure: (message) => emit(AuthSignupFailure(message)),
  //   );
  // }

  // void _onVerifyOTPStarted(AuthVerifyOTPStarted event, Emitter<AuthState> emit) async {
  //   emit(AuthSigninInProgress());
  //   final result = await authRepository.verifyOTP(event.email, event.otp);
  //   result.when(
  //     success: (_) => emit(AuthSigninSuccess()),
  //     failure: (message) => emit(AuthSigninFailure(message)),
  //   );
  // }

  // void _onAuthenticateStarted(AuthAuthenticateStarted event, Emitter<AuthState> emit) async {
  //   final result = await authRepository.getToken();
  //   result.when(
  //     success: (token) => emit(AuthAuthenticateSuccess(token)),
  //     failure: (message) => emit(AuthAuthenticateFailure(message)),
  //   );
  // }

  // void _onLogoutStarted(AuthLogoutStarted event, Emitter<AuthState> emit) async {
  //   final result = await authRepository.logout();
  //   result.when(
  //     success: (_) => emit(AuthLogoutSuccess()),
  //     failure: (message) => emit(AuthLogoutFailure(message)),
  //   );
  // }
}
