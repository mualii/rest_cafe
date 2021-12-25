import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/Screens/OrderState.dart';
import 'package:rest_cafe/shared/Model/orders_model.dart';
import 'package:rest_cafe/shared/dio_helper.dart';

class OrderCubit extends Cubit<OrderState>{
  OrderCubit() : super(OrderInitialState());
 static OrderCubit get(BuildContext context)=>BlocProvider.of(context);
List<Orders> orders=[];

 getOrders(BuildContext context)async{

   emit(OrderLoadingState());
   var respone= await DioHelper.postData(endpoint: "api/v1/orders/list", formData: {"IsCurrent":1}, context: context);
   if(respone is Response){
     orders= ordersFromJson(json.encode(respone.data));
   emit(OrderLoadedState());}
   else
   emit(OrderFailedState());
 }
  getOldOrders(BuildContext context)async{

    emit(OrderLoadingState());
    var respone= await DioHelper.postData(endpoint: "api/v1/orders/list", formData: {"IsCurrent":0}, context: context);
    if(respone is Response){
      orders= ordersFromJson(json.encode(respone.data));
      emit(OrderLoadedState());}
    else
      emit(OrderFailedState());
  }
}