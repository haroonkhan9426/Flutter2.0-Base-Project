import 'package:flutter/material.dart';
// import 'package:tripmate2_0/core/constants/text_styles.dart';

class OnboardingScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        backgroundColor: Colors.yellow,
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Image.asset(
            'assets/static_assets/onboarding-img3.png',
            height: 264,
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              'Find attractions to explore',
              // style: onBoardingBlueTS,
            ),
            Text(
              'Like a native',
              // style: onBoardingBodyTS,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            'Find attractions to explore and feel\n like a native with TripMate.',
            textAlign: TextAlign.center,
            // style: onBoardingBodyTS,
          ),
        ),
      ],
    ));
  }
}
