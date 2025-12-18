
import 'package:weather_app/data/models/weather/current_weather.dart';
import 'package:weather_app/data/models/weather/forecast_weather.dart';
import 'package:weather_app/data/remote_data/response_model.dart';
import '../../domain_data/repositories/domain_repositry.dart';
import '../data_sources/get_storage.dart';
import '../remote_data/remote.dart';

class DataRepository implements DomainData {
  GetStorageData storage;

  // RemoteFire remoteFire;
  Remote remote;

  DataRepository({
    required this.storage,
    required this.remote,
    //  required this.remoteFire,
  });


  @override
 String? getToken() {
   return storage.getToken();
  }

  @override
  setToken(String? token) {
    return storage.setToken(token!);
  }

  @override
  Future<ResponseModel<Weather?>> getWeather(String country) {
    return remote.getWeather(country);  
  }

  @override
  Future<ResponseModel<List<Forecastday>?>> getForcastWeather(String country) {
    return remote.getForcastWeather(country);
  }




  // @override
  // Future<ResponseModel<void>> signOut(PostLogout logout) {
  //   return remote.signOut(logout);
  // }



  // @override
  // Future<ResponseModel> resetPassword({required String password}) {
  //   return remote.resetPassord(password: password);
  // }

}

