import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rainbow_by_polaris/core/failure.dart';
import 'package:rainbow_by_polaris/core/util.dart';
import '../data/dtos/create_account_dto/create_account_dto.dart';
import '../data/dtos/create_task_dto/create_task_dto.dart';
import '../data/dtos/create_task_dto/create_task_response_model.dart';
import '../data/dtos/login_user_dto/login_user_dto.dart';
import '../data/dtos/login_user_dto/login_user_response_model.dart';
import '../data/dtos/resend_otp/resend_otp.dart';
import '../data/dtos/validate_account_dto/response_model_dto.dart';
import '../data/dtos/validate_account_dto/validate_account_number_dto.dart';
import '../data/dtos/validate_account_otp_dto/validate_account_otp_dto.dart';
import '../data/user_details/user_details_model.dart';
import 'api_client.dart';
import 'package:http/http.dart' as http;

class AuthDataSource {
  final dio = Dio();
  AuthDataSource({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();
  final ApiClient _apiClient;
  ////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////Validate Account///////////////////////////////////////////

  Future<ValidateAccountNumberResDto> validateAccount(
      ValidateAccountNumberDto request) async {
    try {
      final url = Uri.parse(
          'https://polaris-rainbow-identity-api-dev.azurewebsites.net/sso-account-register');

      final respose = await http.post(url,
          body: jsonEncode(request.toJson()),
          headers: {"Content-Type": "application/json"});

      final decodedData = jsonDecode(respose.body);

      if (decodedData['isSuccess'] == true) {
        ValidateAccountNumberResDto validate =
            ValidateAccountNumberResDto.fromJson(decodedData);

        return validate;
      } else {
        var errorData = jsonDecode(respose.body);
        String error = errorData['error'];

        throw Failure(error);
      }
    } on SocketException catch (_) {
      throw Failure("No internet connection");
    } on HttpException {
      throw Failure("Service not currently available");
    } on Failure catch (e) {
      throw Failure(e.message);
    } catch (e, x) {
      throw Failure("Something went wrong. Try again");
    }
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////verify Account Phone///////////////////////////////////////////

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
      if (e is DioError) {
        final error = DioExceptions.fromDioError(e).toString();
        return Left(error);
      }
    }
    return null;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////create User///////////////////////////////////////////
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
      if (e is DioError) {
        final error = DioExceptions.fromDioError(e).toString();
        return Left(error);
      }
    }
    return null;
  }
////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////Resend OTP///////////////////////////////////////////

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
      if (e is DioError) {
        final error = DioExceptions.fromDioError(e).toString();
        return Left(error);
      }
    }
    return null;
  }
////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////Login User///////////////////////////////////////////

  Future<Either<String, LoginUserResponseModelDto>?> loginUser(
      LoginUserDto request) async {
    const url = '/login';
    try {
      final output = await _apiClient.post(url, data: request.toJson());
      final data = output.data;
      print(data);
      if (data['isSuccess'] == false) {
        return Left(data['error']);
      } else {
        return Right(
          LoginUserResponseModelDto.fromJson(data),
        );
      }
    } catch (e) {
      if (e is DioError) {
        final error = DioExceptions.fromDioError(e).toString();
        return Left(error);
      }
    }
    return null;
  }

////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////Create Task////////////////////////////////////////////////

  Future<Either<String, CreateTaskResponseModelDto>?> createTask(
      CreateTaskRequestDto request) async {
    const url = '/api/v1/tasks/create';
    try {
      final output = await _apiClient.post(url,data: request.toJson(), isIdentity: false);
      final data = output.data;
      print('taskData: $data');
      if (data['isSuccess'] == false) {
        return Left(data['error']);
      } else {
        return Right(
          CreateTaskResponseModelDto.fromJson(data),
        );
      }
    } catch (e) {
<<<<<<< HEAD
      if (e is DioException) {
        print(e.response!.data);
        final error = e.response!.data['value'][0]['message'];

        return Left(error);
=======
      if (e is DioError) {
        print(e.requestOptions.data);
        print(e.response!.data['value']['errors'][0]['message']);
        final removeLater = e.response!.data['value']['errors'][0]['message'];
        final error = DioExceptions.fromDioError(e).toString();
        return Left(removeLater);
>>>>>>> 543e435eec2b6719e6f259af0216f997a4affae2
      }
    }
    return null;
  }
}
