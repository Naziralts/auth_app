import 'package:equatable/equatable.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? errorMessage;
  final String? email;

  const AuthState({
    this.status = AuthStatus.initial,
    this.errorMessage,
    this.email,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? errorMessage,
    String? email,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, email];
}
