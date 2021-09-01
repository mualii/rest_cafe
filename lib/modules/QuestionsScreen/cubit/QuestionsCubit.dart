import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/QuestionsScreen/cubit/QuestionsState.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitialState());

  static QuestionsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeListItem(int index) {
    currentIndex = index;
    emit(QuestionsChangeListIndex());
  }
}
