import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rest_cafe/modules/card_screen_2/cardScreen2.dart';
import 'package:rest_cafe/modules/card_screen_2/cubit/delivery_cubit.dart';
import 'package:rest_cafe/modules/save_location_screen/saveLocationScreen.dart';
import 'package:rest_cafe/modules/splash_screen/splashScreen.dart';
import 'package:rest_cafe/shared/cubits/startCubit.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/localstroage.dart';
import 'package:rxdart/rxdart.dart';

import 'modules/OrderCurrnentAndEnd/Screens/Order_cubit.dart';
import 'modules/OrderCurrnentAndEnd/cart_cubit.dart';
import 'modules/detail_screen/cubit/detial_cubit.dart';
import 'modules/favorites_screen/favourites_cubit.dart';
import 'modules/home_screen/cubit/HomeCubit.dart';
import 'modules/order/order_detail_ٍscreen/orderDedailScreen.dart';
final GlobalKey<NavigatorState> navigatorKey =
GlobalKey(debugLabel: "Main Navigator");late String routeToGo = '/';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data);
  // flutterLocalNotificationsPlugin.show(
  //     message.data.hashCode,
  //     message.data['title'],
  //     message.data['body'],
  //     NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         channel.id,
  //         channel.name,
  //         channelDescription: channel.description,
  //       ),
  //     ));
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await EasyLocalization.ensureInitialized();
  DioHelper.initDio();
  if (LocalStorage.getData(key: "lang") == null)
    LocalStorage.saveData(key: "lang", value: "ar");
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   print('A new onMessageOpenedApp event was published!');
  //   RemoteNotification notification = message.notification;
  //   AndroidNotification android = message.notification?.android;
  // });

  runApp(EasyLocalization(
    child: Phoenix(child: MyApp()),
    supportedLocales: [Locale('ar'), Locale('en')],
    path: "assets/langs",
    fallbackLocale: Locale(LocalStorage.getData(key: "lang")),
    startLocale: Locale("ar"),
  ));
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    print("here");
    print(message.data);
    if (message.data['order_id'] != null) {
      print("ho");

      navigatorKey.currentState?.pushNamed('/second', arguments: message.data['order_id'] as String);
    }

  });
}
//Test

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getDeviceToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    setState(() {
      token = token;
    });
    print(token);
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              // Navigator.of(context, rootNavigator: true).pop();
              // await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => SecondScreen(payload),
              //   ),
              // );
            },
          )
        ],
      ),
    );
  }
  void onSelectNotification(payload) async {
// navigate to booking screen if the payload equal BOOKING
    print("ss");
    var message = json.decode(payload);
    if (message['order_id'] != null) {
      print("ho");
routeToGo="/second";
      navigatorKey.currentState?.pushNamed('/second', arguments: message['order_id'] as String);
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceToken();
    _requestPermissions();
    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(onDidReceiveLocalNotification: (
      int id,
      String? title,
      String? body,
      String? payload,
    ) async {
      didReceiveLocalNotificationSubject.add(
        ReceivedNotification(
          id: id,
          title: title,
          body: body,
          payload: payload,
        ),
      );
    });
    var initializationSettings = InitializationSettings(
        android: initialzationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: onSelectNotification);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      AppleNotification? ios = message.notification!.apple;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
              ),
            ),payload: json.encode({
          "order_id": message.data['order_id'],

        }));
      } else if (ios != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification!.title,
            notification.body,
            NotificationDetails(
              iOS: IOSNotificationDetails(
                presentSound: true,
              ),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     systemNavigationBarIconBrightness: Brightness.dark,
    //     statusBarBrightness: Brightness.dark,
    //     statusBarColor: Colors.transparent,
    //     //or set color with: Color(0xFF0000FF)
    //     systemNavigationBarColor: Colors.black,
    //     statusBarIconBrightness: Brightness.dark,
    //     systemNavigationBarDividerColor: Colors.black));
    return ScreenUtilInit(
      designSize: Size(392.72727272727275, 781.0909090909091),
      builder: (_,widget) => MultiBlocProvider(
        providers: [
          BlocProvider<CartCubit>(
            create: (context) => CartCubit()..getCart(context),
          ),
          BlocProvider(create: (context) => FavoutiresCubit()),
          BlocProvider<StartCubit>(
              create: (BuildContext context) => StartCubit()),
          BlocProvider<OrderCubit>(
              create: (BuildContext context) => OrderCubit()),
          BlocProvider<HomeCubit>(
              create: (BuildContext context) => HomeCubit()
                ..getProfile(context)
                ..getTypes(context)),
          BlocProvider<DeliveryCubit>(
              create: (BuildContext context) =>
                  DeliveryCubit()..getVehicles(context)),
          BlocProvider(create: (context) => DetailCubit())
        ],
        child: MaterialApp(
          title: "FastMenu",
          navigatorKey: navigatorKey,
          builder: (context, widget) {
            //add this line
            // ScreenUtil.defaultSize();
            // BotToastInit();
            return MediaQuery(
              //Setting font does not change with system font size

              data: MediaQuery.of(context)
                  .copyWith(textScaleFactor: 1.0, boldText: false,alwaysUse24HourFormat: false),
              child: widget!,
            );
          },
          // builder: (context, child) => MediaQuery(
          //   data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          //   child: child!,
          // ),

          theme:LocalStorage.getData(key: "theme")==null?  ThemeData.dark():ThemeData(tabBarTheme: TabBarTheme(labelColor: Colors.black),appBarTheme: AppBarTheme( color:  Colors.white,titleTextStyle: TextStyle(color: Colors.black,fontSize: 25 , fontFamily: "FrutigerLTArabic",

              fontWeight: FontWeight.w100))),
            themeMode: ThemeMode.system,
          //
          // ThemeData(
          //   primaryColor: Color(0xff4CB278),
          //   accentColor: Color(0xff4CB278),
          //   colorScheme: ColorScheme.light(primary: Color(0xff4CB278)),
          // ),
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
          // darkTheme: ThemeData.dark(),
          // themeMode: ThemeMode.system,

    onGenerateRoute: (RouteSettings settings) {
    switch (settings.name) {
    case '/':
    return MaterialPageRoute(
    builder: (_) => SplashScreen(),
    );
    break;
    case '/second':
    return MaterialPageRoute(
    builder: (_) => OrderDetailScreen(settings.arguments as String),
    );}   return null;
    },

          initialRoute: (routeToGo != null) ? routeToGo : '/',

          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // home: SplashScreen(),
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
  ScrollListener? _model;
  ScrollController? _controller;


  final double _bottomNavBarHeight = 56;

  @override
  void initState() {
    _controller = ScrollController();
    _model = ScrollListener.initialise(_controller!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _model!,
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
                bottom: _model?.bottom,
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
