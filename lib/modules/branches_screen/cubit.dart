import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rest_cafe/modules/branches_screen/states.dart';
import 'package:rest_cafe/shared/Model/Resturants_model.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:http/http.dart' as http;
class BranchesCubit extends Cubit<BranchesState> {
  BranchesCubit() : super(BranchesInitialState());

  static BranchesCubit get(context) => BlocProvider.of(context);
List<Datum> data=[];
  int currentIndex = 0;
  Uint8List ?dataBytes;
  void changeListItem(int index) {
    currentIndex = index;
    emit(ChangeListIndex());
  }

  int currentIndex2 = 0;

  void changeListItem2(int index) {
    currentIndex2 = index;
    emit(ChangeListIndex());
  }

  void changeFavorites(bool fav, int i) {
    changeListItem2(i);
    fav = !fav;

    emit(DetailFavoritesState());
  }

  bool isFull = false;

  void changeBranchSize() {
    isFull = !isFull;
    emit(ChangeBranchSize());
  }

  getBranches(BuildContext context,String id)async{
    emit(BranchesLoadingState());
    var response=await DioHelper.getData(endpoint: "api/v1/branches/by-brand/$id",   setParamars: {"lat": "31.2511868", "lng": "29.9925146"}, context: context);
    if(response is Response) {
      data=(response.data["branches"]as List<dynamic>).map((e) {
        return
            Datum.fromJson(e);
      }).toList();
      Uri iconurl=Uri.parse(data[0].logo!);


      var request=await http.get(iconurl);
      Uint8List bytes= request.bodyBytes;

        dataBytes=bytes;
     emit(BranchesLoadedState());
    } else
      emit(BranchesFailedState());
  }
}