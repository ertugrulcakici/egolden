import 'dart:developer';

import 'package:egolden/core/services/statemanagement/providers/home_index_provider.dart';
import 'package:egolden/view/basket/view/basket_view.dart';
import 'package:egolden/view/favorites/view/favorites_view.dart';
import 'package:egolden/view/home/view/home_inner_view.dart';
import 'package:egolden/view/profile/view/profile_view.dart';
import 'package:egolden/view/search/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key) {
    log("HomeView inited");
  }

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("HomeView build");
    return Scaffold(
      drawer: null,
      appBar: AppBar(
        title: const Text('Next Level Marketing'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: const MyBottomBar(),
      body: Consumer(builder: (context, ref, child) {
        int index = ref.watch(homeIndexProvider);
        if (index == 0) {
          return const SearchView();
        } else if (index == 1) {
          return const FavoritesView();
        } else if (index == 2) {
          return const HomeInnerView();
        } else if (index == 3) {
          return const BasketView();
        } else {
          return const ProfileView();
        }
      }),
    );
  }
}

class MyBottomBar extends ConsumerStatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends ConsumerState<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return MotionTabBar(
          initialSelectedTab: "Anasayfa",
          labels: const ["Arama", "Favoriler", "Anasayfa", "Sepet", "Profil"],
          icons: const [
            Icons.search,
            Icons.favorite,
            Icons.home,
            Icons.shopping_cart,
            Icons.account_box
          ],
          badges: [
            // Default Motion Badge Widget
            const MotionBadgeWidget(
              text: '99+',
              textColor: Colors.white, // optional, default to Colors.white
              color: Colors.red, // optional, default to Colors.red
              size: 18, // optional, default to 18
            ),

            // custom badge Widget
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(2),
              child: const Text(
                '48',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),

            // allow null
            null,

            // Default Motion Badge Widget with indicator only
            const MotionBadgeWidget(
              isIndicator: true,
              color: Colors.red, // optional, default to Colors.red
              size: 5, // optional, default to 5,
              show: true, // true / false
            ),
            null
          ],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: Colors.blue[600],
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: Colors.blue[900],
          tabIconSelectedColor: Colors.white,
          tabBarColor: const Color(0xFFAFAFAF),
          onTabItemSelected: (int value) {
            ref
                .read<HomeIndexNotifier>(homeIndexProvider.notifier)
                .setIndex(value);
          },
        );
      },
    );
  }
}
