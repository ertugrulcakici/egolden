import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();
  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init();

  Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  bool? getBool(String key) => _preferences!.getBool(key);
  double? getDouble(String key) => _preferences!.getDouble(key);
  int? getInt(String key) => _preferences!.getInt(key);
  String? getString(String key) => _preferences!.getString(key);
  List<String>? getStringList(String key) => _preferences!.getStringList(key);
  dynamic get(String key) => _preferences!.get(key);

  Future<bool> setBool(String key, bool value) async =>
      await _preferences!.setBool(key, value);
  Future<bool> setDouble(String key, double value) async =>
      await _preferences!.setDouble(key, value);
  Future<bool> setInt(String key, int value) async =>
      await _preferences!.setInt(key, value);
  Future<bool> setString(String key, String value) async =>
      await _preferences!.setString(key, value);
  Future<bool> setStringList(String key, List<String> value) async =>
      await _preferences!.setStringList(key, value);

  Future<bool> clear() async => await _preferences!.clear();
  Future<bool> remove(String key) async => await _preferences!.remove(key);

  bool containsKey(String key) => _preferences!.containsKey(key);
}
