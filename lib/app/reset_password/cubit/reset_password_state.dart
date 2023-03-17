part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  ResetPasswordState({
    Email? email,
    Password? password,
    ResetPassword? resetPassword,
    Name? name,
    this.status = FormzSubmissionStatus.initial,
    this.exceptionError = '',
  })  : email = email ?? Email.pure(),
        password = password ?? Password.pure(),
        resetPassword = resetPassword ?? ResetPassword.pure(),
        name = name ?? Name.pure();

  final Email email;
  final Password password;
  final ResetPassword resetPassword;
  final Name name;
  final FormzSubmissionStatus status;
  final String exceptionError;

  @override
  List<Object?> get props =>
      [email, password, resetPassword, name, status, exceptionError];

  ResetPasswordState copyWith({
    Email? email,
    Password? password,
    ResetPassword? resetPassword,
    Name? name,
    FormzSubmissionStatus? status,
    String? exceptionError,
  }) {
    return ResetPasswordState(
      email: email ?? this.email,
      password: password ?? this.password,
      resetPassword: resetPassword ?? this.resetPassword,
      name: name ?? this.name,
      status: status ?? this.status,
      exceptionError: exceptionError ?? this.exceptionError,
    );
  }
}
