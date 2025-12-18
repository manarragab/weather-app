import 'package:weather_app/data/models/weather/current_weather.dart';
import 'package:weather_app/data/models/weather/forecast_weather.dart';
import 'package:weather_app/data/remote_data/response_model.dart';
import 'package:weather_app/domain_data/repositories/domain_repositry.dart';

class HomeCase {
  
  final DomainData _data;

  HomeCase(this._data);

  Future<ResponseModel<Weather?>> getWeather(String country) {
    return _data.getWeather(country);
  }

  Future<ResponseModel<List<Forecastday>?>> getForcastWeather(String country) {
    return _data.getForcastWeather(country);
  }



}