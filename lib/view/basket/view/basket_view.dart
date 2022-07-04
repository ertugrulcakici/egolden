import 'package:badges/badges.dart';
import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/font_awesome_icons_icons.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/product/cubit/homeindex_cubit.dart';
import 'package:egolden/test_data.dart';
import 'package:egolden/view/basket/viewmodel/basket_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasketView extends ConsumerStatefulWidget {
  const BasketView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BasketViewState();
}

class _BasketViewState extends ConsumerState<BasketView> {
  ChangeNotifierProvider<BasketViewModel> provider =
      ChangeNotifierProvider((context) => BasketViewModel());
  @override
  void initState() {
    NavigationService.setTitleAndUrl("Sepetim", NavigationConstants.basket);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
        title: Text(
            "Sepetim ${TestData.sepetUrunleri.isEmpty ? "" : TestData.sepetUrunleri.length.toString()} ürün"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              NavigationService.instance
                  .navigateToPage(path: NavigationConstants.home);
            },
            icon: const Icon(Icons.arrow_back_ios)));
  }

  _body() {
    if (ref.watch(provider).isBasketEmpty) {
      return _emptyBasket();
    } else {
      return _notEmptyBasket();
    }
  }

  _emptyBasket() {
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
              child: Icon(FontAwesomeIcons.shopping_basket, size: 32.sp)),
          SizedBox(height: 0.01.sh),
          Text("Sepetiniz boş", style: TextStyle(fontSize: 20.sp)),
          SizedBox(height: 0.02.sh),
          GestureDetector(
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
                  child: Text("Hemen alışverişe başla!",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp))))
        ],
      ),
    );
  }

  _notEmptyBasket() {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          // _basketHeader(),
          Expanded(flex: 9, child: _basketList()),
          Expanded(flex: 1, child: _basketNavbar()),
        ],
      ),
    );
  }

  _basketHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [],
      ),
    );
  }

  _basketList() {
    return ListView.builder(
      itemCount: TestData.sepetUrunleri.length,
      itemBuilder: (context, index) {
        return Card(
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child:
                        Image.network(TestData.sepetUrunleri[index]["image"])),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(TestData.sepetUrunleri[index]["name"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          SizedBox(height: 10.h),
                          Text(
                              "Tahmini teslim tarihi: ${TestData.sepetUrunleri[index]["kargo_suresi"]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.6))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.6))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add)),
                                    Text(TestData.sepetUrunleri[index]["count"]
                                        .toString()),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.remove)),
                                  ],
                                ),
                              ),
                              Text(
                                  "${TestData.sepetUrunleri[index]["fiyat"]} TL"),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete)),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  _basketNavbar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 0.1.sh,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.2),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.white),
        padding: const EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Toplam: ${TestData.sepetUrunleri.length} ürün",
                style: TextStyle(fontSize: 20.sp)),
            Text("${TestData.sepetUrunleri.length * 100} TL",
                style: TextStyle(fontSize: 20.sp)),
            GestureDetector(
              child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 0.01.sh, horizontal: 0.04.sw),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.orange,
                        Colors.orange.shade300,
                        Colors.orange
                      ],
                    ),
                  ),
                  child: Text("Ödeme yap",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}
