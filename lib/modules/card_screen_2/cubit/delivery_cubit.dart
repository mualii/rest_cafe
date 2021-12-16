import 'dart:convert';


import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/card_screen_2/cubit/delivery_state.dart';
import 'package:rest_cafe/shared/Model/car_model.dart';
import 'package:rest_cafe/shared/Model/set_order_model.dart';
import 'package:rest_cafe/shared/dio_helper.dart';

class DeliveryCubit extends Cubit<DeliveryState>{
  DeliveryCubit() : super(DeliveryInitalState());
  List<Car> cars=[];
  SetOrder setorder=SetOrder();
  static DeliveryCubit get(BuildContext context)=>BlocProvider.of(context);
  getVehicles(BuildContext context)async{
    emit(CarsLoadingState());
  var response=await   DioHelper.getData(endpoint: "api/v1/vehicles/my_vehicles", setParamars: {}, context: context);
  if ( response is Response){
   cars= welcomeFromJson(json.encode(response.data
   ));
  emit(CarsLoadedState());
  }
  else
    emit(CarsFailedState());
    
  }
  addCar({required BuildContext context,required String brand, required String plate,required String color})async{
    emit(CarsLoadedState());
   var response =await  DioHelper.postData(endpoint: "api/v1/vehicles", context: context,formData: {"brand":brand,"color":color,"plate_number":plate});
    if(response is Response){
      cars.insert(0,Car.fromJson(response.data));
    emit(CarsLoadedState());}
    else
    emit(CarsFailedState());
  }


}