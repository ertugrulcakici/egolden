import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/product/cubit/homeindex_cubit.dart';
import 'package:egolden/product/widgets/not_found_view.dart';
import 'package:egolden/view/auth/login/view/login_view.dart';
import 'package:egolden/view/auth/register/view/register_view.dart';
import 'package:egolden/view/basket/view/basket_view.dart';
import 'package:egolden/view/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return _navigate(settings.name!);
  }

  // Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  //   log("ongenerate path is ${settings.name}");
  //   return null;
  // }

  List<Route> onGenerateInitialRoutes(String route) {
    return _navigate(route, list: true) as List<Route<dynamic>>;
  }

  dynamic _navigate(String path, {bool list = false}) {
    Widget? _;
    switch (path) {
      case NavigationConstants.search:
        navigatorKey.currentContext!.read<HomeindexCubit>().setIndex(0);
        _ = HomeView();
        break;
      case NavigationConstants.favorites:
        navigatorKey.currentContext!.read<HomeindexCubit>().setIndex(1);
        _ = HomeView();
        break;
      case NavigationConstants.home:
        navigatorKey.currentContext!.read<HomeindexCubit>().setIndex(2);
        _ = HomeView();
        break;
      case NavigationConstants.basket:
        _ = const BasketView();
        break;
      case NavigationConstants.profile:
        navigatorKey.currentContext!.read<HomeindexCubit>().setIndex(4);
        _ = HomeView();
        break;
      case NavigationConstants.login:
        _ = const LoginView();
        break;
      case NavigationConstants.register:
        _ = const RegisterView();
        break;
      default:
        _ = NotFoundView(path: path);
        break;
    }
    if (list) {
      return [getRoute(_)];
    } else {
      return getRoute(_);
    }
  }
}

Route getRoute(Widget page) => MaterialPageRoute(builder: (context) => page);
