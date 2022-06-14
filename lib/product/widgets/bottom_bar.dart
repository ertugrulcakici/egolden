import 'package:egolden/product/cubit/homeindex_cubit.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class MyBottomBar extends ConsumerStatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends ConsumerState<MyBottomBar> {
  @override
  void initState() {
    super.initState();
  }

  final List<IconData> _icons = const [
    Icons.search,
    Icons.favorite,
    Icons.home,
    Icons.shopping_cart,
    Icons.account_box
  ];
  final List<String> _tabs = const [
    "Arama",
    "Favoriler",
    "Anasayfa",
    "Sepet",
    "Profil"
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.watch<HomeindexCubit>().state.index,
      items: List.generate(
          5,
          (index) => BottomNavigationBarItem(
                icon: Icon(_icons[index]),
                label: _tabs[index],
              )),
      selectedIconTheme: const IconThemeData(color: Colors.green, size: 30),
      unselectedIconTheme: const IconThemeData(color: Colors.black, size: 20),
      selectedFontSize: 12,
      unselectedFontSize: 10,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      onTap: (index) => context.read<HomeindexCubit>().setIndex(index),
      backgroundColor: Colors.grey,
      elevation: 10,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
    // return Consumer(
    //   builder: (context, ref, child) {
    //     return MotionTabBar(
    //       initialSelectedTab: _tabs[ref.watch<int>(homeIndexProvider)],
    //       labels: _tabs,
    //       icons: const [
    //         Icons.search,
    //         Icons.favorite,
    //         Icons.home,
    //         Icons.shopping_cart,
    //         Icons.account_box
    //       ],
    //       badges: [
    //         // Default Motion Badge Widget
    //         const MotionBadgeWidget(
    //           text: '99+',
    //           textColor: Colors.white, // optional, default to Colors.white
    //           color: Colors.red, // optional, default to Colors.red
    //           size: 18, // optional, default to 18
    //         ),

    //         // custom badge Widget
    //         Container(
    //           color: Colors.black,
    //           padding: const EdgeInsets.all(2),
    //           child: const Text(
    //             '48',
    //             style: TextStyle(
    //               fontSize: 14,
    //               color: Colors.white,
    //             ),
    //           ),
    //         ),

    //         // allow null
    //         null,

    //         // Default Motion Badge Widget with indicator only
    //         const MotionBadgeWidget(
    //           isIndicator: true,
    //           color: Colors.red, // optional, default to Colors.red
    //           size: 5, // optional, default to 5,
    //           show: true, // true / false
    //         ),
    //         null
    //       ],
    //       tabSize: 50,
    //       tabBarHeight: 55,
    //       textStyle: const TextStyle(
    //         fontSize: 12,
    //         color: Colors.black,
    //         fontWeight: FontWeight.w500,
    //       ),
    //       tabIconColor: Colors.blue[600],
    //       tabIconSize: 28.0,
    //       tabIconSelectedSize: 26.0,
    //       tabSelectedColor: Colors.blue[900],
    //       tabIconSelectedColor: Colors.white,
    //       tabBarColor: const Color(0xFFAFAFAF),
    //       onTabItemSelected: (int value) async {
    //         ref
    //             .read<HomeIndexNotifier>(homeIndexProvider.notifier)
    //             .setIndex(value);
    //         await Future.delayed(const Duration(milliseconds: 200));
    //         switch (value) {
    //           case 0:
    //             NavigationService.instance
    //                 .navigateToPage(path: NavigationConstants.search);
    //             break;
    //           case 1:
    //             NavigationService.instance
    //                 .navigateToPage(path: NavigationConstants.favorites);
    //             break;
    //           case 2:
    //             NavigationService.instance
    //                 .navigateToPage(path: NavigationConstants.home);
    //             break;
    //           case 3:
    //             NavigationService.instance
    //                 .navigateToPage(path: NavigationConstants.basket);
    //             break;
    //           case 4:
    //             NavigationService.instance
    //                 .navigateToPage(path: NavigationConstants.profile);
    //             break;
    //           default:
    //         }
    //       },
    //     );
    //   },
    // );
  }
}
