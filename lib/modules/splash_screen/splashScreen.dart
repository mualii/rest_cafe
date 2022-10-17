import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/modules/home_screen/homeScreen.dart';
import 'package:rest_cafe/modules/login_screen/loginScreen.dart';
import 'package:rest_cafe/modules/save_location_screen/saveLocationScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/cubits/startCubit.dart';
import 'package:rest_cafe/shared/localstroage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startApp() async {
    Timer(
      Duration(seconds: 2),
      () {
        navigateAndFinish(context,LocalStorage.getData(key: "access_token")!=null?LocalStorage.getData(key: "Location")==null? SaveLocationScreen(): LayoutScreen(selectedPageIndex: 0): LoginScreen());
      },
    );
  }

  @override
  void initState() {
    try{
    StartCubit.get(context).determinePosition().then((v){
      startApp();
    });}
    catch(e){print("e");}





print(LocalStorage.getData(key: "access_token"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height.toString() + "        Height");
    // print(MediaQuery.of(context).size.width.toString() + "       width");
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "assets/images/vast_logo.png",
          fit: BoxFit.fill,
        ).animate()
            .fadeIn(duration: 1500.ms),
      ),
    );
  }
}
