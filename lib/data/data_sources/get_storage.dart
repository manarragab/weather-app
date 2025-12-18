
import 'package:get_storage/get_storage.dart';

class GetStorageData {
  GetStorage getStorage;

  GetStorageData(this.getStorage);

  final String _user = 'user';
  final String _userChat = 'user_chat';

  removeUser() {
    getStorage.remove(_user);
    getStorage.remove("token");
  }

void init(){
  getStorage = GetStorage();
}
  Future<void> setToken(String token) async {
  await getStorage.write("token", token);
}

String? getToken()  {
  return getStorage.read("token");
}

}
