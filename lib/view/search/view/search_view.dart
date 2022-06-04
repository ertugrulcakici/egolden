import 'dart:developer';

import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("Search View");
    return const Scaffold(
      body: Center(
        child: Text("SearchView"),
      ),
    );
  }
}
