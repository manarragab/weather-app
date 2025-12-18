import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/res/generate_material_color.dart';
import 'package:google_fonts/google_fonts.dart';

class Context {
  BuildContext context;

  Context(this.context);

  static ThemeData getLightThemeData() {
    return ThemeData(
      // main colors of the app
      useMaterial3: false,
      primaryColor: CustomColors.primary,
      primaryColorLight: CustomColors.primaryOpacity70,
      disabledColor: CustomColors.grey,
      scaffoldBackgroundColor: CustomColors.backgroundScaffold,
      iconTheme: IconThemeData(color: CustomColors.fontColor, size: 20.h),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: CardThemeData(
          shape: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColors.lightGrey),
              borderRadius: BorderRadius.circular(10))),
      listTileTheme: ListTileThemeData(
          titleTextStyle: TFonts.style(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
          subtitleTextStyle: TFonts.style(color: Colors.black, fontSize: 14)),
      brightness: Brightness.light,
      dividerColor: Colors.transparent,
      unselectedWidgetColor: CustomColors.grey4,
      platform: TargetPlatform.iOS,
      primarySwatch: generateMaterialColor(CustomColors.primary),
      primaryIconTheme: IconThemeData(
        color: CustomColors.primary,
      ),
      fontFamily: GoogleFonts.almarai().fontFamily,
      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: CustomColors.primary),
        elevation: 0,
        toolbarHeight: 70.h,
        centerTitle: true,
      ),
    );
  }


  static ThemeData getDarkThemeData() {
  return ThemeData(
    useMaterial3: false,
    primaryColor: CustomColors.primary,
    primaryColorLight: CustomColors.primaryOpacity70,
    scaffoldBackgroundColor: Colors.black,     // Background Dark
    disabledColor: CustomColors.grey,
    iconTheme: IconThemeData(color: Colors.white, size: 20.h),
    visualDensity: VisualDensity.adaptivePlatformDensity,

    cardTheme: CardThemeData(
      color: const Color(0xFF1E1E1E),
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: CustomColors.lightGrey),
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    listTileTheme: ListTileThemeData(
      titleTextStyle: TFonts.style(
          color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
      subtitleTextStyle: TFonts.style(color: Colors.white70, fontSize: 14),
    ),

    brightness: Brightness.dark,
    dividerColor: Colors.grey.withOpacity(.2),
    unselectedWidgetColor: CustomColors.grey4,
    platform: TargetPlatform.iOS,
    primarySwatch: generateMaterialColor(CustomColors.primary),

    primaryIconTheme: IconThemeData(color: Colors.white),
    fontFamily: GoogleFonts.almarai().fontFamily,

    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E1E1E),
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      toolbarHeight: 70.h,
      centerTitle: true,
      titleTextStyle:
          TFonts.style(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}


  double getHeight() {
    return MediaQuery.of(context).size.height * 1.h;
  }

  double getWidth() {
    return MediaQuery.of(context).size.width * 1.h;
  }

  ThemeData getTheme() {
    return Theme.of(context);
  }
}
