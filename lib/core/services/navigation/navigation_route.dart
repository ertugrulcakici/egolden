import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../product/constants/navigation_constants.dart';
import '../../../product/widgets/not_found_view.dart';
import '../../../view/auth/login/view/login_view.dart';
import '../../../view/auth/register/view/register_view.dart';
import '../../../view/auth/splash/view/splash_view.dart';
import '../../../view/basket/view/basket_view.dart';
import '../../../view/favorites/view/favorites_view.dart';
import '../../../view/home/view/home_view.dart';
import '../../../view/profile/view/profile_view.dart';
import '../../../view/search/view/search_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    log(settings.name!);
    switch (settings.name) {
      case NavigationConstants.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case NavigationConstants.home:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );
      case NavigationConstants.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileView(),
        );
      case NavigationConstants.favorites:
        return MaterialPageRoute(
          builder: (_) => const FavoritesView(),
        );
      case NavigationConstants.basket:
        return MaterialPageRoute(
          builder: (_) => const BasketView(),
        );
      case NavigationConstants.search:
        return MaterialPageRoute(
          builder: (_) => const SearchView(),
        );
      case NavigationConstants.login:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case NavigationConstants.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundView(),
        );
    }
  }

  Route<dynamic> onUnknownRoute(RouteSettings settings) {
    // NavigationService.setTitleAndUrl(
    //     "Aradığınız sayfa bulunamadı", settings.name!);
    return MaterialPageRoute(
      builder: (BuildContext context) => const NotFoundView(),
    );
  }
}
