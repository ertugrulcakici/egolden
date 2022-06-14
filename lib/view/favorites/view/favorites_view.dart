import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/view/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends StatefulWidget {
  ChangeNotifierProvider<HomeViewModel> homeProvider;
  FavoritesView({Key? key, required this.homeProvider}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    NavigationService.setTitleAndUrl(
        "Favoriler", NavigationConstants.favorites);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("FavoritesView"),
      ),
    );
  }
}
