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
              initialRoute: "/",
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
}
