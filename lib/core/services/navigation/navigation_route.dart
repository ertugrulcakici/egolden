import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/core/services/statemanagement/cubit/homeindex_cubit.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/product/widgets/not_found_view.dart';
import 'package:egolden/view/auth/login/view/login_view.dart';
import 'package:egolden/view/auth/register/view/register_view.dart';
import 'package:egolden/view/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  List<Route<dynamic>> onGenerateInitialRoutes(String route) {
    switch (route) {
      case NavigationConstants.search:
        return _navigate(HomeView());
      case NavigationConstants.favorites:
        navigatorKey.currentContext!.read<HomeindexCubit>().setIndex(1);
        return _navigate(HomeView());
      case NavigationConstants.home:
        navigatorKey.currentContext!.read<HomeindexCubit>().setIndex(2);
        return _navigate(HomeView());
      case NavigationConstants.basket:
        navigatorKey.currentContext!.read<HomeindexCubit>().setIndex(3);
        return _navigate(HomeView());
      case NavigationConstants.profile:
        navigatorKey.currentContext!.read<HomeindexCubit>().setIndex(4);
        return _navigate(HomeView());
      case NavigationConstants.login:
        return _navigate(const LoginView());
      case NavigationConstants.register:
        return _navigate(const RegisterView());
      default:
        return _navigate(const NotFoundView());
    }
  }

  Route<dynamic> onUnknownRoute(RouteSettings settings) {
    NavigationService.setTitleAndUrl(
        "Aradığınız sayfa bulunamadı", settings.name!);
    return MaterialPageRoute(
      builder: (BuildContext context) => const NotFoundView(),
    );
  }

  List<MaterialPageRoute> _navigate(Widget page) =>
      [MaterialPageRoute(builder: (context) => page)];
}
