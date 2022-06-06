part of 'homeindex_cubit.dart';

@immutable
abstract class HomeindexState {
  final int index;
  const HomeindexState(this.index);
}

class HomeindexInitial extends HomeindexState {
  const HomeindexInitial() : super(0);
}

class HomeIndexState extends HomeindexState {
  @override
  final int index;
  const HomeIndexState(this.index) : super(index);
}
