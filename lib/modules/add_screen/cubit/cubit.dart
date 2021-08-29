import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/add_screen/cubit/states.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitialState());

  static AddCubit get(context) => BlocProvider.of(context);

  bool onChangedCheckBox(bool val) {
    val = !val;
    emit(ChangeCheckBoxIndex());
    return val;
  }

  int addOneItemFromCard(int count) {
    count++;
    emit(AddOneItem());
    return count;
  }

  int MinusOneItemFromCard(int count) {
    if (count > 1) count--;
    emit(MinusOneItem());
    return count;
  }
}
