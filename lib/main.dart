import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('ar'), Locale('en')],
    path: "assets/langs",
    startLocale: Locale('ar'),
    saveLocale: true,
  ));
}
//Test

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        //or set color with: Color(0xFF0000FF)
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.black));
    return ScreenUtilInit(
      designSize: Size(392.72727272727275, 781.0909090909091),
      builder: () => MaterialApp(
        //     theme: ThemeData(unselectedWidgetColor: Colors.red,tabBarTheme:TabBarTheme(unselectedLabelColor: Colors.red ) ),

        // theme: ThemeData(
        //   textTheme: GoogleFonts.cairoTextTheme(
        //     Theme.of(context).textTheme.copyWith(
        //           headline6: TextStyle(
        //             fontSize: 18.sp,
        //             fontWeight: FontWeight.w800,
        //             color: Color(0xFFA9B2D2),
        //           ),
        //           button: TextStyle(
        //             fontSize: 18.0.sp,
        //           ),
        //           caption: TextStyle(
        //             fontSize: 18.0.sp,
        //           ),
        //           bodyText2: TextStyle(
        //             fontSize: 18.sp,
        //           ),
        //           headline1: TextStyle(
        //             fontSize: 18.sp,
        //           ),
        //           headline2: TextStyle(
        //             fontSize: 18.sp,
        //           ),
        //           headline3: TextStyle(
        //             fontSize: 18.sp,
        //           ),
        //           headline5: TextStyle(
        //             fontSize: 18.sp,
        //           ),
        //           overline: TextStyle(
        //             fontSize: 18.sp,
        //           ),
        //           subtitle1: TextStyle(
        //             fontSize: 18.sp,
        //           ),
        //           subtitle2: TextStyle(
        //             fontSize: 18.sp,
        //           ),
        //           bodyText1: TextStyle(
        //             fontSize: 18.sp,
        //           ),
        //           headline4: TextStyle(
        //             fontSize: 18.sp,
        //             fontWeight: FontWeight.w800,
        //             color: Color(0xFFA9B2D2),
        //           ),
        //         ),
        //   ),
        // ),

        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: LayoutScreen(),
      ),
    );
  }
}
