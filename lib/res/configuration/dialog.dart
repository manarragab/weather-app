import 'package:weather_app/data/const/export.dart';

class TDialog {
  static showErrorDialog(
      {String? title,
      String? image,
      String? mainButtonTitle,
      required void Function() onTap,
      bool showCancelButton = false}) {
    showDialog(
      title: title ?? CustomTrans.successOperation.tr,
      imagePath: image ?? "icoSad",
      onMainTap: onTap,
      mainButtonTitle: mainButtonTitle ?? CustomTrans.goMainPage.tr,
      showCancelButton: showCancelButton,
    );
  }

  static showSuccessDialog(
      {String? title,
      String? mainButtonTitle,
      required void Function() onTap,
      bool showCancelButton = false}) {
    showDialog(
      title: title ?? CustomTrans.successOperation.tr,
      imagePath: "icoSuccess",
      onMainTap: onTap,
      mainButtonTitle: mainButtonTitle ?? CustomTrans.goMainPage.tr,
      showCancelButton: showCancelButton,
    );
  }

  static showLogOutDialog() {
    showDialog(
      title: CustomTrans.areYouSureYouWantToLogout.tr,
      imagePath: "assets/images/logoutd.png",
      onMainTap: () {
      //  CustomGet.offAllNamed(CustomPage.loginPage);
      },
      mainButtonTitle: CustomTrans.signOut.tr,
      showCancelButton: true,
    );
  }

// just for all static method in this class
  static Future<bool?> showDialog({
    required String title,
    required String imagePath,
    required void Function() onMainTap,
    required String mainButtonTitle,
    double height = 350,
    double width = 382,
    bool showCancelButton = false,
  }) {
    return Get.dialog<bool>(
      AlertDialog(
        backgroundColor: CustomColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        content: SizedBox(
          height: showCancelButton ? height : height - 50,
          width: width,
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              ImageDialog(title, imagePath),
              MainButton(
                  title: mainButtonTitle,
                  onPressed: () {
                    onMainTap();
                    Get.back(result: true);
                  }),
              if (showCancelButton == true)
                const SizedBox(
                  height: 7,
                ),
              if (showCancelButton == true)
                MainButton(
                  title: CustomTrans.cancel.tr,
                  onPressed: () {
                    Get.back(result: false);
                  },
                  backgroundColor: CustomColors.white,
                  textColor: CustomColors.primary,
                )
            ],
          ),
        ),
      ),
      barrierColor: CustomColors.black.withOpacity(0.75),
      barrierDismissible: true,
    );
  }

  static Future<bool?> warningDialog(
      {required void Function() onConfirm}) async {
    return showDialog(
      title: 'are you sure you want to remove product',
      imagePath: "assets/svg/full_logo.svg",
      onMainTap: onConfirm,
      mainButtonTitle: CustomTrans.confirm.tr,
      showCancelButton: true,
    );
  }

  static void showBarcodeDialog(String image) {
    // Get.dialog(ImageDialog(title, image));
    Get.dialog(AlertDialog(
      backgroundColor: CustomColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      content: CustomImage.network(image, height: 200),
    ));
  }

  static showConfirmDialog() async {
    return Get.dialog<bool>(AlertDialog(
      backgroundColor: CustomColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomPadding.radius),
      ),
      title: Text(CustomTrans.confirmStep.tr),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      content: Text(CustomTrans.stepMessage.tr),
      actions: [
        TextButton(
            onPressed: () {
              Get.back(result: true);
            },
            child: Text(
              CustomTrans.yes.tr,
              style: TFonts.style(color: CustomColors.accent),
            )),
        TextButton(
            onPressed: () {
              Get.back(result: false);
            },
            child: Text(
              CustomTrans.no.tr,
              style: TFonts.style(color: CustomColors.accent),
            )),
      ],
    ));
  }

  static showNeedUpdatedProfileDialog() async {
    return Get.dialog<bool>(AlertDialog(
      backgroundColor: CustomColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomPadding.radius),
      ),
      title: Text(CustomTrans.profile.tr),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      content: Text(CustomTrans.needUpdateProfile.tr),
      actions: [
        TextButton(
            onPressed: () {
              Get.back(result: true);
            },
            child: Text(
              CustomTrans.yes.tr,
              style: TFonts.style(color: CustomColors.accent),
            )),
        TextButton(
            onPressed: () {
              Get.back(result: false);
            },
            child: Text(
              CustomTrans.no.tr,
              style: TFonts.style(color: CustomColors.accent),
            )),
      ],
    ));
  }

/* static showLangDialog({
    required String title,
    required void Function() onMainTap,
    required String mainButtonTitle,
    double height = 330,
    double width = 382,
  }) {
    Rx<Lang> choseLang = TLang.getCurrentLocale().obs;

    Get.dialog(
      AlertDialog(
        backgroundColor: TColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: TColors.primary,
            width: 3,
          ),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        content: LangDialog(
          choseLang: choseLang,
          height: height,
          width: width,
        ),
      ),
      barrierColor: TColors.black.withOpacity(0.75),
      barrierDismissible: true,
    );
  }*/
}

class ImageDialog extends StatelessWidget {
  ImageDialog(this.title, this.imagePath, {Key? key}) : super(key: key);

  String title;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195,
      child: Column(
        children: [
          SizedBox(
            height: imagePath.contains('.svg') ? 101 : 120,
            width: imagePath.contains('.svg') ? 103 : 200,
            child: imagePath.contains('.svg')
                ? SvgPicture.asset(imagePath)
                : Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
          ),
          const SizedBox(
            height: 19,
          ),
          Text(
            title,
            style: TFonts.style(
              color: CustomColors.black,
              fontWeight: TFontWights.bold,
              fontSize: TFontSizes.f20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
