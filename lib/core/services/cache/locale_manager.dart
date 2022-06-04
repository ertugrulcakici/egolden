import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init();

  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }
}
