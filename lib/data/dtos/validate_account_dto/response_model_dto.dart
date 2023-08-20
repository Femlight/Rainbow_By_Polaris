class ValidateAccountResponseDto {
  final dynamic value;
  final bool isSuccess;
  final String error;
  final dynamic message;
  final String responseCode;

  ValidateAccountResponseDto({
    required this.value,
    required this.isSuccess,
    required this.error,
    required this.message,
    required this.responseCode,
  });

  factory ValidateAccountResponseDto.fromJson(Map<String, dynamic> json) =>
      ValidateAccountResponseDto(
        value: json["value"],
        isSuccess: json["isSuccess"],
        error: json["error"],
        message: json["message"],
        responseCode: json["responseCode"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "isSuccess": isSuccess,
        "error": error,
        "message": message,
        "responseCode": responseCode,
      };
}
