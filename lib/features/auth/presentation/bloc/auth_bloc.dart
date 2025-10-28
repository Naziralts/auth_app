import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    await Future.delayed(const Duration(seconds: 2)); // эмуляция запроса

    if (event.email == 'test@test.com' && event.password == 'qwerty123') {
      emit(state.copyWith(
        status: AuthStatus.success,
        email: event.email,
      ));
    } else {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: 'Неверный логин или пароль',
      ));
    }
  }

  void _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) {
    emit(const AuthState(status: AuthStatus.initial));
  }
}
