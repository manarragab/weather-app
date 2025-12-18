//import 'package:flutter_config/flutter_config.dart';

import 'dart:ui';

import '../../res/configuration/print_types.dart';

class MainData {
  String server = '';
  String icon = 'assets/svg/s.svg';

  String title = '';

  Color? color;

  MainData({this.server = '', this.icon = '', this.title = '', this.color});
}

MainData initData = MainData(icon: "assets/svg/logo_with_background.svg");

String apiUrl() {
  return 'https://accessories-eshop.runasp.net/api';
}

String getPath(String url) {
  String data = url;
  if (url.contains('http')) {
    sPrint.info('data;::: $data');
    return url;
  } else {
    data = "${apiUrl()}/$url";
    sPrint.info('data;:::: $data');
    return data;
  }
}

String imageDomain() {
  // for develop
  /* if(kDebugMode){
    return 'http://0.0.0.0:8080';
  }*/

// for prod
  return 'http://171.163.205.92.host.secureserver.net';
}

enum PathType { image, pdf, video, noPath, none }

getAllImagePath(String path) {
  String type = path.split('.').last;
  PathType pathType = PathType.none;
  for (var element in filesType) {
    if (type.toUpperCase() == element.exstension) {
      pathType = element.pathType;
    }
  }
  return pathType;
}

final List<Types> filesType = [
  Types(pathType: PathType.image, exstension: 'JPEG'),
  Types(pathType: PathType.image, exstension: 'JPG'),
  Types(pathType: PathType.image, exstension: 'PNG'),
  Types(pathType: PathType.image, exstension: 'GIF'),
  Types(pathType: PathType.pdf, exstension: 'PDF'),
  Types(pathType: PathType.video, exstension: 'WEBM'),
  Types(pathType: PathType.video, exstension: 'MPG'),
  Types(pathType: PathType.video, exstension: 'MP2'),
  Types(pathType: PathType.video, exstension: 'MPEG'),
  Types(pathType: PathType.video, exstension: 'MPE'),
  Types(pathType: PathType.video, exstension: 'MPV'),
  Types(pathType: PathType.video, exstension: 'OGG'),
  Types(pathType: PathType.video, exstension: 'MP4'),
  Types(pathType: PathType.video, exstension: 'M4P'),
  Types(pathType: PathType.video, exstension: 'M4V'),
  Types(pathType: PathType.video, exstension: 'AVI'),
  Types(pathType: PathType.video, exstension: 'WMV'),
  Types(pathType: PathType.video, exstension: 'MOV'),
  Types(pathType: PathType.video, exstension: 'QT'),
  Types(pathType: PathType.video, exstension: 'FLV'),
  Types(pathType: PathType.video, exstension: 'SWF'),
  Types(pathType: PathType.video, exstension: 'AVCHD'),
];

class Types {
  PathType pathType;
  String exstension;

  Types({required this.pathType, required this.exstension});
}

// const String demoImage =
//     "https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=1060&t=st=1663057534~exp=1663058134~hmac=d7ae7a20d2d7dc90ef73ae751ead106ad9063d48bf23cd180b6db9a817ee3496";


const String demoImage="https://cdn.weatherapi.com/weather/64x64/day/116.png";