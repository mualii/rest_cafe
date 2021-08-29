import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/modules/login_screen/loginScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startApp() async {
    Timer(
      Duration(seconds: 5),
      () {
        navigateAndFinish(context, LoginScreen());
      },
    );
  }

  @override
  void initState() {
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height.toString() + "        Height");
    // print(MediaQuery.of(context).size.width.toString() + "       width");
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          Center(child: myTitle(title: "RESTCAFE", font: 50.sp, color: color1)),
    );
  }
}