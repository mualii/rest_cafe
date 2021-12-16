import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/order/order_detail_%D9%8Dscreen/order_detail_state.dart';
import 'package:rest_cafe/shared/Model/order_details_model.dart';
import 'package:rest_cafe/shared/dio_helper.dart';

class OrderDetailsCubit extends Cubit<OrderDetailState>{
  OrderDetailsCubit() : super(OrderDetailInitial());
  OrderDetails ?details;
 static  OrderDetailsCubit get(BuildContext context)=>BlocProvider.of(context);

 getOrderDetails(BuildContext context, String id)async{

   emit(OrderDetailsLoading());
   var response= await DioHelper.getData(endpoint: "api/v1/orders/${id}", setParamars: {}, context: context);
   if(response is Response){
     details=OrderDetails.fromJson(response.data);
   emit(OrderDetailsLoaded());}
     else
     emit(OrderDetailsFailed());
 }

}