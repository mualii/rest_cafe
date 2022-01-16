import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      Duration(seconds: 5),
      () {
        navigateAndFinish(context,LocalStorage.getData(key: "access_token")!=null?LocalStorage.getData(key: "Location")==null? SaveLocationScreen(): LayoutScreen(selectedPageIndex: 0): LoginScreen());
      },
    );
  }

  @override
  void initState() {
    StartCubit.get(context).determinePosition();
    startApp();
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
          "assets/images/logo.jpg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
