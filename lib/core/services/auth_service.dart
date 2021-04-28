import 'package:f2_base_project/core/models/exceptions/response_exception.dart';
import 'package:f2_base_project/core/models/response/user_profile_response.dart';
import 'package:f2_base_project/core/models/user_profile.dart';

import '../../locator.dart';
import 'database_service.dart';
import 'shared_prefs_service.dart';

///
///
/// This class is used for checking [user-token] if not [null] than
/// directly navigate to dashboard screen other wise false the [isLogin flag] to [false ] so
/// that user have to login again
///
///
class AuthService {
  late bool isLogin;
  String? accessToken;
  String? refreshToken;
  late int onboardingCount;
  final _sharedPrefs = SharedPrefsService();
  final _dbService = locator<DatabaseService>();
  UserProfile? userProfile;

//  AuthDataService() {
//    doSetup();
//  }

  ///
  /// [doSetup] function does all the initial settings including:
  /// 1) Getting auth tokens from sharePrefs
  /// 2) Getting firebase user
  /// 3) Getting user data from the backend
  ///
  doSetup() async {
    print("@authDataService/doSetup");
    try {
      accessToken = await _sharedPrefs.getAccessToken();
      refreshToken = await _sharedPrefs.getRefreshToken();
      onboardingCount = await _sharedPrefs.getOnboardingPageCount();
      print("Auth Token: $accessToken");
      print("Refresh Token: $refreshToken");

      isLogin = accessToken != null;
      if (isLogin) {
        try {
          UserProfileResponse response = await _dbService.getUserProfile();
          if (response.success) {
            userProfile = response.userProfile;
          } else {
            print('Login failed for error: ${response.error}');
          }
        } on ResponseException catch (e) {
          /// Show network request failed alert
          print(e);
        }
        UserProfileResponse response = await _dbService.getUserProfile();
        if (response.success) {
          userProfile = response.userProfile;
        } else {
          print('Login failed for error: ${response.error}');
        }
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  updateAccessToken(newToken) async {
    accessToken = newToken;
    await _sharedPrefs.saveAccessToken(accessToken!);
  }

  // updateRefreshToken(newToken) async {
  //   refreshToken = newToken;
  //   await SharedPreferencesProvider().saveRefreshToken(refreshToken);
  // }

  clear() async {
    isLogin = false;
    accessToken = null;
    refreshToken = null;
    userProfile = null;
    await _sharedPrefs.clearAccessToken();
    await _sharedPrefs.clearRefreshToken();
  }
}
