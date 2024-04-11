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
    return CustomerModel(
        accountId: json['accountId'],
        fullName: json['fullName'],
        email: json['email'],
        phone: json['phone'],
        address: json['profile.address'],
        gender: json['profile.gender'],
        avatar: json['profile.avatar']);
  }

  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'gender': gender,
      'avatar': avatar
    };
  }
}
