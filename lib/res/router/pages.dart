
import 'package:weather_app/features/auth/domain/controller/auth_controller.dart';
import 'package:weather_app/features/auth/presentation/login_screen.dart';
import 'package:weather_app/features/auth/presentation/register_screen.dart';
import 'package:weather_app/features/google_maps/presentation/location_screen.dart';
import 'package:weather_app/features/home/domain/controller/home_controller.dart';
import 'package:weather_app/features/home/presentation/main_screen.dart';
import 'package:weather_app/features/home/presentation/screens_body/home_body.dart';
import 'package:weather_app/features/home/presentation/screens_body/profile_screen.dart';
import 'package:weather_app/features/setting/presentation/setting_screen.dart';
import 'package:weather_app/features/splash/presentation/splash_screen.dart';
import 'package:get/get.dart';

class CustomPage {
  static List<GetPage> pages = [
     GetPage(
        name: splashPage,
        page: () =>  SplashScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
        })),


GetPage(
        name: homePage,
        page: () =>  HomeBody(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
           Get.put(HomeController());  
        })),


GetPage(
        name: registerPage,
        page: () =>  RegisterScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.find<AuthController>().clearControllers();
        })),
    GetPage(
        name: loginPage,
        page: () =>  LoginScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
        })),

         GetPage(
        name: locationPage,
        page: () =>  LocationScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
        })),

  GetPage(
        name: settingPage,
        page: () =>  SettingScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
        })),


    GetPage(
        name: profilePage,
        page: () => ProfileScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
                     Get.put(HomeController());  
        })),

    GetPage(
        name: mainPage,
        page: () => MainScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
                   
        })),

  ];

  
  static String splashPage = '/splash';
  static String registerPage = '/register';
  static String homePage = '/home';
  static String loginPage = '/login';
  static String locationPage = '/location';
  static String settingPage = '/setting';
  static String profilePage = '/profile';
  static String mainPage = '/main';





}