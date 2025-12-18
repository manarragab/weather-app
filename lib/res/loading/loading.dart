import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as kit;
import 'package:weather_app/res/configuration/color.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const spinkit = kit.SpinKitRotatingCircle(
  color: CustomColors.white,
  size: 30.0,
);

const Widget waveKit = kit.SpinKitWave(
  color: CustomColors.orange,
  size: 30.0,
);



const threeBounce = kit.SpinKitThreeBounce(
  color: CustomColors.white,
  size: 30,
);

class CustomLoadingAnimation {
  final Widget spinKitChasingDots = SpinKitChasingDots(color: CustomColors.primary, size: 50.0);
  final Widget spinKitCircle = SpinKitCircle(color: CustomColors.primary, size: 50.0);
  final Widget spinKitCubeGrid = SpinKitCubeGrid(color: CustomColors.primary, size: 50.0);
  final Widget spinKitDualRing = SpinKitDualRing(color: CustomColors.primary, size: 50.0);
  final Widget spinKitFadingCube = SpinKitFadingCube(color: CustomColors.primary, size: 50.0);
  final Widget spinKitFadingFour = SpinKitFadingFour(color: CustomColors.primary, size: 50.0);
  final Widget spinKitFadingGrid = SpinKitFadingGrid(color: CustomColors.primary, size: 50.0);
  final Widget spinKitFadingCircle = SpinKitFadingCircle(color: CustomColors.primary, size: 50.0);
  final Widget spinKitFoldingCube = SpinKitFoldingCube(color: CustomColors.primary, size: 50.0);
  final Widget spinKitHourGlass = SpinKitHourGlass(color: CustomColors.primary, size: 50.0);
  final Widget spinKitPouringHourGlass = SpinKitPouringHourGlass(color: CustomColors.primary, size: 50.0);
  final Widget spinKitPouringHourGlassRefined = SpinKitPouringHourGlassRefined(color: CustomColors.primary, size: 50.0);
  final Widget spinKitPumpingHeart = SpinKitPumpingHeart(color: CustomColors.primary, size: 50.0);
  final Widget spinKitPulse = SpinKitPulse(color: CustomColors.primary, size: 50.0);
  final Widget spinKitPulsingGrid = SpinKitPulsingGrid(color: CustomColors.primary, size: 50.0);
  final Widget spinKitRing = SpinKitRing(color: CustomColors.primary, size: 50.0);
  final Widget spinKitRipple = SpinKitRipple(color: CustomColors.primary, size: 50.0);
  final Widget spinKitRotatingCircle = SpinKitRotatingCircle(color: CustomColors.primary, size: 50.0);
  final Widget spinKitRotatingPlain = SpinKitRotatingPlain(color: CustomColors.primary, size: 50.0);
  final Widget spinKitSpinningCircle = SpinKitSpinningCircle(color: CustomColors.primary, size: 50.0);
  final Widget spinKitSpinningLines = SpinKitSpinningLines(color: CustomColors.primary, size: 50.0);
  final Widget spinKitThreeBounce = SpinKitThreeBounce(color: CustomColors.primary, size: 50.0);
  final Widget spinKitThreeInOut = SpinKitThreeInOut(color: CustomColors.primary, size: 50.0);
  final Widget spinKitWave = SpinKitWave(color: CustomColors.primary, size: 50.0);
  final Widget spinKitWanderingCubes = SpinKitWanderingCubes(color: CustomColors.primary, size: 50.0);


}
