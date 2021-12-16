import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/shared/Model/cart_model.dart';
import 'package:rest_cafe/shared/dio_helper.dart';

import 'Screens/cart_state.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit() : super(CartInitialState());
static  CartCubit get(BuildContext context)=>BlocProvider.of(context);
List<Cart> cart=[];
String ? mainId;
updateCart(
Response response
    ){ cart=(response.data as List<dynamic>).map((e) => Cart.fromJson(e)).toList();
emit(CartLoadedState());}
getCart(BuildContext context)async{
  emit(CartLoadingState());
  var response=await DioHelper.getData(endpoint: "api/v1/carts", setParamars: {}, context: context);

  if(response is Response){
    cart=(response.data as List<dynamic>).map((e) => Cart.fromJson(e)).toList();

  emit(CartLoadedState());}
  else
    emit(CartErrorState());

}
addItem(BuildContext context,String id,int count)async{
  count++;
var response= await DioHelper.update(endpoint: "api/v1/carts/${id}", setParamars: {"quantity":count}
      , context: context);
 if(response is Response)
   cart=(response.data as List<dynamic>).map((e) => Cart.fromJson(e)).toList();
  emit(CartLoadedState());
  return count;
}

  minusItem(BuildContext context,String id,int count)async{
  if(count>0)
    count--;
    var response= await DioHelper.update(endpoint: "api/v1/carts/${id}", setParamars: {"quantity":count}
        , context: context);
    if(response is Response)
      cart=(response.data as List<dynamic>).map((e) => Cart.fromJson(e)).toList();
    emit(CartLoadedState());
    return count;
  }

  deleteItem(BuildContext context,String id)async{
  var response=await  DioHelper.delete(endpoint: "api/v1/carts/${id}", setParamars: {}, context: context);
    if(response is Response)
      cart=(response.data as List<dynamic>).map((e) => Cart.fromJson(e)).toList();
    if (cart.isEmpty)
      mainId=null;
    emit(CartLoadedState());
  }
}