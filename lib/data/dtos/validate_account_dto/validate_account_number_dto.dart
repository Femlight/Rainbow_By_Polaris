// Dart imports:
import 'dart:convert';

class ValidateAccountNumberDto {
  String? customertypeid;
  String accoutNumber;

  ValidateAccountNumberDto({
    this.customertypeid,
    required this.accoutNumber,
  });

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['customertypeid'] = customertypeid;
    data['accoutNumber'] = accoutNumber;

    return json.encode(data);
  }

  //delete later
  Map<String, dynamic> tJson() => {
    'customertypeid': customertypeid,
    'accoutNumber': accoutNumber
  };
}
