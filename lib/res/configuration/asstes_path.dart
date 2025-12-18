// all image file start with im

//all icons files start with ico

import 'package:weather_app/data/remote_data/core.dart';
import 'package:flutter/material.dart';

class CustomIcon {
  static const String imRegisterScreenSvg =
      'assets/icons/Personalization-amico.svg';
  static const String imLoginScreenSvg = 'assets/icons/Mobile login-pana.svg';
  static const String imEmptySvg = 'assets/svg/nodata';
  static const String whatsAppSvg = "assets/icons/what'sApp.svg";
  static const String backgroundLesson = "assets/images/background.jpg";
  static final String defaultLogo = initData.icon;

  static const _kFontFam = 'CustomIcon';
  static const String? _kFontPkg = null;

  static const IconData profile =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData courses =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData home =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  static String fullLogo = "assets/svg/full_logo.svg";
  static String greyPol = "assets/svg/polygon_grey.svg";
  static String accentPol = "assets/svg/polygon_accent.svg";
  static String station = "assets/images/station.png";
  static String drop = "assets/svg/drop.svg";
  static String homeSvg = "assets/svg/home.svg";
  static String contact = "assets/svg/contact_us.svg";
  static String branches = "assets/svg/branches.svg";
  static String aboutUs = "assets/svg/about_us.svg";
  static String smallLogo = "assets/svg/splash.svg";
  static String more = "assets/svg/more.svg";
  static String chooseLangBackground = "assets/svg/choose_lang_background.svg";
  static String notificationsIcon = "assets/svg/notifications.svg";
}
