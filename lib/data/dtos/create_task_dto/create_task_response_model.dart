class CreateTaskResponseModelDto {
  final bool? isSuccess;
  final String? error;
  final String? message;
  final dynamic responseCode;

  CreateTaskResponseModelDto({
    this.isSuccess,
    this.error,
    this.message,
    this.responseCode,
  });

  factory CreateTaskResponseModelDto.fromJson(Map<String, dynamic> json) =>
      CreateTaskResponseModelDto(
        isSuccess: json["isSuccess"],
        error: json["error"],
        message: json["message"],
        responseCode: json["responseCode"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "error": error,
        "message": message,
        "responseCode": responseCode,
      };
}
