import 'package:weather_app/data/const/enums.dart';
import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/features/auth/domain/controller/auth_controller.dart';
import 'package:weather_app/res/configuration/text_field/text_field.dart';
import 'package:weather_app/res/loading/loading_overlay_widget.dart';
import 'package:weather_app/res/router/pages.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: CustomColors.violet,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 0),
        child: LoadingOverLay(
          showLoadingOnly: true,
          child: Form(
            key: authController.registerFormKey2,
            child: SizedBox(
              width: Get.width,
              child: Center(
                child: ListView(
                  children: [
                    SizedBox(height: 50),
                    CustomImage.asset(
                      'assets/images/cloud.png',
                      height: 120,
                      width: 120,
                    ),
                    SizedBox(height: 25),
                    Center(
                      child: Text(
                        "Sign In Now..!",
                        style: TFonts.interFont(
                          fontSize: 19,
                          color: CustomColors.white,
                          fontWeight: TFontWights.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    CustomTextField.emailTextField(
                      controller: authController.emailController2,
                      hint: "Email",
                      (val) {},
                    ),
                    SizedBox(height: 25),

                    Obx(
                      () => CustomTextField.passwordTextField(
                        controller: authController.passwordController2,

                        (val) {},
                        isVisible: authController.hidePassword2.value,
                        changeVisible: () {
                          authController.hidePassword2.value =
                              !authController.hidePassword2.value;
                        },
                      ),
                    ),
                    SizedBox(height: 30),

                    MainButton(
                      onPressed: () {
                        if (authController.registerFormKey2.currentState!
                            .validate()) {
                          authController.login();
                        }
                      },
                      title: "Sign In",

                      backgroundColor: CustomColors.blueee,
                      height: 33,
                      width: Get.width * 0.3,
                      withShadow: false,
                    ),

                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create An Account-",
                          style: TFonts.montFont(
                            fontSize: 14,
                            color: CustomColors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(CustomPage.registerPage);
                          },
                          child: Text(
                            "Sign Up",
                            style: TFonts.montFont(
                              fontSize: 14,
                              color: CustomColors.lightRED,
                              textDecoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
