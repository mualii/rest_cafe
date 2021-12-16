import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/cart_cubit.dart';
import 'package:rest_cafe/shared/Model/details_model.dart';
import 'package:rest_cafe/shared/dio_helper.dart';

import 'detail_state.dart';

class DetailCubit extends Cubit<DetailState>{
  DetailCubit() : super(DetailInitialState());
  static DetailCubit get(BuildContext context)=>BlocProvider.of(context);
Details ?details;
  int currentIndex = 0;
  Category ?category;
  List<Item>all=[] ;
  void changeListItem(int index) {
    currentIndex = index;
    emit(ChangeListIndex());

    emit(DetailsLoaded(details));
  }

  getDetails(BuildContext context , String id )async{
    emit(DetailsLoading());
    var response= await DioHelper.getData(endpoint: "api/v1/branches/${id}", setParamars: {}, context: context);
    if(response is Response){
      details=Details.fromJson(response.data);
      for(int i=0;i<details!.categories!.length;i++){
        for(int j=0;j<details!.categories![i].items!.length;j++){
          all.add(details!.categories![i].items![j]);
        }
      }
    category=Category(name:"كل المنتجات",id: "all",items: all);
      details!.categories!.insert(0,category!);
    emit(DetailsLoaded(details));}
    else
      emit(DetailsFailed());


  }
}