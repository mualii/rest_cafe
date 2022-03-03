

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';

import 'package:rest_cafe/shared/Model/profile_model.dart';
import 'package:rest_cafe/shared/cubits/startState.dart';
import 'package:rest_cafe/shared/dio_helper.dart';

import 'package:rest_cafe/shared/localstroage.dart';

class StartCubit extends Cubit<StartState> {
  StartCubit() : super(StartInitalState());

  static StartCubit get(BuildContext context) => BlocProvider.of(context);
  Profile? profile;
  Position?location;

  AutocompleteResponse? risult  ;
saveNumber(Response data){
  emit(SavingData());
  profile=Profile.fromJson(data.data);


  LocalStorage.saveData(key: "access_token", value: profile!.data!.accessToken);
  emit(NumberSavedState());
}


   determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    location=  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


    print(location!.longitude.toString());
  }

autoComplete(String text)async{
  var googlePlace = GooglePlace("AIzaSyDAc-y-9PWVagF01ChYsf0Goo50Pybdli0");
  if(text==""){
    risult!.predictions!.clear();
  emit(AutoCompeleteDone(risult!.predictions!));}
  else {
    risult = await googlePlace.autocomplete.get(text);

    emit(AutoCompeleteDone(risult!.predictions!));
  }
}

}



