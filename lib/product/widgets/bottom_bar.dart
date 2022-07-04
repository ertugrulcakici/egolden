import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/product/cubit/homeindex_cubit.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      constraints: BoxConstraints(
        maxHeight: 0.07.sh,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            5,
            (index) => GestureDetector(
                  onTap: () {
                    if (index != 3) {
                      context.read<HomeindexCubit>().setIndex(index);
                    } else {
                      NavigationService.instance
                          .navigateToPage(path: NavigationConstants.basket);
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(_icons[index],
                          color: context.watch<HomeindexCubit>().state.index ==
                                  index
                              ? const Color.fromRGBO(255, 127, 0, 1)
                              : const Color.fromRGBO(106, 108, 110, 1),
                          size: 26),
                      Text(_tabs[index],
                          style: TextStyle(
                              fontSize: 16,
                              color: context
                                          .watch<HomeindexCubit>()
                                          .state
                                          .index ==
                                      index
                                  ? const Color.fromRGBO(255, 127, 0, 1)
                                  : const Color.fromRGBO(106, 108, 110, 1))),
                    ],
                  ),
                )),
      ),
    );
    // BottomNavigationBar(
    //   currentIndex: context.watch<HomeindexCubit>().state.index,
    //   items: List.generate(
    //       5,
    //       (index) => BottomNavigationBarItem(
    //             icon: Icon(_icons[index]),
    //             label: _tabs[index],
    //           )),
    //   iconSize: 30,
    //   selectedFontSize: 12,
    //   unselectedFontSize: 12,
    //   selectedItemColor: const Color.fromRGBO(255, 127, 0, 1),
    //   unselectedItemColor: const Color.fromRGBO(106, 108, 110, 1),
    //   onTap: (index) {
    //     if (index != 3) {
    //       context.read<HomeindexCubit>().setIndex(index);
    //     } else {
    //       NavigationService.instance
    //           .navigateToPage(path: NavigationConstants.basket);
    //     }
    //   },
    //   backgroundColor: Colors.grey,
    //   elevation: 10,
    //   showSelectedLabels: true,
    //   showUnselectedLabels: true,
    // );
  }
}
