import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/features/splash/presentation/splash_screen.dart';
import 'package:weather_app/localization/change_language.dart';
import 'package:flutter/gestures.dart';
import 'data/remote_data/core.dart';
import 'domain_data/get_binding/get_binding.dart';
import 'localization/Translation.dart';
import 'res/configuration/context.dart';
import 'res/router/pages.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MainGetxController controller = Get.put(MainGetxController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(419, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: initData.title,
        theme: Context.getLightThemeData(),
        darkTheme: Context.getDarkThemeData(),
        themeMode: controller.isDark ? ThemeMode.dark : ThemeMode.light,

        // navigatorObservers: [ChuckerFlutter.navigatorObserver],
        initialBinding: GetBinding(),
        translations: Translation(),
        locale: Locale(TLang.getLocalLang().name),
        fallbackLocale: const Locale('en'),
        getPages: CustomPage.pages,
        
     home:  SplashScreen(),
      //  home: MainScreen(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
            child: child ?? const SizedBox(child: CircularProgressIndicator(),),
          );
        },
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('not Found page'),
      ),
    );
  }
}

