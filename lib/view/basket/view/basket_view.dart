import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/view/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasketView extends StatefulWidget {
  ChangeNotifierProvider<HomeViewModel> homeProvider;
  BasketView({Key? key, required this.homeProvider}) : super(key: key);

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  @override
  void initState() {
    NavigationService.setTitleAndUrl("Sepetim", NavigationConstants.basket);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("BasketView"),
      ),
    );
  }
}
