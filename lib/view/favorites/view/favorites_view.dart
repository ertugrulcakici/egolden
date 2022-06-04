import 'dart:developer';

import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("FavoritesView build");
    return const Scaffold(
      body: Center(
        child: Text("FavoritesView"),
      ),
    );
  }
}
