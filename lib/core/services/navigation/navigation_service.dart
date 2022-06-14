// import 'dart:html';

import 'package:egolden/core/services/navigation/navigation_route.dart';
import "package:flutter/material.dart";

import 'i_navigation_service.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;
  NavigationService._init();

  @override
  Future<void> navigateToPage(
      {String? title, required String path, Object? data}) async {
    title ??= path.split("/").last;
    // setTitleAndUrl(title, path);
    await NavigationRoute.instance.navigatorKey.currentState!
        .pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear(
      {String? title, required String path, Object? data}) async {
    title ??= path.split("/").last;
    // setTitleAndUrl(title, path);
    await NavigationRoute.instance.navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, (Route<dynamic> route) => false,
            arguments: data);
  }

  static void setTitleAndUrl(String title, String url) {
    // if (OrientationHelper.isWeb()) {
    //   Future.delayed(const Duration(milliseconds: 100), () {
    //     // window.history.replaceState(null, title, url.replaceFirst("/", ""));
    //     // SystemChrome.setApplicationSwitcherDescription(
    //     //   ApplicationSwitcherDescription(label: title),
    //     // );
    //   });
    // }
  }
}
