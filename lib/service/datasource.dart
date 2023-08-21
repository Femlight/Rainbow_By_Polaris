import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rainbow_by_polaris/core/failure.dart';
import '../data/dtos/create_account_dto/create_account_dto.dart';
import '../data/dtos/login_user_dto/login_user_dto.dart';
import '../data/dtos/login_user_dto/login_user_response_model.dart';
import '../data/dtos/resend_otp/resend_otp.dart';
import '../data/dtos/validate_account_dto/response_model_dto.dart';
import '../data/dtos/validate_account_dto/validate_account_number_dto.dart';
import '../data/dtos/validate_account_otp_dto/validate_account_otp_dto.dart';
import 'api_client.dart';
import 'package:http/http.dart' as http;

class AuthDataSource {
  AuthDataSource({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();
  final ApiClient _apiClient;

  Future<ValidateAccountNumberResDto> validateAccount(ValidateAccountNumberDto request) async {
    try {
      // var url = '/sso-account-register';
      final url = Uri.parse(
          'https://polaris-rainbow-identity-api-dev.azurewebsites.net/sso-account-register');
      print("url" + url.toString());

      final respose = await http.post(
        url,
        body: jsonEncode(request.toJson()),
        headers: {
          "Content-Type": "application/json"
        }
      );
      // final output = await _apiClient.post(url, data: request.toJson(),);
      print('debug response-----' + respose.body);

       final decodedData = jsonDecode(respose.body) ;

      if (decodedData['isSuccess'] == true) {
        ValidateAccountNumberResDto validate = ValidateAccountNumberResDto.fromJson(decodedData);
        print("success");
        return validate;
      } else {
         var errorData = jsonDecode(respose.body);
         String error = errorData['error'];
        print("error----" + error);

        print("error");
        throw Failure(error);

      }
    } on SocketException catch (_) {
      throw Failure("No internet connection");
    } on HttpException {
      throw Failure("Service not currently available");
    }on Failure catch (e) {
      throw Failure(e.message);
    } catch (e, x) {
      print("----1"+ x.toString());
      throw Failure("Something went wrong. Try again");
    }
  }

  Future<Either<String, dynamic>?> verifyAccountPhone(
      ValidateAccountOtpDto request) async {
    const url = '/verify-account-phone';
    try {
      final output = await _apiClient.post(url, data: request.toJson());
      final data = output.data;
      if (data['isSuccess'] == false) {
        return Left(data['error']);
      } else {
        return Right(data);
      }
    } catch (e) {
      if (e is DioException) {
        print(e.response!.data);
      }
    }
    return null;
  }

  Future<Either<String, dynamic>?> createUser(CreateAccountDto request) async {
    const url = '/sso-complete-register';
    try {
      final output = await _apiClient.post(url, data: request.toJson());
      final data = output.data;
      if (data['isSuccess'] == false) {
        return Left(data['error']);
      } else {
        return Right(data);
      }
    } catch (e) {
      if (e is DioException) {
        print(e.response!.data);
      }
    }
    return null;
  }

  Future<Either<String, dynamic>?> resendOtp(ResendOtpDto request) async {
    const url = '/resendOtp';
    try {
      final output = await _apiClient.post(url, data: request.toJson());
      final data = output.data;
      if (data['isSuccess'] == false) {
        return Left(data['error']);
      } else {
        return Right(data);
      }
    } catch (e) {
      if (e is DioException) {
        print(e.response!.data);
      }
    }
    return null;
  }

  Future<Either<String, LoginUserResponseModelDto>?> loginUser(
      LoginUserDto request) async {
    const url = '/login';
    try {
      final output = await _apiClient.post(url, data: request.toJson());
      final data = output.data;
      if (data['isSuccess'] == false) {
        return Left(data['error']);
      } else {
        return Right(
          LoginUserResponseModelDto.fromJson(data),
        );
      }
    } catch (e) {
      if (e is DioException) {
        final error = e.response!.data['value'][0]['message'];
        print(e.response!.data);
        return Left(error);
      }
    }
    return null;
  }
}
