import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs();

  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setData({required String key, required value}) async {
    switch (value.runtimeType) {
      case String:
        await _sharedPreferences.setString(key, value);
        return true;
      case bool:
        await _sharedPreferences.setBool(key, value);
        return true;
      case int:
        await _sharedPreferences.setInt(key, value);
        return true;
      case double:
        await _sharedPreferences.setDouble(key, value);
        return true;
      case const (List<String>):
        await _sharedPreferences.setStringList(key, value);
        return true;
    }
    return false;
  }

  dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  dynamic getUserData({required String key}) {
    return _sharedPreferences.get(key);
  }

  String get name => getData(key: 'name') ?? "name unknown";

  String get email => getData(key: 'email') ?? "email unknown";

  String get location => getData(key: 'location') ?? "location unknown";

  String get photoId => getData(key: 'photoId') ?? "";

  String get username => getData(key: 'username') ?? "username unknown";

  String get phoneNumber => getData(key: 'phoneNumber') ?? "phone unknown";

  String get userType => getData(key: 'userType') ?? "user type unknown";

  String get token => getData(key: 'token') ?? "";

  String get lat => getData(key: 'lat') ?? "30.989779";

  String get long => getData(key: 'long') ?? "27.207383";

  void deleteData({required String key}) {
    _sharedPreferences.remove(key);
  }

  void clearData() {
    _sharedPreferences.clear();
  }
}