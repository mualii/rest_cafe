import 'package:rest_cafe/shared/Model/details_model.dart';

abstract class DetailState{}
class DetailInitialState extends DetailState{}
class ChangeListIndex extends DetailState{}
class DetailsLoading extends DetailState{}
class DetailsLoaded extends DetailState{
  Details ?details;
  DetailsLoaded(this.details);
}
class DetailsFailed extends DetailState{}