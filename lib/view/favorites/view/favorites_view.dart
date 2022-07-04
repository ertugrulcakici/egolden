import 'package:badges/badges.dart';
import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/font_awesome_icons_icons.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/product/cubit/homeindex_cubit.dart';
import 'package:egolden/test_data.dart';
import 'package:egolden/view/favorites/viewmodel/favorites_viewmodel.dart';
import 'package:egolden/view/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesView extends ConsumerStatefulWidget {
  ChangeNotifierProvider<HomeViewModel> homeProvider;
  FavoritesView({Key? key, required this.homeProvider}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  ChangeNotifierProvider<FavoritesViewModel> provider =
      ChangeNotifierProvider((ref) => FavoritesViewModel());

  @override
  void initState() {
    NavigationService.setTitleAndUrl(
        "Favoriler", NavigationConstants.favorites);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favori ürünlerim"),
        centerTitle: true,
        leading: null,
      ),
      body: ref.watch(provider).isFavoritesEmpty
          ? _emptyFavorites()
          : _notEmptyFavorites(),
    );
  }

  _notEmptyFavorites() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              labelText: "Favorilerimde ara",
              prefixIcon: const Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Container(
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.favorite),
                  SizedBox(width: 6.w),
                  const Text("Tümü"),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.discount),
                  SizedBox(width: 6.w),
                  const Text("İndirimdekiler"),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.card_giftcard),
                  SizedBox(width: 6.w),
                  const Text("Kuponlular"),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(FontAwesomeIcons.box),
                  SizedBox(width: 6.w),
                  const Text("Bedava kargo"),
                ],
              ),
            )
          ]),
        ),
        Expanded(
          child: GridView.custom(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 2),
              childrenDelegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Expanded(
                            flex: 2,
                            child: Image.network(
                                TestData.sepetUrunleri[index]["image"])),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(TestData.sepetUrunleri[index]["name"])),
                      Expanded(
                          flex: 1,
                          child: Text(TestData.sepetUrunleri[index]["fiyat"]
                              .toString())),
                      Expanded(
                        flex: 1,
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_basket),
                            label: const Text("Sepete ekle")),
                      )
                    ],
                  ),
                );
              }, childCount: 3)),
        ),
      ],
    );
  }

  _emptyFavorites() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Badge(
              position: BadgePosition.topEnd(),
              badgeContent:
                  const Text("0", style: TextStyle(color: Colors.white)),
              child: Icon(Icons.favorite, size: 32.sp)),
          SizedBox(height: 0.01.sh),
          Text("Favorileriniz boş", style: TextStyle(fontSize: 20.sp)),
          SizedBox(height: 0.02.sh),
          InkWell(
              onTap: () {
                context.read<HomeindexCubit>().setIndex(0);
              },
              child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 0.02.sh, horizontal: 0.04.sw),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.yellow),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.orange,
                          Colors.orange.shade300,
                          Colors.orange
                        ],
                      )),
                  child: Text("Hemen ürünlere göz at!",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp))))
        ],
      ),
    );
  }
}
