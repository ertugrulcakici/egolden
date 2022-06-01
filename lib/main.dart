import 'package:egolden/account_view.dart';
import 'package:egolden/basket_view.dart';
import 'package:egolden/home.dart';
import 'package:flutter/material.dart';

void main() {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => const Home(),
        "/account": (context) => const AccountView(),
        "/basket": (context) => const BasketView(),
      },
      theme: ThemeData(
        primarySwatch:
            // black theme primary swatch,
            const MaterialColor(
          0xFF000000,
          <int, Color>{
            50: Color(0xFF000000),
            100: Color(0xFF000000),
            200: Color(0xFF000000),
            300: Color(0xFF000000),
            400: Color(0xFF000000),
            500: Color(0xFF000000),
            600: Color(0xFF000000),
            700: Color(0xFF000000),
            800: Color(0xFF000000),
            900: Color(0xFF000000),
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        primaryIconTheme: const IconThemeData(color: Colors.black),
        primaryColor: Colors.black,
      ),
    );
  }
}
