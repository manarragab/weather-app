
import 'package:weather_app/data/models/weather/current_weather.dart';
import 'package:weather_app/data/models/weather/forecast_weather.dart';
import 'package:weather_app/data/remote_data/response_model.dart';


abstract class DomainData {
  /*
  * this is abstract class to connect your features with data package
  * it will contain methods of all project
  * need to add comment for name of features for all it's methods
  * example::
  * // login feature
  * => loginMethod();
  * => another method();
   */

  // login feature

  // firebase
// Future<bool> checkFirebase();

  // api

/*
  * this is abstract class to connect your features with data package
  * it will contain methods of all project
  * need to add comment for name of features for all it's methods
  * example::
  * // login feature
  * => loginMethod();
  * => another method();
   */

  // login feature

  // api

//  Future<dynamic> login(String phone, String password);


  ///----------------------------------- team -----------------------------

  // get storage


  String? getToken();

  setToken(String? token);
  
  //Future<ResponseModel<dynamic>> getCode(String phone);


  Future<ResponseModel<Weather?>> getWeather(String country);

  Future<ResponseModel<List<Forecastday>?>> getForcastWeather(String country);


}
