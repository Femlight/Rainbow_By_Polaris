class ResendOtpDto {
  String userName;
  String userId;
  String verificationType;

  ResendOtpDto({
    required this.userName,
    required this.userId,
    required this.verificationType,
  });

  factory ResendOtpDto.fromJson(Map<String, dynamic> json) => ResendOtpDto(
        userName: json["userName"],
        userId: json["userId"],
        verificationType: json["verificationType"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "userId": userId,
        "verificationType": verificationType,
      };
}
