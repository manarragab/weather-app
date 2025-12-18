import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/data/remote_data/firebase/firebase_data.dart';
import 'package:weather_app/data/remote_data/firebase/firebase_services.dart';
import 'package:weather_app/features/auth/domain/controller/auth_controller.dart';
import 'package:weather_app/res/loading/loading_overlay_widget.dart';

import '../custom_mixin/mixen_widgets/status_error.dart';

class MainGetxController extends GetxController {
  StatusError statusError = StatusError();
  Timer? t;

  AuthController get authController => Get.find<AuthController>();
  LoadingGetxController get loadingGetxController =>
      Get.find<LoadingGetxController>();

  FirebaseData? userDataa;
  Future<bool> loadCurrentUser() async {
    userDataa = await FirebaseServices().getCurrentUser();
    update();
    return userDataa != null;
  }

  void setUser(FirebaseData user) {
    userDataa = user;
    update();
  }

  Future<bool> get isLogin => loadCurrentUser();
  FirebaseData? get user => userDataa;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
    loadCurrentUser();
  }

  //themes

  bool isDark = false;

  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('isDark') ?? false;
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    update();
  }

  void toggleTheme(bool value) async {
    isDark = value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    update();
  }

//-------------------------------------

  customDebounce({
    Duration duration = const Duration(milliseconds: 500),
    required Function() getData,
  }) {
    if (t == null) {
      sPrint.info('timer:: t == null');
      t = Timer(duration, () {
        getData();
      });
    } else if (t!.isActive) {
      sPrint.info('timer:: t!.isActive');
      t!.cancel();
      t = Timer(duration, () {
        getData();
      });
    } else {
      sPrint.info('timer:: else');
      t!.cancel();
      t = Timer(duration, () {
        getData();
      });
    }
  }
}

enum LoadingType { show, hide, error, progress, loadingIcon }

class LoadingGetxController extends GetxController {
  LoadingType loadingType = LoadingType.hide;

  String progress = '0.0 %';

  bool get isLoading =>
      loadingType != LoadingType.hide || loadingType != LoadingType.error;

  setProgress(String progress) {
    this.progress = progress;
    update([loadingID]);
  }

  showProgress() {
    loadingType = LoadingType.progress;
    update([loadingID]);
  }

  showLoadingIcon() {
    loadingType = LoadingType.loadingIcon;
    update([loadingIconID]);
  }

  showLoading() {
    sPrint.info('start loading');
    loadingType = LoadingType.show;
    update([loadingID]);
  }

  showCustomLoading(String id) {
    sPrint.info('start loading');
    loadingType = LoadingType.show;
    update([id]);
  }

  hideCustomLoading(String id) {
    sPrint.info('end loading');
    loadingType = LoadingType.hide;
    update([loadingID, loadingIconID, id]);
  }

  Future hideLoading() async {
    sPrint.info('end loading');
    loadingType = LoadingType.hide;
    update([loadingID, loadingIconID]);
  }

  showError() {
    sPrint.info('show error');
    loadingType = LoadingType.error;
    update([loadingID, loadingIconID]);
  }
}
