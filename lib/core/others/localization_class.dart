import 'package:get/get.dart';

class LocalizationClass extends Translations {
  // LocalizationClass(){
  //   loadLanguages();
  // }

  // loadLanguages(){

  // }
  @override
  Map<String, Map<String, String>> get keys {
    // final _localizationString = {};
    // List<String> supportedLanguages = ['en', 'ar'];
    // for(final lang in supportedLanguages){
    // }
    // final jsonString = rootBundle.load('assets/transalations/en.json');
    // return {
    //   "en": {}
    // };
    const Map<String, String> lang_en = {"hello": "Hello world!"};

    const Map<String, String> lang_ar = {"hello": "!مرحبا بالعالم"};

    return {
      'en': lang_en,
      'ar': lang_ar,
    };
  }
}
