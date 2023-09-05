import 'package:dio/dio.dart';

const identityUrl = 'https://polaris-rainbow-identity-api-dev.azurewebsites.net';
const coreUrl = 'https://polaris-rainbow-core-api-dev.azurewebsites.net';
class ApiClient{
 final Dio _dio;

ApiClient ({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(
    connectTimeout: 15000,
));

Future<dynamic> post(String url, {Map<String, dynamic>? data,
    Map<String, dynamic>? params, bool isIdentity = true})async{
    try{
        final response = await _dio.post(isIdentity ? identityUrl+url : coreUrl+url,
        data: data,
        queryParameters: params
        );
        return response;
    }catch(e){
        rethrow;
    }

}

}