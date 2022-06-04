import 'dart:developer';

import 'package:flutter/material.dart';

class HomeInnerView extends StatefulWidget {
  const HomeInnerView({Key? key}) : super(key: key);

  @override
  State<HomeInnerView> createState() => _HomeInnerViewState();
}

class _HomeInnerViewState extends State<HomeInnerView> {
  @override
  Widget build(BuildContext context) {
    log("Home Inner View");
    return const Scaffold(
      body: Center(
        child: Text('HomeInnerView'),
      ),
    );
  }
}
