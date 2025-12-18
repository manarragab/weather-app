
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/res/router/pages.dart';

import '../res/configuration/print_types.dart';

enum Lang { ar, en }

class TLang {
  
  static const String _languageKey = "language";

  static TextDirection get textDirection =>
      isArabic() ? TextDirection.rtl : TextDirection.ltr;

  static ar(bool refreshHome) {
    Get.updateLocale(Locale(Lang.ar.name));
    addSelectedLanguage();
   // updateControllers(refreshHome);
  }
 
  static en(bool refreshHome) {
    Get.updateLocale(Locale(Lang.en.name));
    addSelectedLanguage();
    //updateControllers(refreshHome);

  }

  static isEnglish(String value) {
    String englishChar = 'qwertyuiopasdfghjklzxcbnm';
    try {
      bool isEnglishChar = englishChar.contains(value.trim()[0].toLowerCase());
      // Print.info('isEnglishChar $value :: $isEnglishChar');
      return isEnglishChar;
    } catch (e) {
      sPrint.warning(e);
      return false;
    }
  }

  static getDeviceLocal() {
    return Get.deviceLocale!.languageCode == 'ar' ? Lang.ar : Lang.en;
  }

  static bool checkIFSelectLocal() {
    GetStorage storage = GetStorage();
    return storage.read(_languageKey) != null;
  }

  static Lang getLocalLang() {
    try {
      GetStorage storage = GetStorage();
      return Lang.values[storage.read(_languageKey) ?? Lang.en.index];
    } catch (e, s) {
      sPrint.error(e, s);
      addSelectedLanguage();
      return Lang.en;
    }
  }

  static void addSelectedLanguage() {
    GetStorage storage = GetStorage();
    storage.write(_languageKey, TLang.getCurrentLocale().index);
  }

  static Lang getCurrentLocale() {
    return Get.locale?.languageCode == 'ar' ? Lang.ar : Lang.en;
  }

  static bool isArabic() {
    return getCurrentLocale() == Lang.ar;
  }

  static void updateControllers(bool refreshHome) {
    Get.offAllNamed(CustomPage.homePage);
  }
}
