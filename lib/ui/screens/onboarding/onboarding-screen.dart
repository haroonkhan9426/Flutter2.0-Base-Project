import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripmate2_0/core/constants/text_styles.dart';
import 'package:tripmate2_0/core/enums/view_state.dart';
import 'package:tripmate2_0/core/others/locator.dart';
import 'package:tripmate2_0/core/services/sharedPrefsHelper.dart';
import 'package:tripmate2_0/ui/pages/onboarding/onboarding_model.dart';
import 'package:tripmate2_0/ui/pages/root-page.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<OnboardingModel>(
          builder: (context, model, child) => model.state == ViewState.busy
              ? Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Container(
                        child: PageView.builder(
                          itemCount: model.onBoardingPages.length,
                          onPageChanged: (int index) {
                            model.updatePage(index);
                          },
                          controller: model.controller,
                          itemBuilder: (context, index) {
                            return model.onBoardingPages[index];
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          model.currentPageCount == 0
                              ? Container(width: 65)
                              : PreviousButton(),
                          Image.asset(
                            model.indicatorUrl,
                            width: 29,
                            height: 5,
                            fit: BoxFit.contain,
                          ),
                          model.currentPageCount == 3
                              ? FinishButton()
                              : NextButton()
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingModel>(
      builder: (context, model, child) => InkWell(
        child: Container(
          padding: EdgeInsets.only(top: 4, bottom: 4),
          width: 65,
          child: Text(
            'NEXT',
            textAlign: TextAlign.right,
            style: onBoardingNextTS,
          ),
        ),
        onTap: () {
          model.controller.animateToPage(model.currentPageCount + 1,
              duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          print('Next');
        },
      ),
    );
  }
}

class PreviousButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingModel>(
      builder: (context, model, child) => InkWell(
        child: Container(
          padding: EdgeInsets.only(top: 4, bottom: 4),
          width: 65,
          child: Text(
            'PREVIOUS',
            style: onBoardingPreviousTS,
          ),
        ),
        onTap: () {
          print('Previous');
          model.controller.animateToPage(model.currentPageCount - 1,
              duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
        },
      ),
    );
  }
}

class FinishButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(top: 4, bottom: 4),
        width: 65,
        child: Text(
          'FINISH',
          textAlign: TextAlign.right,
          style: onBoardingNextTS,
        ),
      ),
      onTap: () async {
        await locator<SharedPrefsService>().setOnboardingPageCount(4);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => RootScreen()),
            (r) => false);
      },
    );
  }
}
