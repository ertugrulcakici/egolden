import 'package:egolden/core/initialization.dart';
import 'package:egolden/product/cubit/homeindex_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/services/navigation/navigation_route.dart';

void main() async {
  await initApp();
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
        child: ScreenUtilInit(
          designSize: const Size(400, 800),
          builder: (context, widget) {
            return MaterialApp(
              theme: _tempTheme(),
              // onGenerateRoute: NavigationRoute.instance.onGenerateRoute,
              onUnknownRoute: NavigationRoute.instance.onUnknownRoute,
              onGenerateInitialRoutes:
                  NavigationRoute.instance.onGenerateInitialRoutes,
              debugShowCheckedModeBanner: false,
              navigatorKey: NavigationRoute.instance.navigatorKey,
            );
          },
        ),
      ),
    );
  }

  _tempTheme() {
    final lightTheme = ThemeData.light();
    return ThemeData(
      listTileTheme: lightTheme.listTileTheme.copyWith(
        iconColor: Colors.black,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0.01.sh),
      ),
      appBarTheme: lightTheme.appBarTheme.copyWith(
          color: Colors.white,
          elevation: 2,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 24),
          iconTheme: const IconThemeData(color: Colors.black)),
    );
  }
}
