import 'package:weather_app/res/configuration/image/asset_images.dart';
import 'package:weather_app/res/configuration/image/network_images.dart';
import 'package:flutter/material.dart';

class CustomImage {
  static Widget network(
    String path, {
    double height = 100,
    double width = 100,
    BoxFit fit = BoxFit.contain,
    BorderRadius borderRadius = BorderRadius.zero,
    Color backgroundColor = Colors.transparent,
    Color? color,
    Widget? onError,
    EdgeInsets? padding,
  }) {
    return CustomImageNetwork(
      path: path,
      height: height,
      width: width,
      fit: fit,
      backgroundColor: backgroundColor,
      color: color,
      borderRadius: borderRadius,
      onError: onError,
      padding: padding,
    );
  }

  static Widget asset(
    String path, {
    double height = 100,
    double width = 100,
    BoxFit fit = BoxFit.contain,
    BorderRadius borderRadius = BorderRadius.zero,
    Color backgroundColor = Colors.transparent,
    Color? color,
  }) {
    return CustomImageAsset(
      path:path,
      height: height,
      width: width,
      fit: fit,
      backgroundColor: backgroundColor,
      color: color,
    );
  }
}
