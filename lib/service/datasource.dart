import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../data/dtos/create_account_dto/create_account_dto.dart';
import '../data/dtos/login_user_dto/login_user_dto.dart';
import '../data/dtos/login_user_dto/login_user_response_model.dart';
import '../data/dtos/resend_otp/resend_otp.dart';
import '../data/dtos/validate_account_dto/response_model_dto.dart';
import '../data/dtos/validate_account_dto/validate_account_number_dto.dart';
import '../data/dtos/validate_account_otp_dto/validate_account_otp_dto.dart';
import 'api_client.dart';

class AuthDataSource {
  AuthDataSource({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();
  final ApiClient _apiClient;

  Future<Either<String, ValidateAccountResponseDto>?> validateAccount(
      ValidateAccountNumberDto request) async {
    const url = '/sso-account-register';
    try {
      final output = await _apiClient.post(url, data: request.tJson());
      final data = output.data;

      print(data);
      if (data['isSuccess'] == true) {
        return Right(ValidateAccountResponseDto.fromJson(data));

      } else {
        return Left(data['error']);
      }
    } catch (e) {
      if (e is DioException) {
        final error = e.response!.data['value'][0]['message'];
        print(error);
        return Left(error);
      }
    }
    return null;
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
