import 'package:weather_app/data/const/export.dart';

class CustomPadding {
  static Widget get height => const SizedBox(
        height: 10,
      );

  static Widget get smallHeight => const SizedBox(
        height: 5,
      );

  static Widget get heightButton => const SizedBox(
        height: 20,
      );

  static Widget get width => const SizedBox(
        width: 10,
      );

  static const double radius = 40;

  static double paddingTop(BuildContext context) {
    return MediaQuery.of(context).padding.top + 90;
  }
}
