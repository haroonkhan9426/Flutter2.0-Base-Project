import 'package:f2_base_project/core/models/body/login_body.dart';
import 'package:f2_base_project/core/models/body/signup_body.dart';
import 'package:f2_base_project/core/models/exceptions/response_exception.dart';
import 'package:f2_base_project/core/models/response/signup_response.dart';
import 'package:f2_base_project/core/models/response/user_profile_response.dart';
import 'package:f2_base_project/core/models/user_profile.dart';

import '../../locator.dart';
import 'database_service.dart';
import 'shared_prefs_service.dart';

///
/// [AuthService] class contains all authentication related logic with following
/// methods:
/// [doSetup]: This method contains all the initial authentication like checking
/// login status, onboarding status and other related initial app flow setup.
///
/// [signupWithEmailAndPassword]: This method is used for signup with email and password.
///
/// [signupWithApple]:
///
/// [signupWithGmail]:
///
/// [signupWithFacebook]:
///
/// [logout]:
///
class AuthService {
  late bool isLogin;
  String? accessToken;
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
  /// 2) Getting user data from the backend
  ///
  doSetup() async {
    print("@authDataService/doSetup");
    accessToken = await _sharedPrefs.getAccessToken();
    onboardingCount = await _sharedPrefs.getOnboardingPageCount();
    print("Auth Token: $accessToken");

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
    }
  }

  updateAccessToken(newToken) async {
    accessToken = newToken;
    await _sharedPrefs.saveAccessToken(accessToken!);
  }

  signupWithEmailAndPassword(SignUpBody body) async {
    late AuthResponse response;
    try {
      response = await _dbService.createUserAccount(body);
      if (response.success) {
        this.accessToken = response.accessToken;
        updateAccessToken(accessToken);
      }
      return response;
    } on ResponseException catch (e) {
      AuthResponse(false, error: e.cause);
      return false;
    }
  }

  loginWithEmailAndPassword(LoginBody body) async {
    late AuthResponse response;
    try {
      response = await _dbService.loginWithEmailAndPassword(body);
      if (response.success) {
        this.accessToken = response.accessToken;
        updateAccessToken(accessToken);
      }
      return response;
    } on ResponseException catch (e) {
      AuthResponse(false, error: e.cause);
      return false;
    }
  }

  signupWithApple() {}

  signupWithGmail() {}

  signupWithFacebook() {}

  // updateRefreshToken(newToken) async {
  //   refreshToken = newToken;
  //   await SharedPreferencesProvider().saveRefreshToken(refreshToken);
  // }

  logout() async {
    isLogin = false;
    accessToken = null;
    userProfile = null;
    await _sharedPrefs.clearAccessToken();
    await _sharedPrefs.clearRefreshToken();
  }
}
