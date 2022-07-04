import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/view/home/viewmodel/home_viewmodel.dart';
import 'package:egolden/view/search/viewmodel/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends ConsumerStatefulWidget {
  ChangeNotifierProvider<HomeViewModel> homeProvider;
  SearchView({Key? key, required this.homeProvider}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  late ChangeNotifierProvider<SearchViewModel> provider;

  @override
  void initState() {
    provider =
        ChangeNotifierProvider<SearchViewModel>((ref) => SearchViewModel());
    NavigationService.setTitleAndUrl(
        "Arama sayfası", NavigationConstants.search);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Consumer(builder: (context, searchViewModel, _) {
                return TextField(
                  onChanged: (value) {
                    searchViewModel
                        .read<SearchViewModel>(provider)
                        .currentText = value;
                  },
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.w)),
                      prefixIcon: const Icon(Icons.search),
                      hoverColor: Colors.grey,
                      focusColor: Colors.grey,
                      iconColor: Colors.grey,
                      prefixIconColor: Colors.grey,
                      hintText: "Ürün, marka, kategori"),
                );
              }),
            ),
            Consumer(
              builder: (context, ref, child) {
                return Column(
                  children: [
                    Visibility(
                        visible: ref
                            .watch<SearchViewModel>(provider)
                            .currentText
                            .isNotEmpty,
                        child: const Text("aranacak")),
                    Visibility(
                        visible: ref
                            .watch<SearchViewModel>(provider)
                            .currentText
                            .isEmpty,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 0.01.sw),
                          height: 0.18.sh,
                          child: ListView.custom(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            semanticChildCount: 4,
                            childrenDelegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return InkWell(
                                  onTap: () {
                                    ref
                                        .watch<SearchViewModel>(provider)
                                        .currentCategoryIndex = index;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: ref
                                                    .watch<SearchViewModel>(
                                                        provider)
                                                    .currentCategoryIndex ==
                                                index
                                            ? const Border(
                                                bottom: BorderSide(
                                                    color: Colors.black),
                                              )
                                            : null),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0.02.sw),
                                    width: 0.2.sw,
                                    height: 0.2.sh,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.w),
                                          child: Image.network(
                                            "https://random.imagecdn.app/500/150",
                                            fit: BoxFit.fill,
                                            width: 0.2.sw,
                                            height: 0.2.sw,
                                          ),
                                        ),
                                        SizedBox(height: 0.02.sh),
                                        Text(
                                          "Kategori: $index",
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              //       );
                              // },
                            ),
                          ),
                        ))
                  ],
                );
              },
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
