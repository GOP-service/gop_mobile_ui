import 'package:flutter/foundation.dart' show immutable;


@immutable
class ValidateOperations {
  const ValidateOperations._();

  static requiredValidation(
    dynamic value,
  ) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static bool emailValidation(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (email.isEmpty || !emailValid) {
      return false;
    }
    return true;
  }

  static bool passwordValidation(String password) {
    if (password.isEmpty || password.length < 6) {
      return false;
    }
    return true;
  }

  static bool otpValidation(String otp) {
    if (otp.isEmpty || otp.length != 6) {
      return false;
    }
    return true;
  }
}
