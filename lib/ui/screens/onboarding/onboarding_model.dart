import 'package:f2_base_project/core/enums/view_state.dart';
import 'package:f2_base_project/core/others/base_view_model.dart';
import 'package:f2_base_project/core/services/shared_prefs_service.dart';
import 'package:f2_base_project/locator.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen1.dart';
import 'onboarding_screen2.dart';
import 'onboarding_screen3.dart';
import 'onboarding_screen4.dart';

class OnboardingModel extends BaseViewModel {
  final _sharedPrefsService = locator<SharedPrefsService>();
  late PageController controller;
  late int currentPageCount;
  List<dynamic> onBoardingPages = [
    OnboardingScreen1(),
    OnboardingScreen2(),
    OnboardingScreen3(),
    OnboardingScreen4(),
  ];

  /// These icons can be updated
  final dottedIcons = [
    'assets/static_assets/dotted-1.png',
    'assets/static_assets/dotted-2.png',
    'assets/static_assets/dotted-3.png',
    'assets/static_assets/dotted-4.png'
  ];

  var indicatorUrl;

  OnboardingModel() {
    init();
  }

  init() async {
    setState(ViewState.busy);
    currentPageCount = await _sharedPrefsService.getOnboardingPageCount();
    indicatorUrl = dottedIcons[currentPageCount];
    controller = PageController(initialPage: currentPageCount);
    setState(ViewState.idle);
  }

  updatePage(index) {
    currentPageCount = index;
    indicatorUrl = dottedIcons[currentPageCount];
    _sharedPrefsService.setOnboardingPageCount(index);
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
