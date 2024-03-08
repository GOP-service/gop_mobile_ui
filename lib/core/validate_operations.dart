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

  static emailValidation(dynamic email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (email == null || email.isEmpty || !emailValid) {
      return 'Invalid email address';
    }
    return null;
  }

  static passwordValidation(dynamic password) {
    if (password == null || password.isEmpty || password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static otpValidation(dynamic otp) {
    if (otp == null || otp.isEmpty || otp.length != 6) {
      return 'Invalid OTP';
    }
    return null;
  }
}
