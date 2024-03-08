class SignupModel {
  String? email;
  String? password;
  String? fullName;

  SignupModel({
    this.email,
    this.password,
    this.fullName,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'full_name': fullName,
    };
  }
}
