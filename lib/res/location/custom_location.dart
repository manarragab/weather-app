/*
import 'dart:math';

import 'package:weather_app/data/const/enums.dart';
import 'package:weather_app/res/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../localization/all_keys.dart';

class CustomLocation {
  Future<Position?> locationPermission(
      Future<Position?> Function() getLocation) async {
    LocationPermission status = await Geolocator.requestPermission();
    if (status == LocationPermission.denied ||
        status == LocationPermission.deniedForever) {
      Future<LocationPermission> second = Geolocator.requestPermission();
      if (status == LocationPermission.denied ||
          status == LocationPermission.deniedForever) {
        askForService();
      } else {
        return getLocation();
      }
    } else {
      return getLocation();
    }
    return null;
  }

  Future<Position?> getLocation() async {
    return locationPermission(() async {
      return await Geolocator.getCurrentPosition();
    });
  }

  askForService() {
    Get.dialog(
        CupertinoAlertDialog(
          title: Text(CustomTrans.locationPermission.tr),
          content: Text(CustomTrans.pleaseActivateLocation.tr),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(CustomTrans.confirm.tr),
              onPressed: () {
                Geolocator.openAppSettings();
              },
            ),
          ],
        ),
        barrierDismissible: false);
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
*/
