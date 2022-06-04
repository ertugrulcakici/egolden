import "package:flutter/material.dart";

import '../../../../core/services/navigation/navigation_service.dart';
import '../../../../product/constants/navigation_constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double _opacity = 0;
  final Duration _duration = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1;
      });
      _initApp();
      Future.delayed(_duration, () {
        NavigationService.instance
            .navigateToPage(title: "Başlık", path: NavigationConstants.home);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: _duration,
          child: Image.network("https://i.hizliresim.com/o5zrjmg.png"),
        ),
      ),
    );
  }

  void _initApp() {}
}
