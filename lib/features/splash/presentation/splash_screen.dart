import 'package:weather_app/domain_data/main_getx_controller/main_getx_controller.dart';
import 'package:weather_app/features/home/domain/controller/home_controller.dart';
import 'package:weather_app/res/common-widgets/custm_button.dart';
import 'package:weather_app/res/configuration/color.dart';
import 'package:weather_app/res/configuration/fonts.dart';
import 'package:weather_app/res/configuration/image/custom_image.dart';
import 'package:weather_app/res/configuration/print_types.dart';
import 'package:weather_app/res/loading/loading_overlay_widget.dart';
import 'package:weather_app/res/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../domain/controller/splash_controller.dart';

//  onTap: (){

//                      Future.delayed(const Duration(seconds: 1), () {
//       sPrint.info('getUser:: ${sl<AuthCases>().getUser() != null}');
//       if ( sl<AuthCases>().getToken() != null) {
//        // Get.offAllNamed('/homePage');
// Get.toNamed(CustomPage.homePage);
//       } else {
//        // Get.offAllNamed('/loginPage');
// Get.offAllNamed(CustomPage.registerPage);
//       }
//  });
//                   },

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.find<SplashController>();
  final homeController = Get.find<HomeController>();
  final mainController = Get.find<MainGetxController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.violet,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 30,
            children: [
              CustomImage.asset(
                'assets/images/cloud.png',
                height: 100,
                width: 100,
              ),

              Text(
                'Weather App',
                style: TFonts.kavoonFont(
                  color: CustomColors.white,
                  fontSize: 36,
                ),
              ),

              Text(
                'Weather App',
                style: TFonts.interFont(
                  color: CustomColors.white,
                  fontSize: 24,
                ),
              ),
              LoadingOverLay(showLoadingOnly: true, child: button()),

              InkWell(
                onTap: () {
                  Get.toNamed(CustomPage.registerPage);
                },
                child: Text(
                  'create an account',
                  style: TFonts.josefinFont(
                    color: CustomColors.black,
                    fontSize: 9,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return MainButton(
      onPressed: () async {
        //important
        mainController.loadingGetxController.showLoading();

        sPrint.info('getUser:: ${await mainController.isLogin}');
        if (await mainController.isLogin == true) {
          print("${mainController.userDataa?.name ?? "lll"} }");
          print("${mainController.userDataa?.profileImage ?? "lll"} }");
          await homeController.getALLData();
          Get.offAllNamed(CustomPage.mainPage);
          print("ffff${mainController.userDataa?.name ?? "lll"} }");
          mainController.loadingGetxController.hideLoading();
        } else {
          Get.offAllNamed(CustomPage.loginPage);
          mainController.loadingGetxController.hideLoading();
        }
      },
      title: 'Get Start',
      backgroundColor: CustomColors.blueee,
      height: 33,
      width: Get.width * 0.4,
      withShadow: false,
    );
  }
}
