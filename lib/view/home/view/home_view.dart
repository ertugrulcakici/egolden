import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/product/cubit/homeindex_cubit.dart';
import 'package:egolden/product/widgets/bottom_bar.dart';
import 'package:egolden/product/widgets/not_found_view.dart';
import 'package:egolden/view/favorites/view/favorites_view.dart';
import 'package:egolden/view/home/view/homeinner_view.dart';
import 'package:egolden/view/home/viewmodel/home_viewmodel.dart';
import 'package:egolden/view/profile/view/profile_view.dart';
import 'package:egolden/view/search/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends StatefulWidget {
  int? index;
  HomeView({Key? key, this.index}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late ChangeNotifierProvider<HomeViewModel> provider;

  @override
  void initState() {
    provider = ChangeNotifierProvider((ref) => HomeViewModel());
    NavigationService.setTitleAndUrl("Anasayfa", NavigationConstants.home);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const MyBottomBar(),
      body: Consumer(
        builder: (context, ref, child) {
          switch (context.watch<HomeindexCubit>().state.index) {
            case 0:
              return SearchView(homeProvider: provider);
            case 1:
              return FavoritesView(homeProvider: provider);
            case 2:
              return HomeInnerView(homeProvider: provider);
            // case 3:
            //   return BasketView(homeProvider: provider);
            case 4:
              return ProfileView(homeProvider: provider);
            default:
              return const NotFoundView(path: "0");
          }
        },
      ),
    );
  }
}
