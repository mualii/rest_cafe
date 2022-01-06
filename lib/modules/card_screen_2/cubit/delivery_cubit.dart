import 'dart:convert';


import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/card_screen_2/cubit/delivery_state.dart';
import 'package:rest_cafe/modules/detail_screen/cubit/detial_cubit.dart';
import 'package:rest_cafe/shared/Model/Price_model.dart';
import 'package:rest_cafe/shared/Model/car_BrandModel_model.dart';
import 'package:rest_cafe/shared/Model/car_brands_model.dart';
import 'package:rest_cafe/shared/Model/car_model.dart';
import 'package:rest_cafe/shared/Model/color_model.dart';
import 'package:rest_cafe/shared/Model/orders_model.dart';
import 'package:rest_cafe/shared/Model/set_order_model.dart';
import 'package:rest_cafe/shared/dio_helper.dart';

class DeliveryCubit extends Cubit<DeliveryState>{
  DeliveryCubit() : super(DeliveryInitalState());
  List<Datum> brands=[];

  List<Car> cars=[];
  List<Modles> models=[];
  SetOrder setorder=SetOrder();
  int CarIndex=0;
  List<Colors>colors=[];

TotalPrice? price;
  static DeliveryCubit get(BuildContext context)=>BlocProvider.of(context);
  getVehicles(BuildContext context)async{
    emit(CarsLoadingState());
  var response=await   DioHelper.getData(endpoint: "api/v1/vehicles/my_vehicles", setParamars: {}, context: context);
  if ( response is Response){
   cars= welcomeFromJson(json.encode(response.data));
   if (cars.isEmpty==false)
   setorder.vehicle_id=cars[0].id!;
  emit(CarsLoadedState());
  }
  else
    emit(CarsFailedState());
    
  }
  addCar({required BuildContext context,required String brand, required String plate,required String color})async{
    emit(CarsLoadingState());
    print(color.toString());
   var response =await  DioHelper.postData(endpoint: "api/v1/vehicles", context: context,formData: {"brand_model_id":brand,"vehicle_color_id":color,"plate_number":plate});
    if(response is Response){
      cars.insert(0,Car.fromJson(response.data));
    emit(CarsLoadedState());}
    else
    emit(CarsFailedState());
  }

getBrands(BuildContext context)async{
  emit(CarsLoadingState());
  var response =await DioHelper.getData(endpoint: "api/v1/brands", setParamars: {}, context: context);
  if(response is Response){
brands=CarBrand.fromJson(response.data).data!;
getColors(context);
    emit(CarsLoadedState());}
  else
    emit(CarsFailedState());
    
}

getModel(BuildContext context,String id)async{
  emit(CarsLoadingState());
  var response =await DioHelper.getData(endpoint: "api/v1/models/${id}", setParamars: {}, context: context);
  if(response is Response){
    models=CarModel.fromJson(response.data).data!;
    emit(CarsModelLoadedState());}
  else
    emit(CarsFailedState());
}

getTotal(BuildContext context)async{

  emit(CarsLoadingState());
  var response =await DioHelper.postData(endpoint: "api/v1/orders/count_total", formData: {"branch_id":DetailCubit.get(context).details!.id,"type":setorder.type}, context: context);
  if(response is Response){
 price=TotalPrice.fromJson(response.data);
    emit(CarsModelLoadedState());}
  else
    emit(CarsFailedState());
}

  getColors(BuildContext context)async{

    var response =await DioHelper.getData(endpoint: "api/v1/colors-list", setParamars: {}, context: context);
    if(response is Response){
      colors=colorsFromJson(json.encode(response.data));


  }}
}