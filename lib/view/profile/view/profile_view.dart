import 'dart:developer';

import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("ProfileView build");
    return const Scaffold(
      body: Center(
        child: Text("ProfileView"),
      ),
    );
  }
}