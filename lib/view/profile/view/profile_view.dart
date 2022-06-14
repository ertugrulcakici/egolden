import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/view/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileView extends StatefulWidget {
  ChangeNotifierProvider<HomeViewModel> homeProvider;
  ProfileView({Key? key, required this.homeProvider}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    NavigationService.setTitleAndUrl("Profil", NavigationConstants.profile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ProfileView"),
      ),
    );
  }
}
