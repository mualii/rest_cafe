import 'dart:math';

import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/home_screen/cubit/HomeState.dart';
import 'package:rest_cafe/shared/Model/Resturants_model.dart';
import 'package:rest_cafe/shared/Model/types_model.dart';
import 'package:rest_cafe/shared/Model/user_model.dart';

import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:string_similarity/string_similarity.dart';
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
List<Types> types=[];
List<Datum>resturants=[],all=[];
  ClientUser ?user;
  int currentIndex = 0;
  void changeListItem(int index) {
    currentIndex = index;
filterByType();
    emit(HomeChangeListIndex());

  }
  getTypes(BuildContext context)async{
    emit(TypesLoading());
 var result=  await DioHelper.getData(endpoint: "api/v1/types", setParamars: {}, context: context);
    if(
    result is Response
    ){
types.addAll((result.data as List<dynamic>).map((e) => Types.fromJson(e)).toList());

Types type = Types(name: "all".tr(),key: "",icon: "");
types.insert(0,type);
getResturants(context);
      emit(TypesLoaded());

    }
    else
      emit(TypesFailed());
  }
  getProfile(BuildContext context)async{
    emit(ProfileLoading());
    var response=await DioHelper.getData(endpoint: "api/v1/users/userInfo", setParamars: {}, context: context);
    if(response is Response) {
      user = ClientUser.fromJson(response.data);
      emit(ProfileLoaded());
    }
    else
      emit(ProfileError());


  }
  getResturants(BuildContext context)async {
    emit(ResturantsLoading());
    var result = await DioHelper.getData(endpoint: "api/v1/branches/by-geocode",
        setParamars: {"lat": "31.2511868", "lng": "29.9925146"},
        context: context);
    if (result is Response) {
      all = Resturants
          .fromJson(result.data)
          .data!;


      filterByType();

      emit(ResturantsLoaded());
    }
    else
      emit(ResturantsFailed());
  }
  filterByType(){
if(currentIndex==0)
  resturants=all;
else
    resturants=all.where((element) => element.type==types[currentIndex].key).toList();
    emit(SearchedByType());
  }
  filterByName(String name){

    resturants=all.where((element) => (element.name!.toLowerCase().similarityTo(name)>0.5 || element.name!.toLowerCase().contains(name))).toList();
    emit(SearchedByType());
  }
}

