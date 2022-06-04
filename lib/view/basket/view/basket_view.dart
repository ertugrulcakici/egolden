import 'dart:developer';

import 'package:flutter/material.dart';

class BasketView extends StatelessWidget {
  const BasketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("BasketView build");
    return const Scaffold(
      body: Center(
        child: Text("BasketView"),
      ),
    );
  }
}
