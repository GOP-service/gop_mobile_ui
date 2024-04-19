class CustomerModel {
  final String accountId;
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final bool gender;
  final String avatar;

  CustomerModel(
      {required this.accountId,
      required this.fullName,
      required this.email,
      required this.phone,
      required this.address,
      required this.gender,
      required this.avatar});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    CustomerprofileModel profile =
        CustomerprofileModel.fromJson(json['profile']);

    return CustomerModel(
        accountId: json['account_id'],
        fullName: json['full_name'],
        email: json['email'],
        phone: json['phone'],
        address: profile.address,
        gender: profile.gender,
        avatar: profile.avatar);
  }
}

class CustomerprofileModel {
  final String address;
  final bool gender;
  final String avatar;

  CustomerprofileModel(
      {required this.address, required this.gender, required this.avatar});

  factory CustomerprofileModel.fromJson(Map<String, dynamic> json) {
    return CustomerprofileModel(
        address: json['address'],
        gender: json['gender'],
        avatar: json['avatar']);
  }
}
