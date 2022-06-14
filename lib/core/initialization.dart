import 'package:egolden/core/services/cache/locale_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:url_strategy/url_strategy.dart';

Future initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.instance.prefrencesInit();
  setPathUrlStrategy();
}

Future initData() async {}
