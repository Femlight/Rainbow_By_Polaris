// import 'dart:developer';

// import 'package:golf_membership_mobile_app/config/app_config.dart';
// import 'package:golf_membership_mobile_app/core/controllers/base_controller.dart';
// import 'package:golf_membership_mobile_app/core/di_container.dart';
// import 'package:golf_membership_mobile_app/data/app_session/app_session.dart';
// import 'package:golf_membership_mobile_app/main/main_dev.dart';
// import 'package:golf_membership_mobile_app/main/main_prod.dart';

// class NavigationDrawerController extends BaseController {
//   Future<void> logout() async {
//     AppSession.clear();

//     try {
//       final environment = diContainer<AppConfig>().appEnvironment;
//       await diContainer.reset();

//       if (environment == AppEnvironment.dev) {
//         init(devConfig);
//       }

//       if (environment == AppEnvironment.prod) {
//         init(prodConfig);
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
