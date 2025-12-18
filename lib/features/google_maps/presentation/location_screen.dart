// import 'dart:async';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:weather_app/data/const/export.dart';

// class LocationScreen extends StatefulWidget {
//   const LocationScreen({super.key});

//   // to edit on style google map
//   //make json style in assets folder
//   //got to chrome => style google maps wizard
//   //choose json file

//   @override
//   State<LocationScreen> createState() => LocationScreenState();
// }

// class LocationScreenState extends State<LocationScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _checkLocationPermission();
//     setMapStyle();
//   }

//   bool locationPermissionGranted = false;

//   Future<void> _checkLocationPermission() async {
//   var status = await Permission.location.status;

//   if (status.isDenied || status.isRestricted) {
//     status = await Permission.location.request();
//   }

//   if (status.isGranted) {
//     setState(() {
//       locationPermissionGranted = true;
//     });
//   } else {
//     setState(() {
//       locationPermissionGranted = false;
//     });
//     Get.snackbar("Location Permission", "Please enable location");
//   }
// }


//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(30.903402, 31.001845), //el gharbia
//     zoom: 15,
//   );

//   String styling = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      body: GoogleMap(
//   style: styling,
//   mapType: MapType.hybrid,
//   initialCameraPosition: _kGooglePlex,
//   myLocationEnabled: true,
//   myLocationButtonEnabled: true,
//   compassEnabled: true,
//   zoomControlsEnabled: true,
//   onMapCreated: (GoogleMapController controller) {
//     _controller.complete(controller);
//     setMapStyle();
//   },
// ),

//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           moveToCaira();
//         },
//         tooltip: "move to cairo",
//         backgroundColor: CustomColors.blueee,
//       ),
//     );
//   }

//   void moveToCaira() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: LatLng(29.992238, 31.746533), //el cairo
//           zoom: 15,
//         ),
//       ),
//     );
//   }

// void  setMapStyle() async {
//     String style = await DefaultAssetBundle.of(
//       context,
//     ).loadString("assets/map_style.json");

//     setState(() {
//       styling = style;
//     });
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(30.0, 31.0),
    zoom: 6,
  );

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    try {
      // Check permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        Get.snackbar("خطأ", "من فضلك اسمح بالوصول للموقع");
        return;
      }

      // Get location
      Position position = await Geolocator.getCurrentPosition();

      // Move camera
      final controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(position.latitude, position.longitude),
          17,
        ),
      );
    } catch (e) {
      Get.snackbar("خطأ", "تعذر تحديد الموقع");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (controller) => _controller.complete(controller),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getUserLocation,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}