import 'package:google_place/google_place.dart';

abstract class StartState{}
class StartInitalState extends StartState{}
class NumberSavedState extends StartState{}
class LocationSucsess extends StartState{}
class SavingData extends StartState{}
class AutoCompeleteDone extends StartState{
  List<AutocompletePrediction> data=[];
  AutoCompeleteDone(this.data);
}
