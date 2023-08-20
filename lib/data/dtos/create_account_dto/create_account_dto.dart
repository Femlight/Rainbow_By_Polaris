class CreateAccountDto {
    String customerId;
    String username;
    String password;
    String referralCode;

    CreateAccountDto({
        required this.customerId,
        required this.username,
        required this.password,
        required this.referralCode,
    });

    factory CreateAccountDto.fromJson(Map<String, dynamic> json) => CreateAccountDto(
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