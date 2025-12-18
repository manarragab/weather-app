//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/features/home/domain/case/home_case.dart';
import '../data/data_sources/get_storage.dart';
import '../data/remote_data/dio_helper.dart';
import '../data/remote_data/remote.dart';
import '../data/repositories/data_repositry.dart';
import '../domain_data/repositories/domain_repositry.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // * cases
    sl.registerLazySingleton(() => HomeCase(sl()));


  // * repository
  sl.registerLazySingleton<DomainData>(
      () => DataRepository(storage: sl(), remote: sl() /*, remoteFire: sl()*/));

  //! external
//  sl.registerLazySingleton(() => RemoteFire(FirebaseFirestore.instance));
  sl.registerLazySingleton(() => Remote(DioHelper.init()));
  sl.registerLazySingleton(() => GetStorageData(sl()));
  // * database from local data source
  //sl.registerLazySingleton(() => DBHelper());
  // sl.registerLazySingleton(() => FirebaseFirestore.instance);
  await GetStorage.init();
  final getStorage = GetStorage();
  sl.registerLazySingleton<GetStorage>(() => getStorage);
}
