import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:flutter/material.dart';

class HomeInnerView extends StatefulWidget {
  const HomeInnerView({Key? key}) : super(key: key);

  @override
  State<HomeInnerView> createState() => _HomeInnerViewState();
}

class _HomeInnerViewState extends State<HomeInnerView> {
  @override
  void initState() {
    NavigationService.setTitleAndUrl("Anasayfa", NavigationConstants.home);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("HomeInnerView"),
      ),
    );
  }
}
