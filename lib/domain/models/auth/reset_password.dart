import 'package:formz/formz.dart';

enum ResetPasswordValidationError { invalid, empty }

class ResetPassword extends FormzInput<String, ResetPasswordValidationError> {
  ResetPassword.pure() : super.pure('');
  ResetPassword.dirty([String value = '']) : super.dirty(value);

  static final _resetPasswordRegExp = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');

  late final validationResultCache =
      _resetPasswordRegExp.hasMatch(value) && value.length > 5
          ? null
          : ResetPasswordValidationError.invalid;

  @override
  ResetPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return ResetPasswordValidationError.empty;
    }
    return validationResultCache;
  }
}

extension Explanation on ResetPasswordValidationError {
  String? get name {
    switch (this) {
      case ResetPasswordValidationError.invalid:
        return 'Invalid condition';
      default:
        return null;
    }
  }
}
