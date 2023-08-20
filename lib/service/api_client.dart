import 'package:dio/dio.dart';

const baseUrl = 'https://polaris-rainbow-identity-api-dev.azurewebsites.net';
class ApiClient{
 final Dio _dio;

ApiClient ({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(milliseconds: 15000),
));

Future<dynamic> post(String url, {Map<String, dynamic>? data, Map<String, dynamic>? params})async{
    try{
        final response = await _dio.post(url, 
        data: data,
        queryParameters: params
        );
        return response;
    }catch(e){
        rethrow;
    }

}

}