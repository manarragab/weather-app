import 'package:weather_app/domain_data/custom_mixin/mixen_widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'configuration/color.dart';
import 'generate_material_color.dart';

class TContext {
  BuildContext context;

  TContext(this.context);

  CustomFooter get customFooter => CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = const Text("Pull up to load more");
          } else if (mode == LoadStatus.loading) {
            body =
                const LoadingWidget(); // Customize your loading indicator here
          } else if (mode == LoadStatus.failed) {
            body = const Text("Load Failed! Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("Release to load more");
          } else {
            body = const Text("No more data");
          }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      );

  static ThemeData getThemeData() {
    return ThemeData(
        primarySwatch: generateMaterialColor(CustomColors.primary),
        canvasColor: Colors.transparent,
        primaryColor: CustomColors.primary,
        scaffoldBackgroundColor: CustomColors.backgroundScaffold,
        dividerColor: CustomColors.white,
        focusColor: CustomColors.white,
        fontFamily: GoogleFonts.almarai().fontFamily,
        listTileTheme: ListTileThemeData(
            selectedColor: CustomColors.selectedTileColor,
            selectedTileColor: CustomColors.selectedTileColor)
        // appBarTheme: AppBarTheme(backgroundColor: Colors.black.withOpacity(0.7))
        );
  }

  double getHeight() {
    return MediaQuery.of(context).size.height;
  }

  double getWidth() {
    return MediaQuery.of(context).size.width;
  }

  ThemeData getTheme() {
    return Theme.of(context);
  }

  Size get getSize => MediaQuery.of(context).size;
}
