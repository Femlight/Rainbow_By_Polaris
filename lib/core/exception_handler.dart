// class ExceptionHandler {
//   static String handle(Exception ex) {
//     String msg = "This is an error from ExceptionHandler";
//
//     return ex.toString(); // msg;
//   }
// }
import 'package:dio/dio.dart';

class ExceptionHandler implements Exception {
  ExceptionHandler.getError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = "Request cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Network error";
        break;
      case DioExceptionType.unknown:
        message = "Server error";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout";
        break;
      case DioExceptionType.badResponse:
        message =
            _handleError(dioException.response?.data);
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