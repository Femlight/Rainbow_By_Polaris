class ValidateAccountOtpDto {
  String customerId;
  String otp;
  String accountNumber;

  ValidateAccountOtpDto({
    required this.customerId,
    required this.otp,
    required this.accountNumber,
  });

  factory ValidateAccountOtpDto.fromJson(Map<String, dynamic> json) =>
      ValidateAccountOtpDto(
        customerId: json["customerId"],
        otp: json["otp"],
        accountNumber: json["accountNumber"],
      );

  Map<String, dynamic> toJson() => {
        "customerId": customerId,
        "otp": otp,
        "accountNumber": accountNumber,
      };
}
