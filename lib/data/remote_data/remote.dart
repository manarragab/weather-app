import 'package:weather_app/data/models/weather/current_weather.dart';
import 'package:weather_app/data/models/weather/forecast_weather.dart';
import 'package:weather_app/data/remote_data/response_model.dart';

import 'dio_helper.dart';

class Remote {
  final DioHelper _helper;

  Remote(this._helper);

  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "acc55abb96454982be5115327250212";

  Future<ResponseModel<Weather?>> getWeather(String country) async {
    return _helper.get<Weather?>(
      {},
      path: "$baseUrl/current.json?key=$apiKey&q=$country&aqi=no",
      onSuccess: (dynamic data) {
        print("🔥 raw response from backend: $data");
        return ResponseModel(
          status: data['status'] ?? 1,
          message: data['message'] ?? "Success",
          data: data['data'] != null ? Weather.fromJson(data['data']) : null,
        );
      },
      onError: (data) {
        return ResponseModel(status: data.status, message: data.message);
      },
    );
  }

  Future<ResponseModel<List<Forecastday>?>> getForcastWeather(
    String country,
  ) async {
    return _helper.get<List<Forecastday>?>(
      {},
      path: "$baseUrl/forecast.json?key=$apiKey&q=$country&days=7&aqi=no",
      onSuccess: (dynamic data) {
        print("raw response from backend: $data");

        List<Forecastday> list =
            ForecastWeather.fromJson(data['data']).forecast?.forecastday ?? [];
        print("${list.length} lenghththht");
        return ResponseModel(
          status: data['status'] ?? 1,
          message: data['message'] ?? "Success",
          data: list,
        );
      },
      onError: (data) {
        return ResponseModel(status: data.status, message: data.message);
      },
    );
  }
}
