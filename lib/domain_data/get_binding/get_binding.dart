import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/data/remote_data/firebase/firebase_services.dart';
import 'package:weather_app/features/auth/domain/controller/auth_controller.dart';
import 'package:weather_app/features/home/domain/controller/home_controller.dart';
import 'package:weather_app/features/splash/domain/controller/splash_controller.dart';

class GetBinding extends Bindings {
  @override
  void dependencies() {
    // Put permanent instances first
    Get.put(LoadingGetxController(), permanent: true);
    Get.put(AuthController(firebaseServices: FirebaseServices()), permanent: true);

    // Controllers that depend on the above
    Get.put(MainGetxController(), permanent: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }

}
