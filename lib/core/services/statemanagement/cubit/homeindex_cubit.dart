import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homeindex_state.dart';

class HomeindexCubit extends Cubit<HomeindexState> {
  HomeindexCubit() : super(const HomeindexInitial());
  setIndex(int index) {
    emit(HomeIndexState(index));
  }
}
