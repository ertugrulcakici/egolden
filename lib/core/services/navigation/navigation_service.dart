import "package:flutter/material.dart";

import 'i_navigation_service.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final _removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage(
      {String? title, required String path, Object? data}) async {
    title ??= path.split("/").last;
    // setTitleAndUrl(title, path);
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear(
      {String? title, required String path, Object? data}) async {
    title ??= path.split("/").last;
    // setTitleAndUrl(title, path);
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, _removeAllOldRoutes, arguments: data);
  }

  // static void setTitleAndUrl(String title, String url) {
  //   Future.delayed(const Duration(milliseconds: 100), () {
  //     html.window.history.pushState(null, title, url);
  //     SystemChrome.setApplicationSwitcherDescription(
  //       ApplicationSwitcherDescription(label: title),
  //     );
  //   });
  // }
}
