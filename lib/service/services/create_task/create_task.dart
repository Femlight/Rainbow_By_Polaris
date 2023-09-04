import 'package:dio/dio.dart';
import '../../../data/data_storage/access_token_storage.dart';
import '../../../data/dtos/create_task_dto/create_task_dto.dart';
import '../../../data/dtos/login_user_dto/login_user_response_model.dart';
import '../../api_client.dart';
import '../../api_urls/api_urls.dart';

class CreateTask {
  static final Dio dio = Dio();
  static Future<LoginUserResponseModelDto?> createTask(
      LoginUserResponseModelDto changeUserPassWord) async {
    final url = ApiEndpoint.createTask();
    try {
      var response = await dio.post(
        url,
        data: changeUserPassWord.toJson(),
      );

      if (response.statusCode == 200) {
        var createTask = LoginUserResponseModelDto.fromJson(response.data);
        return createTask;
      }
    } catch (e) {
      if (e is DioException) {
        final error = e.response!.data['value'][0]['message'];

        return error;
      }
      return null;
    }
    return null;
  }
}


