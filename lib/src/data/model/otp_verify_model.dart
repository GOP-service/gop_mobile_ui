class OTPVerifyModel {
  String? email;
  String? otp;

  OTPVerifyModel({this.email, this.otp});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
    };
  }
}
