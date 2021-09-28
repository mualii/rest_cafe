import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/detail_screen/cubit/states.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitialState());

  static DetailCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeListItem(int index) {
    currentIndex = index;
    emit(ChangeListIndex());
  }

  int currentIndex2 = 0;
  void changeListItem2(int index) {
    currentIndex2 = index;
    emit(ChangeListIndex());
  }

  void changeFavorites(bool fav, int i) {
    changeListItem2(i);
    fav = !fav;

    emit(DetailFavoritesState());
  }

  bool isFull = false;
  void changeBranchSize() {
    isFull = !isFull;
    emit(ChangeBranchSize());
  }
}
