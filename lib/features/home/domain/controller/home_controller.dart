import 'dart:async';
import 'dart:io';
import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/data/models/weather/current_weather.dart';
import 'package:weather_app/data/models/weather/forecast_weather.dart';
import 'package:weather_app/data/remote_data/response_model.dart';
import 'package:weather_app/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weather_app/features/home/domain/case/home_case.dart';

class HomeController extends MainGetxController with CustomStateMixin {
  RefreshController refreshController = RefreshController();

  var now = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    //     WidgetsBinding.instance.addPostFrameCallback((_) {
    // getALLData();
    //     });
    loadCurrentUser();
    userDataa;
    Timer.periodic(const Duration(seconds: 1), (_) {
      now.value = DateTime.now();
    });
  }

  Weather? weather;

  Future<void> getWeather() async {
    loadingGetxController.showLoading();
    final response = await sl<HomeCase>().getWeather(
      authController.selectedCountry ?? "Egypt",
    );
    print("📙 ResponseModel data: ${response.toJson()}");
    loadingGetxController.hideLoading();

    if (response.data != null) {
      weather = response.data!;
    } else {
      print("❌ Failed to loaddd ${response.message}");
    }
    update();
  }

  Future<void> getALLData() async {
    loadingGetxController.showLoading();
    final result1 = await sl<HomeCase>().getWeather(
      authController.selectedCountry ?? "Egypt",
    ); // Future<ResponseModel<Weather>>
    final result2 = await sl<HomeCase>().getForcastWeather(
      authController.selectedCountry ?? "Egypt",
    ); // Future<ResponseModel<List<Forecastday>>>
    loadingGetxController.hideLoading();

    if (result2.data != null && result1.data != null) {
      weather = result1.data!;
      forecastWeather = result2.data!;
      print("📙 forecast: ${forecastWeather?.first.date}");
      print("📙 weather: ${weather?.current?.windchillC}");
      update();
    }
  }

  List<Forecastday>? forecastWeather;

  Future<void> onRefresh() async {
    final result = await refreshDataMulti(
      futureMethods: () => [
        sl<HomeCase>().getWeather(
          authController.selectedCountry ?? "Egypt",
        ), // Future<ResponseModel<Weather>>
        sl<HomeCase>().getForcastWeather(
          authController.selectedCountry ?? "Egypt",
        ), // Future<ResponseModel<List<Forecastday>>>
      ],
      controller: refreshController,
      checkIfEmpty: (list) {
        if (list.isEmpty) {
          return ResponseModel(status: 0, message: "No Data", data: null);
        }
        return ResponseModel(status: 1, message: "Done", data: list);
      },
    );

    if (result.isNotEmpty) {
      weather = result.entries.first.value;
      forecastWeather = result.entries.last.value;
      print("📙 forecast: ${forecastWeather?.first.date}");
      print("📙 weather: ${weather?.current?.windchillC}");
      update();
    }
  }

  Future<void> getForcastWeather() async {
    loadingGetxController.showLoading();
    final response = await sl<HomeCase>().getForcastWeather(
      authController.selectedCountry ?? "Egypt",
    );
    print("📙 ResponseModel data: ${response.toJson()}");
    loadingGetxController.hideLoading();
    if (response.data != null) {
      forecastWeather = response.data!;
      print("lengthhhhhhhh ${response.data!.length}");
    } else {
      print("❌ Failed to loaddd ${response.message}");
    }
    update();
  }

  var chooseLang = "".obs;
  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  File? image;
}
