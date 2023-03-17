part of 'auth_cubit.dart';

@immutable
class AuthState {
  final User? user;
  final bool isLoading;
  final String errorMessage;
  final Status status;

  const AuthState({
    this.status = Status.initial,
    required this.user,
    required this.isLoading,
    required this.errorMessage,
  });
}
