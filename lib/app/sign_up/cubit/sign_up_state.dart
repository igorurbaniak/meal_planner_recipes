part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  SignUpState({
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
  List<Object?> get props => [email, password, resetPassword, name, status, exceptionError];

  SignUpState copyWith({
    Email? email,
    Password? password,
    ResetPassword? resetPassword,
    Name? name,
    FormzSubmissionStatus? status,
    String? exceptionError,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      resetPassword: resetPassword ?? this.resetPassword,
      name: name ?? this.name,
      status: status ?? this.status,
      exceptionError: exceptionError ?? this.exceptionError,
    );
  }
}
