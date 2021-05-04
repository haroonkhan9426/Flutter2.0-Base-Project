import 'package:f2_base_project/core/others/localization_class.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp()
      // EasyLocalization(
      //     supportedLocales: [Locale('en'), Locale('ar')],
      //     path: 'assets/translations', // Translations path
      //     fallbackLocale: Locale('ar'),
      //     child: MyApp()),
      );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalizationClass(),
      locale: Locale('en'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('hello'.tr),
        Get.locale?.languageCode == 'en'
            ? ElevatedButton(
                child: Text('Change to Arabic'),
                onPressed: () {
                  final arabic = Locale('ar');
                  Get.updateLocale(arabic);
                  // setState(() {
                  //   context.setLocale();
                  // });
                },
              )
            : ElevatedButton(
                child: Text('Change to English'),
                onPressed: () {
                  final english = Locale('en');
                  Get.updateLocale(english);
                },
              )
      ],
    )));
  }
}
