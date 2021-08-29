import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/modules/Payment_screens/first_payment_screen.dart';
import 'package:rest_cafe/modules/favorites_screen/favorites_screen.dart';

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
        theme: ThemeData(canvasColor: Colors.grey.shade100),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: FirstPaymentScreen(),
      ),
    );
  }
}
