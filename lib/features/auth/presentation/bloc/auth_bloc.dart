import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../data/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(const AuthState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final success = await repository.login(event.email, event.password);

    if (success) {
      emit(state.copyWith(status: AuthStatus.success));
    } else {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: 'Неверный логин или пароль',
      ));
    }
  }
}
