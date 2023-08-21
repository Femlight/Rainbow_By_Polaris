// Dart imports:
import 'dart:convert';

class ValidateAccountNumberDto {
  final String? customertypeid;
  final String? accoutNumber;

  ValidateAccountNumberDto({
    this.customertypeid,
    this.accoutNumber,
  });

  factory ValidateAccountNumberDto.fromJson(Map<String, dynamic> json) =>
      ValidateAccountNumberDto(
        customertypeid: json["customertypeid"],
        accoutNumber: json["accoutNumber"],
      );

  Map<String, dynamic> toJson() => {
        "customertypeid": customertypeid,
        "accoutNumber": accoutNumber,
      };
}
