
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/add_screen/cubit/states.dart';
import 'package:rest_cafe/shared/Model/side_dishes_model.dart';
import 'package:rest_cafe/shared/dio_helper.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitialState());

  static AddCubit get(context) => BlocProvider.of(context);
SideDish? sideDishs;
List<bool> choises=[];
List<int> prices=[];
int total=0;
int side=0;
List<String> ids=[];
int? perunit;
int counter=1;
  bool onChangedCheckBox(bool val,int index) {
    val = !val;
    total=perunit!;

    side=0;
    if(val==true){
    prices[index]=sideDishs!.extras![index].price!;
    ids.add(sideDishs!.extras![index].id.toString());
    }
    else{
      prices[index]=0;
    ids.removeWhere((element) => element==sideDishs!.extras![index].id);
    }
    for(int i=0;i<sideDishs!.extras!.length;i++){
      side+=prices[i];


    }
    print(ids.length);
    print(side.toString());
    total+=side;
    total= total*counter;
    emit(ChangeCheckBoxIndex());
    emit(DataLoaded(sideDishs));
    return val;
  }

  int addOneItemFromCard(int count) {
    count++;
    counter=count;
    total=perunit!+side;
    total=total*count;
    emit(AddOneItem());
    emit(DataLoaded(sideDishs));
    return count;
  }

  int MinusOneItemFromCard(int count) {
    if (count > 1) count--;
    counter=count;
    total=perunit!+side;
    total=total*count;
    emit(MinusOneItem());
    emit(DataLoaded(sideDishs));
    return count;
  }

  getSides(BuildContext context,String id,int price)async{
    emit(DataLoading());


    perunit=price;
    total=price;
   var response= await DioHelper.getData(endpoint: "api/v1/branches/items/${id}", setParamars: {}, context: context);
    if(response is Response){
      sideDishs=SideDish.fromJson(response.data);
     choises= List.generate(sideDishs!.extras!.length, (index) =>  false);
     prices=sideDishs!.extras!.map((e) => 0).toList();
    emit(DataLoaded(sideDishs));}
    else
      emit(DataLoadingError());
  }
}
