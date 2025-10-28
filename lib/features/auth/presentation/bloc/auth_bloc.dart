import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    await Future.delayed(const Duration(seconds: 1));

    if (event.email == 'test@test.com' && event.password == 'qwerty123') {
      emit(state.copyWith(status: AuthStatus.success));
    } else {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: 'Неверный логин или пароль',
      ));
    }
  }
}
