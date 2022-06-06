import 'package:egolden/core/initialization.dart';
import 'package:egolden/core/services/statemanagement/cubit/homeindex_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/services/navigation/navigation_route.dart';

void main() async {
  initApp();
  setPathUrlStrategy();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeindexCubit(),
        )
      ],
      child: ProviderScope(
        child: MaterialApp(
          initialRoute: "/",
          onUnknownRoute: NavigationRoute.instance.onUnknownRoute,
          onGenerateInitialRoutes:
              NavigationRoute.instance.onGenerateInitialRoutes,
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationRoute.instance.navigatorKey,
        ),
      ),
    );
  }
}
