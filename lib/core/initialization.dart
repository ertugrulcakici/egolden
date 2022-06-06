import 'package:egolden/core/services/cache/locale_manager.dart';
import 'package:flutter/widgets.dart';

Future initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.instance.prefrencesInit();
}

Future initData() async {}
