import 'dart:io';

import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/data/remote_data/response_model.dart';
import 'package:weather_app/res/configuration/asstes_path.dart';
import 'package:flutter/cupertino.dart';

import '../../../res/configuration/dialog.dart';
import '../custom_state_mixin.dart';

enum StatusType { apiError, apiSuccess, authError, ban, empty, none }

class StatusError {
  StatusType getStatus(num status) {
    switch (status) {
      case 422:
        return StatusType.apiError;
      case 200 || 201 || 202:
        return StatusType.apiSuccess;
      case 401:
        return StatusType.authError;
      default:
        return StatusType.values[status.toInt()];
    }
  }

  checkStatus(
    ResponseModel<dynamic> data,
    Function onSuccess, {
    bool useChange = true,
    CustomStateMixin? stateMixin,
    Function(String)? onError,
    bool showErrorToast = true,
    bool showSuccessToast = false,
  }) {
    sPrint.info('statusType :: ${getStatus(data.status!)}');
    try {
      switch (getStatus(data.status!)) {
        case StatusType.apiError:
          sPrint.warning(
            data.message.toString(),
          );
          if (useChange && stateMixin != null) {
            stateMixin.change('',
                status: RxStatus.error(data.message.toString()));
          }
          if (showErrorToast) {
            showToast('${data.message}', MessageErrorType.error);
          }
          if (onError != null) {
            return onError.call("${data.message}");
          }
          break;
        case StatusType.apiSuccess:
          sPrint.success('get Success');
          if (showSuccessToast) {
            Future.delayed(const Duration(milliseconds: 500), () {
              showToast('${data.message}', MessageErrorType.success);
            });
          }
          return onSuccess.call();
        case StatusType.authError:
          authFunction();
          if (useChange && stateMixin != null) {
            stateMixin.change('', status: RxStatus.authentication());
          }
          break;
        case StatusType.none:
          // TODO: Handle this case.
          break;
        case StatusType.ban:
          banFunction();
          if (useChange && stateMixin != null) {
            stateMixin.change('', status: RxStatus.authentication());
          }
          break;
        case StatusType.empty:
          // TODO: Handle this case.
          break;
      }
    } catch (e, s) {
      sPrint.error(e, s);
      showToast(e.toString(), MessageErrorType.error);
    }
  }

  void authFunction() {
    bool isIos = Platform.isIOS;
    Get.dialog(
      AlertDialog.adaptive(
        title: const Text('family health'),
        content: Text(CustomTrans.needLogin.tr),
        actions: [
          isIos
              ? CupertinoDialogAction(
                  onPressed: () {
                    Get.back();
                    // sl<AuthCases>().setUser(null);
                 //   CustomGet.offAllNamed(CustomPage.loginPage);
                  },
                  child: Text(CustomTrans.signIn.tr))
              : TextButton(
                  onPressed: () {
                    Get.back();
                    // sl<AuthCases>().setUser(null);
                  //  CustomGet.offAllNamed(CustomPage.loginPage);
                  },
                  child: Text(CustomTrans.signIn.tr)),
          isIos
              ? CupertinoDialogAction(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(CustomTrans.cancel.tr))
              : TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(CustomTrans.cancel.tr)),
        ],
      ),
      barrierDismissible: false,
    );
    /* TDialog.showErrorDialog(
        onTap: () {
          sl<AuthCases>().setUser(null);
          CustomGet.toNamed(CustomPage.loginPage);
        },
        image: CustomIcon.imLoginScreenSvg,
        title: 'يجب تسجيل الدخول اولا',
        mainButtonTitle: 'تسجيل الدخول');*/
  }

  void banFunction() {
    TDialog.showErrorDialog(
        onTap: () {
          //CustomGet.toNamed(CustomPage.loginPage);
        },
        image: CustomIcon.imLoginScreenSvg,
        title: 'يجب التواصل مع الأدمن لقبول حسابك',
        mainButtonTitle: 'تسجيل الدخول بحساب اخر');
  }
}
