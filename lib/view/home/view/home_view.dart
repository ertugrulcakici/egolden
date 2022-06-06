import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/core/services/statemanagement/cubit/homeindex_cubit.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/product/widgets/bottom_bar.dart';
import 'package:egolden/product/widgets/not_found_view.dart';
import 'package:egolden/view/basket/view/basket_view.dart';
import 'package:egolden/view/favorites/view/favorites_view.dart';
import 'package:egolden/view/home/view/homeinner_view.dart';
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
  @override
  void initState() {
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
      appBar: AppBar(
        title: const Text('Next Level Marketing'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: const MyBottomBar(),
      body: Consumer(
        builder: (context, ref, child) {
          switch (context.watch<HomeindexCubit>().state.index) {
            case 0:
              return const SearchView();
            case 1:
              return const FavoritesView();
            case 2:
              return const HomeInnerView();
            case 3:
              return const BasketView();
            case 4:
              return const ProfileView();
            default:
              return const NotFoundView();
          }
        },
      ),
    );
  }
}
