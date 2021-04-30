import 'package:flutter/material.dart';
// import 'package:tripmate2_0/core/constants/text_styles.dart';

class OnboardingScreen2 extends StatelessWidget {
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
            'assets/static_assets/onboarding-img2.png',
            height: 264,
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              'Book Hotels on the go',
              // style: onBoardingBlueTS,
            ),
            Text(
              'Real-time bookings',
              // style: onBoardingBodyTS,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            'Find and book hotels to make your trips hassle-free.',
            textAlign: TextAlign.center,
            // style: onBoardingBodyTS,
          ),
        ),
      ],
    ));
  }
}
