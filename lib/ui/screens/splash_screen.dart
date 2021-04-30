import 'package:f2_base_project/core/services/auth_service.dart';
import 'package:f2_base_project/core/services/database_service.dart';
import 'package:f2_base_project/locator.dart';
import 'package:f2_base_project/main.dart';
import 'package:f2_base_project/ui/screens/auth_signup/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpalshScreen extends StatefulWidget {
  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  final _authService = locator<AuthService>();
  final _dbService = locator<DatabaseService>();

  @override
  void initState() {
    _initialSetup();
    super.initState();
  }

  _initialSetup() async {
    await _authService.doSetup();
    await Future.delayed(Duration(seconds: 1));
    print('Login State: ${_authService.isLogin}');

    switch (_authService.onboardingCount) {
      case 1:
        // Goto onboarding screen#1
        print('onBoarding 1');
        return;
      case 2:
        // Goto onboarding screen#2
        print('onBoarding 2');
        return;
      default:
        break;
    }

    if (_authService.isLogin) {
      print('Token is valid');
      Get.off(HomePage());
    } else {
      Get.off(LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(),
        ),
      ),
    );
  }
}
