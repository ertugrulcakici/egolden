import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannerNotifier extends StateNotifier<int> {
  HomeBannerNotifier() : super(0);
  void index(int index) {
    state = index;
  }
}

class HomeBanner extends ConsumerStatefulWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeBannerState();
}

class _HomeBannerState extends ConsumerState<HomeBanner> {
  int total = 3;
  int current = 0;

  final StreamController<int> _controller = StreamController<int>.broadcast();
  Stream<int> get myStream => _controller.stream.asBroadcastStream();
  Sink<int> get mySink => _controller.sink;

  @override
  void initState() {
    mySink.add(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.symmetric(vertical: 0.01.sh, horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10.w),
                    child: const Text("Kampanyalar")),
                Container(
                    margin: EdgeInsets.only(right: 10.w),
                    child: const Text("Tümü")),
              ],
            ),
            SizedBox(height: 10.h),
            AspectRatio(
              aspectRatio: 3,
              child: PageView(
                onPageChanged: (index) {
                  current = index;
                  mySink.add(current);
                },
                children: List.generate(total, (index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                        // "http://www.turbim.com/goldenerp/koyevibal.png",
                        "https://random.imagecdn.app/500/150",
                        fit: BoxFit.fill),
                  );
                }),
              ),
            ),
            SizedBox(height: 10.h),
            StreamBuilder<int>(
              stream: myStream,
              builder: (context, snapshot) {
                return Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        total,
                        (index) => Container(
                              decoration: BoxDecoration(
                                color: index == snapshot.data
                                    ? Colors.black
                                    : Colors.grey.shade900.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(45.0),
                              ),
                              width: 0.01.sh,
                              height: 0.01.sh,
                            )),
                  ),
                );
              },
            )
          ],
        ));
  }
}
