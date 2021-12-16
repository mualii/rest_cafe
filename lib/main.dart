// @dart=2.9

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rest_cafe/modules/card_screen_2/cubit/delivery_cubit.dart';
import 'package:rest_cafe/modules/save_location_screen/saveLocationScreen.dart';
import 'package:rest_cafe/modules/splash_screen/splashScreen.dart';
import 'package:rest_cafe/shared/cubits/startCubit.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/localstroage.dart';


import 'modules/OrderCurrnentAndEnd/Screens/Order_cubit.dart';
import 'modules/OrderCurrnentAndEnd/cart_cubit.dart';
import 'modules/detail_screen/cubit/detial_cubit.dart';
import 'modules/home_screen/cubit/HomeCubit.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage.init();
DioHelper.initDio();
  await EasyLocalization.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('ar'), Locale('en')],
    path: "assets/langs",
    startLocale: Locale('ar'),
    // fallbackLocale: Locale('en'),

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
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider<CartCubit>(
          create: (context)=>CartCubit(),),
          BlocProvider<StartCubit>(create: (BuildContext context)=>StartCubit()),
          BlocProvider<OrderCubit>(create: (BuildContext context)=>OrderCubit()),
          BlocProvider<HomeCubit>(create: (BuildContext context)=>HomeCubit()..getTypes(context)),
          BlocProvider<DeliveryCubit>(create: (BuildContext context)=>DeliveryCubit()..getVehicles(context)),
    BlocProvider(
    create: (context) => DetailCubit())

        ],
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: Color(0xff4CB278),
            accentColor: Color(0xff4CB278),
            colorScheme: ColorScheme.light(primary: Color(0xff4CB278)),
          ),
          //     theme: ThemeData(unselectedWidgetColor: Colors.red,tabBarTheme:TabBarTheme(unselectedLabelColor: Colors.red ) ),

          // theme: ThemeData(
          //   textTheme: GoogleFonts.Superclarendon(
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
          home: SplashScreen(),
        ),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
    ScrollListener _model;
    ScrollController  _controller;
  final double _bottomNavBarHeight = 56;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _model = ScrollListener.initialise(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _model,
        builder: (context, child) {
          return Stack(
            children: [
              ListView.builder(
                controller: _controller,
                itemCount: 20,
                itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: _model.bottom,
                child: _bottomNavBar,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget get _bottomNavBar {
    return SizedBox(
      height: _bottomNavBarHeight,
      child: BottomNavigationBar(
        backgroundColor: Colors.amber,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
        ],
      ),
    );
  }
}

class ScrollListener extends ChangeNotifier {
  double bottom = 0;
  double _last = 0;

  ScrollListener.initialise(ScrollController controller, [double height = 56]) {
    controller.addListener(() {
      final current = controller.offset;
      bottom += _last - current;
      if (bottom <= -height) bottom = -height;
      if (bottom >= 0) bottom = 0;
      _last = current;
      if (bottom <= 0 && bottom >= -height) notifyListeners();
    });
  }
}
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

