// To parse this JSON data, do
//
//     final validateAccountNumberResDto = validateAccountNumberResDtoFromJson(jsonString);

import 'dart:convert';

ValidateAccountNumberResDto validateAccountNumberResDtoFromJson(String str) => ValidateAccountNumberResDto.fromJson(json.decode(str));

String validateAccountNumberResDtoToJson(ValidateAccountNumberResDto data) => json.encode(data.toJson());

class ValidateAccountNumberResDto {
  final String? value;
  final bool? isSuccess;
  final String? error;
  final dynamic message;
  final dynamic responseCode;

  ValidateAccountNumberResDto({
    this.value,
    this.isSuccess,
    this.error,
    this.message,
    this.responseCode,
  });

  factory ValidateAccountNumberResDto.fromJson(Map<String, dynamic> json) => ValidateAccountNumberResDto(
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
