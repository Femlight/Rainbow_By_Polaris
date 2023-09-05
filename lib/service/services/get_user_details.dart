import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../core/util.dart';
import '../../data/data_storage/access_token_storage.dart';
import '../../data/data_storage/user_storage.dart';
import '../../data/user_details/user_details_model.dart';
import '../api_urls/api_urls.dart';

class UserDetailService {
  static final _dio = Dio();
  static Future<UserDetailsResponseModelDtoTexting?> getUserDetails() async {
    final url = ApiEndpoint.getUserDetails();
    String accessToken = AccessTokenStorage.retrieveToken();
    try {
      var response = await _dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      print('i am in user details');
      print(response.data);
      if (response.statusCode == 200) {
        var userDetails = UserDetailsResponseModelDtoTexting.fromJson(response.data);
        UserStorage.storePhoneNumber(userDetails.value!.phoneNumber.toString());
        UserStorage.storeEmail(userDetails.value!.email.toString());
        UserStorage.storeFirstName(userDetails.value!.firstName.toString());
        UserStorage.storeLastName(userDetails.value!.lastName.toString());
        UserStorage.storeChildId(userDetails.value!.childDetailsViewModel!.first.accountId.toString());
        UserStorage.storeChildFirstName(userDetails.value!.childDetailsViewModel!.first.firstName.toString());
        UserStorage.storeParentId(userDetails.value!.childDetailsViewModel!.first.parentAccountId.toString());
        return userDetails;
      }
    } catch (e) {
      if (e is DioError) {
        final error = DioExceptions.fromDioError(e).toString();
        return UserDetailsResponseModelDtoTexting(message: error);
      }
    }
    return null;
  }
}



class UserChildDetailService {
  static final _dio = Dio();
  static Future<List<ChildDetailsViewModel>?> getUserChildDetails() async {
    final url = ApiEndpoint.getUserDetails();
    String accessToken = AccessTokenStorage.retrieveToken();
    try {
      var response = await _dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      print('i am in user details');
      print(response.data);
      if (response.statusCode == 200) {
        var dataList = UserDetailsResponseModelDtoTexting.fromJson(response.data);
        var users =  dataList.value!.childDetailsViewModel;
        return users;

      }
    } catch (e) {
      if (e is DioError) {
        return null;
      }
    }
    return null;
  }
}
