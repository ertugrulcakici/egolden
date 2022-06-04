import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeIndexNotifier extends StateNotifier<int> {
  HomeIndexNotifier() : super(2);

  void setIndex(int index) {
    state = index;
  }
}

StateNotifierProvider<HomeIndexNotifier, int> homeIndexProvider =
    StateNotifierProvider<HomeIndexNotifier, int>((ref) {
  return HomeIndexNotifier();
});
