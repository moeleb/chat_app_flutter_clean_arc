import 'dart:async';

import 'package:chatapp/features/auth/domain/usecase/login_use_case.dart';
import 'package:chatapp/features/auth/domain/usecase/register_use_case.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;
  final _storage = const FlutterSecureStorage();

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
  }) : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
  }

  FutureOr<void> _onRegister(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final user = await registerUseCase.call(
          event.username, event.email, event.password);
      emit(AuthSuccess(message: "Registration Successful"));
    } catch (e) {
      emit(AuthFailure(error: "Registration Failed"));
    }
  }

  FutureOr<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final user = await loginUseCase.call(event.email, event.password);
      _storage.write(key: "token", value: user.token);
      print("token is ${user.token}");
      emit(AuthSuccess(message: "Login Successful"));
    } catch (e) {
      emit(AuthFailure(error: "Login Failed"));
    }
  }
}
