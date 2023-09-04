import 'package:rainbow_by_polaris/data/data_storage/password_storage.dart';
import 'package:rainbow_by_polaris/data/data_storage/user_storage.dart';
import 'package:rainbow_by_polaris/data/data_storage/username_storage.dart';

import 'access_token_storage.dart';
import 'biometric_storage.dart';

clearMemory() async {
  // await RefreshTokenStorage.clearToken();
  await AccessTokenStorage.clearToken();
  await UserNameStorage.clearUsername();
  await UserStorage.clearName();
  await UserPasswordStorage.clearUserPin();
  await BiometricStorage.clearBiometric();
  // await InitScreenStorage.clearInit();
  // await OnboardingStorage.storeOnboarding(true);
}
