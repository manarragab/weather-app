import 'package:get/get.dart';

import '../../localization/all_keys.dart';
import 'print_types.dart';

class TValidator {
  static String? normalValidator(String? value,{String? hint,bool Function(String)? validate}) {
    bool showValidate = false;
    if(validate != null){
      showValidate = validate(value!);
    }
    if (value == null || value.isEmpty) {
      return hint ?? CustomTrans.mustHaveValue.tr;
    }else if(showValidate){
      return hint ?? CustomTrans.mustHaveValue.tr;
    }else{
      return null;
    }
  }


static String? otpValidator(String? value, {String? hint}) {
  // 1️⃣ Check if empty
  if (value == null || value.isEmpty) {
    return hint ?? CustomTrans.mustHaveValue.tr;
  }

  // 2️⃣ Check if not exactly 6 digits
  final otpRegExp = RegExp(r'^\d{6}$');
  if (!otpRegExp.hasMatch(value)) {
    return "OTP must be exactly 6 digits";
  }

  // 3️⃣ Everything is fine
  return null;
}


  static String? egyptianNumberValidator(
    String? value, {
    String? hint,
  }) {
   return normalValidator(value,hint: CustomTrans.writePhone.tr,validate: (value){
     return !(value.startsWith("01") && value.length == 11);
    });
  }

  static String? confirmPasswordValidate(
      {required String? value, required String password}) {
    sPrint.info('value:: $value  password:: $password');

    return normalValidator(value,hint: CustomTrans.wrongConfirmedPassword.tr,validate: (value){
      return !(value == password);
    });
   /* if (value == null || value.isEmpty) {
      return CustomTrans.mustHaveValue.tr;
    } else if (!(value == password)) {
      return CustomTrans.wrongConfirmedPassword.tr;
    } else {
      return null;
    }*/
  }

  static String? itemInList({required String? item, required List<String> list}) {
    if (item == null || item.isEmpty) {
      return CustomTrans.mustHaveValue.tr;
    } else if (!(list.any((element) => element == item))) {
      return "wrong choose";
    } else {
      return null;
    }
  }

  static String? email(String? value,) {
    return normalValidator(value,hint: CustomTrans.wrongEmail.tr,validate: (value){
      return !GetUtils.isEmail(value);
    });
   /* if (value == null || value.isEmpty) {
      return CustomTrans.mustHaveValue.tr;
    } else if (GetUtils.isEmail(value)) {
      return null;
    } else {
      return CustomTrans.wrongEmail.tr;
    }*/
  }

  static String? website(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.startsWith("http") || value.startsWith("https")) {
        if (!GetUtils.isURL(value)) {
          return CustomTrans.wrongWebSite.tr;
        }
      } else if (!value.startsWith("www.")) {
        return CustomTrans.wrongWebSite.tr;
      } else {
        return null;
      }
      return null;
    }
    return null;
  }
}
