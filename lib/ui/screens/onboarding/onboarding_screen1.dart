import 'package:flutter/material.dart';
// import 'package:tripmate2_0/core/constants/text_styles.dart';

class OnboardingScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Image.asset(
            'assets/static_assets/onboarding-img1.png',
            height: 264,
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              'Welcome to the new TripMate',
              // style: onBoardingBlueTS,
            ),
            Text(
              'Cleaner. Smarter. Faster',
              // style: onBoardingBodyTS,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            'TripMate 2.0 is here! Redesigned to provide you memorable travel experiences.',
            textAlign: TextAlign.center,
            // style: onBoardingBodyTS,
          ),
        ),
      ],
    ));
  }
}
