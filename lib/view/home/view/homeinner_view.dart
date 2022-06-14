import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/product/widgets/home_banner.dart';
import 'package:egolden/view/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeInnerView extends StatefulWidget {
  ChangeNotifierProvider<HomeViewModel> homeProvider;
  HomeInnerView({Key? key, required this.homeProvider}) : super(key: key);

  @override
  State<HomeInnerView> createState() => _HomeInnerViewState();
}

class _HomeInnerViewState extends State<HomeInnerView> {
  final String _response = "";
  @override
  void initState() {
    NavigationService.setTitleAndUrl("Anasayfa", NavigationConstants.home);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.02.sh, horizontal: 0.05.sw),
        child: ListView(
          children: [
            const HomeBanner(),
            SizedBox(height: 0.03.sh),
          ],
        ),
      ),
    );
  }
}
