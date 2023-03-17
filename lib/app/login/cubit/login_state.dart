part of 'login_cubit.dart';

class LoginState extends Equatable {
  LoginState({
    Email? email,
    Password? password,
    this.status = FormzSubmissionStatus.initial,
    this.exceptionError = '',
  }) : email = email ?? Email.pure(), password = password ?? Password.pure();

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final String exceptionError;

  @override
  List<Object?> get props => [email, password, status, exceptionError];

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    String? exceptionError,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      exceptionError: exceptionError ?? this.exceptionError,
    );
  }
}
