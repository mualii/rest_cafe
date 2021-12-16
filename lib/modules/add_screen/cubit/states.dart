import 'package:rest_cafe/shared/Model/side_dishes_model.dart';

abstract class AddState {}

class AddInitialState extends AddState {}

class ChangeCheckBoxIndex extends AddState {}

class AddOneItem extends AddState {}

class MinusOneItem extends AddState {}
class DataLoaded extends AddState{
  SideDish ?sideDish;
  DataLoaded(this.sideDish);
}
class DataLoading extends AddState{

}
class DataLoadingError extends AddState{}
