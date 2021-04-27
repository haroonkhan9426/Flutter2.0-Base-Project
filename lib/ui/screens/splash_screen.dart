import 'package:flutter/material.dart';

class SpalshScreen extends StatefulWidget {
  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _initialSetup() async {
    await authDataService.doSetup();
    await Future.delayed(Duration(seconds: 1));
    getSignCode();
    print('Login State: ${authDataService.isLogin}');
    // getOnBoardings();
    switch (authDataService.onBoardingStatus) {
      case 'onBoarding_1':
        print('onBoarding_1');
        Get.to(OnBoardingScreen(0));
        return;
      case 'onBoarding_2':
        print('onBoarding_2');
        Get.to(OnBoardingScreen(1));
        return;
      default:
        break;
    }
    if (authDataService.isLogin) {
      /// Now check if token is valid or not. If expired
      /// then generate a new token.
      /// If refresh is invalid as well, then navigate user to login screen
      final isTokenValid =
          await _dbService.verifyToken(authDataService.accessToken);
      if (!isTokenValid) {
        print('Access token is invalid');
        final RefreshTokenBody body =
            await _dbService.refreshToken(authDataService.refreshToken);
        if (!body.status) {
          print('Refresh token is invalid');
          await _dbService.logout();
          Get.off(LoginScreen());
          return;
        }
      }

      /// If token is valid, it means user is logged in.
      /// Just navigate to Root screen
      print('Token is valid');
      Get.off(RootScreen());
    } else {
      Get.off(LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
