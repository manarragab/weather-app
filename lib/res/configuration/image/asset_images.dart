import 'package:weather_app/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' as svg;

class CustomImageAsset extends StatelessWidget {
  CustomImageAsset({
    required this.path,
    this.height = 100,
    this.width = 100,
    this.fit = BoxFit.fill,
    Key? key,
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor = Colors.white,
    this.color,
  }) : super(key: key);
  dynamic path;
  double height;
  double width;
  BoxFit fit;
  BorderRadius borderRadius;
  Color? backgroundColor;
  Color? color;

  // final String load1 = 'assets/icons/Spinner-1s-200px.gif';
  // final String load2 = 'assets/images/load1.gif';
  // final String load3 = 'assets/images/load2.gif';
  final String load4 = 'assets/lotties/load1.gif';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: isSvgPath(path: path)
          ? Container(
              color: backgroundColor,
              height: height,
              width: width,
              // padding: const EdgeInsets.all(10.0),
              child: svg.SvgPicture.asset(
                "$path",
                fit: fit,
                color: color,
              ),
            )
          : FadeInImage(
              height: height,
              width: width,
              // for loading
              placeholderFit: BoxFit.contain,
              placeholder: AssetImage(load4),
              image: AssetImage(
                "$path",
              ),
              fit: fit,
              imageErrorBuilder: (context, error, st) {
                return Icon(
                  Icons.error,
                  color: CustomColors.primary,
                );
              },
            ),
    );
  }

  bool isSvgPath({String? path = ""}) {
   // sPrint.info('isSVG:${path?.contains('.svg')}: $path');
    return path?.contains('.svg') ?? false;
  }
}
