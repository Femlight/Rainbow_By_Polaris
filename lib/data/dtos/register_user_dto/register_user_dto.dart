class RegisterUserDto {
  String customerId;
  String username;
  String password;
  String referralCode;

  RegisterUserDto({
    required this.customerId,
    required this.username,
    required this.password,
    required this.referralCode,
  });

  factory RegisterUserDto.fromJson(Map<String, dynamic> json) =>
      RegisterUserDto(
        customerId: json["customerId"],
        username: json["username"],
        password: json["password"],
        referralCode: json["referralCode"],
      );

  Map<String, dynamic> toJson() => {
        "customerId": customerId,
        "username": username,
        "password": password,
        "referralCode": referralCode,
      };
}
