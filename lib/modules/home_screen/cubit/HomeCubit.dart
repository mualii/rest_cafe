import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/home_screen/cubit/HomeState.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeListItem(int index) {
    currentIndex = index;
    emit(HomeChangeListIndex());
  }
}
