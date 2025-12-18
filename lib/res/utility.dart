/*
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';


class Utility {
  static Image imageFromBase64String(String base64String) {
    if (base64String != null) {
      return Image.memory(
        base64Decode(base64String),
        fit: BoxFit.fill,
      );
    }
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static String ChangeDataTime(DateTime date) {
    return '${date.day}/${date.month}/${date.year} - ${date.hour}:${date
        .minute}:${date.second}';
  }

 static Future<File> getImageFileFromAssets(AssetImage path) async {
    final byteData = await rootBundle.load("images/g1.JPG");
    File file = File('${(await getTemporaryDirectory()).path}/${path.assetName}');
   await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }

}
*/
