import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:weather_app/data/const/enums.dart';
import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/features/auth/domain/controller/auth_controller.dart';
import 'package:weather_app/res/configuration/image/pick_image.dart';
import 'package:weather_app/res/configuration/text_field/text_field.dart';
import 'package:weather_app/res/loading/loading_overlay_widget.dart';
import 'package:weather_app/res/router/pages.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: CustomColors.violet,
      //appBar: CustomAppBar.appBar(""),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 0),
        child: LoadingOverLay(
          showLoadingOnly: true,

          child: Form(
            key: authController.registerFormKey,
            child: SizedBox(
              width: Get.width,
              child: Center(
                child: ListView(
                  children: [
                    CustomImage.asset(
                      'assets/images/cloud.png',
                      height: 120,
                      width: 120,
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        "Sign Up Now!",
                        style: TFonts.interFont(
                          fontSize: 19,
                          color: CustomColors.white,
                          fontWeight: TFontWights.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
 GetBuilder<AuthController>(
                      builder: (controller) {
                        return  InkWell(
                            onTap: () async {
                              final pick = await Pick.pickImage(context);
                                print ("imageewee ${authController.image}");

                              if (pick != null) {
                                authController.image = pick;

                                controller.update();
                                print("imageeee ${authController.image}");
                              }
                            },
                            child: Container(
                              height: 130,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: CustomColors.lightPurple,
                                border: Border.all(
                                  color: CustomColors.lightRED,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: authController.image == null
                                    ? Center(child: Text("Upload Image"))
                                    : Image.file(
                                        authController.image ?? File(""),
                                        fit: BoxFit.cover,
                                        width: Get.width,
                                      ),
                              ),
                            ),
                          );
                      },
                        ),
                      
                    

                    SizedBox(height: 15),

                    CustomTextField.nameTextField(
                      controller: authController.nameController,
                      hint: "First name , Last name",
                      (val) {},
                    ),

                    SizedBox(height: 15),

                    CustomTextField.emailTextField(
                      controller: authController.emailController,
                      hint: "Email",
                      (val) {},
                      prefixIcon: Icon(Icons.email),
                    ),
                    SizedBox(height: 15),

                    CustomTextField.phoneTextField(
                      controller: authController.phoneController,
                      hint: "phone number",

                      (val) {},
                      prefixIcon: Icon(Icons.email),
                    ),
                    SizedBox(height: 15),
                    CustomTextField.selectDropDown(
                      onChanged: (val) {
                        authController.selectedCountry = val;
                        print(
                          "Selected Country: ${authController.selectedCountry}",
                        );
                      },

                      hint: "Country",
                      allData: Country.values.map((e) => e.name).toList(),
                      // allData: Country.values.toList(),
                      getValue: (val) {
                        return val;
                      },
                    ),
                    SizedBox(height: 15),

                    Obx(
                      () => CustomTextField.passwordTextField(
                        controller: authController.passwordController,

                        (val) {},
                        isVisible: authController.hidePassword1.value,
                        changeVisible: () {
                          authController.hidePassword1.value =
                              !authController.hidePassword1.value;
                        },
                      ),
                    ),

                    //         Obx(()=>
                    //         CustomTextField.passwordTextField(
                    //           controller: authController.confirmPasswordController,
                    //               hint: "Confirm Password",
                    //               (val){},
                    //               isVisible: authController.hidePassword2.value,
                    //               changeVisible: (){
                    // authController.hidePassword2.value = !authController.hidePassword2.value;
                    //               },
                    //             ),
                    //         )    ,
                    SizedBox(height: 30),

                    MainButton(
                      onPressed: () {
                        if (authController.registerFormKey.currentState!
                            .validate()) {
                          authController.register();
                        }

                      },
                      title: "Sign Up",

                      backgroundColor: CustomColors.blueee,
                      height: 33,
                      width: Get.width * 0.3,
                      withShadow: false,
                    ),

                    SizedBox(height: 30),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(CustomPage.loginPage);
                        },
                        child: Text(
                          "Sign In",
                          style: TFonts.josefinFont(
                            fontSize: 12,
                            color: CustomColors.textDark,
                          ),
                        ),
                      ),
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






  // GetBuilder<AlarmController>(builder: (logic) {
  //                   return GestureDetector(
  //                     onTap: () async {
  //                       final pickedFile = await Pick.pickImage(context);
  //                       if (pickedFile != null) {
  //                         controller.postAlarm.image = pickedFile;
  //                         controller.imageUrl = null;
  //                         controller.update();
  //                       }
  //                     },
  //                     child: Stack(
  //                       children: [
  //                         Container(
  //                           width: 382,
  //                           height: 306.17,
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(10),
  //                             border: Border.all(
  //                                 width: 0.5, color: CustomColors.lightBlue2),
  //                           ),
  //                           child: ClipRRect(
  //                             borderRadius: BorderRadius.circular(10),
  //                             child: controller.postAlarm.image != null
  //                                 ? Image.file(controller.postAlarm.image!,
  //                                     fit: BoxFit.cover)
  //                                 : controller.imageUrl != null
  //                                     ? Image.network(controller.imageUrl!,
  //                                         fit: BoxFit.cover)
  //                                     : Image.asset("assets/images/cheker.png",
  //                                         fit: BoxFit.cover),
  //                           ),
  //                         ),
  //                         if (controller.postAlarm.image == null && controller.imageUrl==null )
  //                           Positioned.fill(
  //                             child: Center(
  //                               child: Column(
  //                                 mainAxisSize: MainAxisSize.min,
  //                                 children: [
  //                                   SvgPicture.asset("assets/svg/camera.svg",
  //                                       width: 45, height: 40),
  //                                   const SizedBox(height: 8),
  //                                   Text(CustomTrans.addPhoto.tr,
  //                                       style: GoogleFonts.almarai(
  //                                           fontSize: 16,
  //                                           color: CustomColors.darkBlue2,
  //                                           fontWeight: FontWeight.w700)),
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                       ],
  //                     ),
  //                   );
  //                 }),