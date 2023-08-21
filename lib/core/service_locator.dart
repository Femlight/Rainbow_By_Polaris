import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:rainbow_by_polaris/service/datasource.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  /// SERVICES
  ///
  ///

  // locator.registerLazySingleton<NavigationService>(NavigationService.new);

  locator.registerLazySingleton<AuthDataSource>(
        () => AuthDataSource(
      // client: http.Client(),
    ),
  );




  // locator.registerLazySingleton<HomeService>(
  //   () => HomeService(
  //     client: http.Client(),
  //   ),
  // );


}