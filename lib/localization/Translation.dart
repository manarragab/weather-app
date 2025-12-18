import 'package:get/get.dart';

import 'arabicLang.dart';
import 'englishLang.dart';

/*
*  Get.updateLocale(Locale(appLang));
*/
class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
