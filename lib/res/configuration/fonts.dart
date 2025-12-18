import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class TFonts {

   static kavoonFont(
          {Color? color,
          FontWeight fontWeight = TFontWights.regular,
          double fontSize = 12}) =>
      GoogleFonts.kavoon(
          color: color ?? CustomColors.textDark,
          fontWeight: fontWeight,
          fontSize: fontSize);

 static  interFont(
          {Color? color,
          FontWeight fontWeight = TFontWights.regular,
          double fontSize = 12}) =>
      GoogleFonts.inter(
          color: color ?? CustomColors.textDark,
          fontWeight: fontWeight,
          fontSize: fontSize);


 static  josefinFont(
          {Color? color,
          FontWeight fontWeight = TFontWights.regular,
          double fontSize = 12}) =>
      GoogleFonts.josefinSans(
          color: color ?? CustomColors.textDark,
          fontWeight: fontWeight,
          fontSize: fontSize);




  static get titleBoard => style(
      color: CustomColors.black, fontWeight: FontWeight.w700, fontSize: 24);

  static get bodyBoard => style(
        color: CustomColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.5,
      );

  static cardBody(
          {Color? color,
          FontWeight fontWeight = TFontWights.regular,
          double fontSize = 12}) =>
      style(
          color: color ?? CustomColors.textDark,
          fontWeight: fontWeight,
          fontSize: fontSize);

  static orderCardBody(
          {Color? color,
          FontWeight fontWeight = TFontWights.regular,
          double fontSize = 12}) =>
      style(
          color: color ?? CustomColors.textDark,
          fontWeight: fontWeight,
          fontSize: fontSize);


           

  static floatActionButtonStyle(
          {Color? color,
          FontWeight fontWeight = TFontWights.regular,
          double fontSize = 10}) =>
      style(
          color: color ?? CustomColors.textDark,
          fontWeight: fontWeight,
          fontSize: fontSize);

  static appBarTitle(
          {Color? color,
          FontWeight fontWeight = TFontWights.bold,
          double fontSize = 22}) =>
      style(
          color: color ?? CustomColors.black,
          fontWeight: fontWeight,
          fontSize: fontSize);

  static TextStyle get textBigTitle => style(
      color: CustomColors.textDark,
      fontWeight: TFontWights.bold,
      fontSize: TFontSizes.f16);

  static TextStyle get mainButton =>
      style(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

  /// title
  static textTitleStyle(
          {Color? color, FontWeight? fontWeight, double fontSize = 18}) =>
      style(
          color: color ?? CustomColors.black,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontSize: fontSize);

  static get textTitleStylePrimary => style(
      color: CustomColors.black,
      fontWeight: FontWeight.w600,
      fontSize: TFontSizes.f18);

  static get textAppBarTitleStyle => style(
      color: CustomColors.white,
      fontWeight: TFontWights.bold,
      fontSize: TFontSizes.f22);

  static textTitleWhiteStyle(
          {Color color = CustomColors.white,
          FontWeight fontWeight = TFontWights.regular,
          double fontSize = 18}) =>
      style(color: color, fontWeight: fontWeight, fontSize: fontSize);

  /// body
  static get textBodyWhiteStyle => style(
      color: CustomColors.white,
      fontWeight: TFontWights.regular,
      fontSize: TFontSizes.f14);

  static get textBodyStyle => style(
      color: CustomColors.green,
      fontWeight: FontWeight.w600,
      fontSize: TFontSizes.f12);

  static get textBodyStyleDark => style(
      color: CustomColors.textDark,
      fontWeight: TFontWights.regular,
      fontSize: TFontSizes.f16);

  static get textAppBarTabsStyle => style(
      color: CustomColors.primary,
      fontWeight: TFontWights.bold,
      fontSize: TFontSizes.f18);

  static get buttonStyleWhite => style(
      color: CustomColors.white,
      fontWeight: TFontWights.bold,
      fontSize: TFontSizes.f16);

  static TextStyle segoeUi({
    Color? color,
    double? fontSize,
    // FontsFamilies? fontsFamilyType,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.almarai(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle style({
    Color color = Colors.black,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.almarai(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );
  }


static TextStyle montFont({
    Color color = Colors.black,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
    TextDecoration? textDecoration,
  }) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize ?? 12,
      fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing,
      height: height,
      decoration: textDecoration,
    );
  }

}

class TFontSizes {
  static const double f6 = 6;
  static const double f8 = 8;
  static const double f10 = 10;
  static const double f12 = 12;
  static const double f13 = 13;
  static const double f14 = 14;
  static const double f16 = 16;
  static const double f18 = 18;
  static const double f20 = 20;
  static const double f22 = 22;
  static const double f26 = 26;
}

class TFontWights {
  static const FontWeight light = FontWeight.w200;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w600;
  static const FontWeight extraBold = FontWeight.bold;
}
