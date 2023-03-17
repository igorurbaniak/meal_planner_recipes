import 'package:formz/formz.dart';

enum NameError { invalid, empty }

class Name extends FormzInput<String, NameError> {
  Name.pure([String value = '']) : super.pure(value);
  Name.dirty([String value = '']) : super.pure(value);

  static final RegExp _nameRegExp = RegExp(
    r'^(?=.*[a-z])[A-Za-z ]{2,}$',
  );

  late final validationResultCache =
      _nameRegExp.hasMatch(value) && value.length > 5
          ? null
          : NameError.invalid;

  @override
  NameError? validator(String value) {
    if (value.isEmpty == true || value == '') {
      return null;
      // return NameError.empty;
    }
    return validationResultCache;
  }
}

extension Explanation on NameError {
  String? get name {
    switch (this) {
      case NameError.invalid:
        return 'This is not a valid name';
      default:
        return null;
    }
  }
}
