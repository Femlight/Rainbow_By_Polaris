import 'dart:convert';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:uuid/uuid.dart';
import '../core/constants/colors.dart';

class Util {
  Util._();

  static const standardDateFormat = 'yyyy-MM-dd';
  static const rootDate = 1900;

  static String getUId() {
    return const Uuid().v4();
  }

  static bool isNullOrEmpty(value) {
    return (value == null || value == '');
  }

  static Future<Map<String, String>> getHeaders(
      {bool addAuthHeader = false}) async {
    Map<String, String> headers = {};

    if (addAuthHeader == true) {
      const token = 'xxx'; // await _getIdToken();
      headers['Authorization'] = 'bearer $token';
    }

    // print('Http Headers - $headers');

    return headers;
  }

  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static String getTimeStamp() {
    DateTime epochStart = DateTime(
      1970,
      01,
      01,
      0,
      0,
      0,
      0,
    );
    Duration timeSpan = DateTime.now().difference(epochStart);
    var res = timeSpan.inSeconds;
    var result = BigInt.from(res).toString();
    return result;
  }

  static String getNonce() {
    return Util.getUId();
  }

  static void showMessage(BuildContext context, String message) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  static String? getFileTypeId(String extension) {
    if (extension == '.xlsx') {
      return '1f6868a8-949a-44c8-9836-0ed2736d4b6a';
    } else if (extension == '.pdf') {
      return '4602825e-9f6d-48db-801b-35dd307a3c87';
    } else if (extension == '.jpg') {
      return 'fe159e20-8a1e-41b7-a96a-4b168d29a854';
    } else if (extension == '.docx') {
      return '797174ac-fdf9-44cb-8d55-9027affb4418';
    } else if (extension == '.png') {
      return 'ea9b63ed-f62d-4fbb-9a42-bea9b58ffd49';
    }
    return null;
  }

  // static DocumentType? getDocumentType(String fileTypeId) {
  //   if (fileTypeId == '1f6868a8-949a-44c8-9836-0ed2736d4b6a') {
  //     return DocumentType.xlsx;
  //   } else if (fileTypeId == '4602825e-9f6d-48db-801b-35dd307a3c87') {
  //     return DocumentType.pdf;
  //   } else if (fileTypeId == 'fe159e20-8a1e-41b7-a96a-4b168d29a854') {
  //     return DocumentType.jpg;
  //   } else if (fileTypeId == '797174ac-fdf9-44cb-8d55-9027affb4418') {
  //     return DocumentType.docx;
  //   } else if (fileTypeId == 'ea9b63ed-f62d-4fbb-9a42-bea9b58ffd49') {
  //     return DocumentType.png;
  //   } else if (fileTypeId == 'ea9b63ed-f62d-4fbb-9a42-bea9b58ffd49') {
  //     return DocumentType.mp4;
  //   }

  //   return null;
  // }

  static List<int> handiCapList = List.generate(20, (index) => index);

  static String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return null;
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    } else if (value.length != 11) {
      return 'Mobile number must be 11 digits';
    }
    return null;
  }

  static Future<Either<List<String>, File>> getFileFromBase64(
      String base64Str) async {
    final decodedbytes = base64Decode(base64Str);

    try {
      final dir = (await getApplicationDocumentsDirectory()).path;
      final file = File("$dir/${DateTime.now().millisecondsSinceEpoch}.png");
      file.writeAsBytesSync(decodedbytes);
      return Right(file);
    } on Exception catch (e) {
      return Left([e.toString()]);
    } on Error catch (e) {
      return Left([e.toString()]);
    }
  }

  static String getformattedAmount(double amount) {
    final formatter = NumberFormat.currency(
      symbol: '',
      decimalDigits: 0,
    );
    final formattedAmount = formatter.format(amount);
    return '\u{20A6}$formattedAmount';
  }

  static String nameInitials({
    required String firstName,
    required String lastName,
  }) {
    final firstInitial = firstName[0];
    final secondInitial = lastName[0];
    return '$firstInitial $secondInitial'.toUpperCase();
  }

  // static Gender getGender(String s) {
  //   if (s.toLowerCase() == 'male') {
  //     return Gender.male;
  //   } else {
  //     return Gender.female;
  //   }
  // }

  static bool itemExist<T>({required List<T> iterable, required T item}) {
    final items = iterable.where((element) => element == item).toList();

    if (items.isEmpty) {
      return false;
    }

    return true;
  }
}

class Messenger {
  Messenger._();

  static final Color _black = Colors.black.withOpacity(.8);

  static void success(BuildContext context, String message, {int delay = 03}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
          duration: Duration(seconds: delay),
          backgroundColor: AppColor.primaryColor),
    );
  }

  static void error(BuildContext context, String message, {int delay = 3}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: delay),
        backgroundColor: _black,
      ),
    );
  }

  static void info(BuildContext context, String message, {int delay = 3}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: delay),
        backgroundColor: _black,
      ),
    );
    // Flushbar(
    //   message: message,
    //   duration: Duration(seconds: delay),
    //   backgroundColor: _black,
    // ).show(context);
  }
}

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Network error";
        break;
      case DioErrorType.other:
        message = "Server error";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout";
        break;
      case DioErrorType.response:
        message =
            _handleError(dioError.response?.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  static String message = '';

  String _handleError(dynamic error) {
    final data = error['message'];
    if(data is String){
      return data;
    }else if(data is List){
      return data[0];
    }
    return '';
  }

  @override
  String toString() => message;
}
