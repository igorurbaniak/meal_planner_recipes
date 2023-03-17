import 'package:formz/formz.dart';

enum PasswordValidationError { invalid, empty }

class Password extends FormzInput<String, PasswordValidationError> {
  Password.pure() : super.pure('');
  Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');

  late final validationResultCache =
      _passwordRegExp.hasMatch(value) && value.length > 5
          ? null
          : PasswordValidationError.invalid;

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return null;
      // return PasswordValidationError.empty;
    }
    return validationResultCache;
  }
}

extension Explanation on PasswordValidationError {
  String? get name {
    switch (this) {
      case PasswordValidationError.invalid:
        return "     Invalid condition";
      default:
        return null;
    }
  }
}
