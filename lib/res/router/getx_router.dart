import 'package:get/get.dart';

class CustomGet {
  static toNamed(String page) {
  //  Get.rootDelegate.toNamed(page);
    Get.toNamed(page);
  }

  static offNamed(String page) {
  //  Get.rootDelegate.offNamed(page);
    Get.offNamed(page);
  }

  static offAllNamed(String page) {
   // Get.rootDelegate.offAndToNamed(page);
    Get.offAllNamed(page);
  }

  static getBack() {
    Get.back();
  }
}
