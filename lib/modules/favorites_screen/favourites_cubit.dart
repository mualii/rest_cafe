

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/favorites_screen/favourites_state.dart';
import 'package:rest_cafe/shared/Model/favorite_resturant_model.dart';
import 'package:rest_cafe/shared/Model/favourties_model.dart';
import 'package:rest_cafe/shared/dio_helper.dart';

class FavoutiresCubit extends Cubit<FavouritesState>{
  FavoutiresCubit() : super(FavourtiesInitialState());
  List<FavoruiteResturant>favourites=[];
  static FavoutiresCubit get(BuildContext context)=>BlocProvider.of(context);
  
  getFavourties(BuildContext context)async{
    emit(FavourtiesLoadingState());
   var response= await DioHelper.getData(endpoint: "api/v1/branch/favourites/list", setParamars: {}, context: context);
   if(response is Response){
   favourites= FavoruiteResturantFromJson(json.encode(response.data));
    emit(FavourtiesLoadedState());}
   else
     emit(FavourtiesFailedState());
  }
  
}