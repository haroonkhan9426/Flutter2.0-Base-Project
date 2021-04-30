import 'package:flutter/material.dart';
// import 'package:tripmate2_0/core/constants/text_styles.dart';

class OnboardingScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
                height: 264,
                width: 245,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/static_assets/onboarding-img4.png',
                    height: 180,
                    width: 245,
                    fit: BoxFit.contain,
                  ),
                )),
          ),
          Column(
            children: <Widget>[
              Text(
                'Get accurate directions',
                // style: onBoardingBlueTS,
              ),
              Text(
                'Through map and instructions',
                // style: onBoardingBodyTS,
              ),
            ],
          ),
          Container(
            height: 0,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Text(
              'Explore your dream destinations with your\ndigital travel mate, TripMate.',
              textAlign: TextAlign.center,
              // style: onBoardingBodyTS,
            ),
          ),
        ],
      ),
    );
  }
}
