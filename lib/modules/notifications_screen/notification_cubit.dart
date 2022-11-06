import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/shared/dio_helper.dart';

import '../../shared/Model/notifications.dart';
import 'notfication_state.dart';

class NotificationCubit extends Cubit<NotificationState>{
  NotificationCubit() : super(IntialNotifcationState());


  static NotificationCubit get(BuildContext context)=>BlocProvider.of(context);
Notifications? notifications;

  getNotification(BuildContext context)async{
    emit(NotificationLoadingState());
    try{
Response response=    await DioHelper.getData(endpoint: "api/v1/notifications", setParamars: {}, context: context);

    notifications=Notifications.fromJson(response.data);
    emit(NotificationLoadedState());
    }



on DioError catch(e){
      emit(NotificationFailedState());
}
  }
}