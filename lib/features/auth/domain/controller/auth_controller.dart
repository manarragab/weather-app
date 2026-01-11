import 'dart:async';
import 'dart:io';
import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/data/remote_data/firebase/firebase_data.dart';
import 'package:weather_app/data/remote_data/firebase/firebase_services.dart';
import 'package:weather_app/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:weather_app/features/home/domain/controller/home_controller.dart';
import 'package:weather_app/res/router/pages.dart';

class AuthController extends MainGetxController with CustomStateMixin {
   final FirebaseServices firebaseServices;

  AuthController({required this.firebaseServices});

  final hidePassword1 = true.obs;
  final hidePassword2 = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController emailController2 = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final registerFormKey = GlobalKey<FormState>();
  final registerFormKey2 = GlobalKey<FormState>();

  String? selectedCountry;

  //final FirebaseServices firebaseServices = FirebaseServices();
  FirebaseData? currentUser;
  File? image;
  File? imageProf;
  String? newImage;
  FirebaseData? data;

 final homController=Get.put(HomeController());
  Future<void> register() async {
    loadingGetxController.showLoading();
    print("--------------- Selected image file: $image");

  FirebaseData?  data = await firebaseServices.register(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phone: phoneController.text,
      country: selectedCountry,
      profileImageFile: image,
    );

    print("Profile image from returned data: ${data?.profileImage}");

    if (data != null) {
      currentUser = data;
      userDataa = data;
      setUser(data);
      update();
      print(
        "Current user profile image: ${currentUser?.profileImage}",
      );
      print("User dataa profile image: ${userDataa?.profileImage}");
       await homController.getALLData();
      Get.offAllNamed(CustomPage.mainPage);
    } else {
      print("Registration failed - data is null");
    }

    loadingGetxController.hideLoading();
  }

  //FirebaseData? get myUser=> userDataa;

  Future<void> login() async {
    loadingGetxController.showLoading();

    FirebaseData? data = await firebaseServices.login(
      email: emailController2.text,
      password: passwordController2.text,
    );

    if (data != null) {
      currentUser = data;
      setUser(data);
      update();
     await homController.getALLData();
      Get.offAllNamed(CustomPage.mainPage);
    }

    loadingGetxController.hideLoading();
  }

  Future<void> logout() async {
    await firebaseServices.logout();
    Get.offAllNamed(CustomPage.registerPage);
  } 

Future<String> changeProfileImage(File picked) async {
  loadingGetxController.showLoading();
 final String changedUrl = await firebaseServices.changeProfileImage(picked);
 update();
  loadingGetxController.hideLoading();
 newImage = changedUrl;
 return newImage!;
 
} 
  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    phoneController.clear();
    selectedCountry = null;
    image = null;
  }
}
