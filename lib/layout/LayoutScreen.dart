import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/layout/Fuction/ScrollListener.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/OrderCurrentAndEnd.dart';
import 'package:rest_cafe/modules/favorites_screen/favorites_screen.dart';
import 'package:rest_cafe/modules/home_screen/homeScreen.dart';
import 'package:rest_cafe/modules/settings_screen/settings_screen.dart';
import 'package:rest_cafe/shared/components/constants.dart';
import 'package:rest_cafe/shared/localstroage.dart';

import 'Fuction/BNBCustomPainter.dart';
import 'Fuction/BNBCustomPainter2.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({required this.selectedPageIndex});
  int selectedPageIndex;
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _LayoutScreenState extends State<LayoutScreen> {
  late int currentIndex = widget.selectedPageIndex;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
      print(currentIndex);
    });
  }

  List<Widget> _pages = [];
  List<String> titlePage = [
    "Home".tr(),
    "Favorites".tr(),
    "Orders".tr(),
    "Settings".tr(),

  ];
  late int _selectedPageIndex = widget.selectedPageIndex;

  late final ScrollListener _model;

  @override
  void initState() {
    _pages = [
      HomeScreen(),
      FavoritesScreen(),
      OrderCurrentAndEnd(),
      SettingsScreen()
    ];
    if(LocalStorage.getData(key: "lang")=="en"){
      _pages=_pages.reversed.toList();
      titlePage=titlePage.reversed.toList();
      currentIndex=3;
      _selectedPageIndex=3;

    }
    super.initState();
    _model = ScrollListener.initialise(scrollController);

  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // body: HomeScreen(),
      extendBody: true, // very important as noted
      body: AnimatedBuilder(
        animation: _model,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              _pages.elementAt(_selectedPageIndex),
              isVis == true ? Container() : BotNavCustom(context, size),
            ],
          );
        },
      ),
    );
  }

//======================= Bot Nav Custom =========================
  Widget BotNavCustom(BuildContext context, Size size) {
    return AnimatedPositioned(

      duration: Duration(milliseconds: 600),
      bottom: _model.bottom,
      child: Container(
        width: size.width,
        height: 100.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomPaint(
              size: Size(size.width, 100.h),
              painter: BNBCustomPainter(),
            ),
            CustomPaint(
              size: Size(size.width, 100.h),
              painter: BNBCustomPainter2(),
            ),
            Positioned(
              bottom: 25.h,
              right: 40.h,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: currentIndex == 0
                            ? Colors.white.withOpacity(.35)
                            : Colors.transparent,
                        spreadRadius: 1,
                        blurRadius: 12,
                        offset: Offset(
                          0.0,
                          6.0,
                        ),
                      ),
                    ]),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setBottomBarIndex(0);
                        _selectedPageIndex = 0;
                      },
                      splashColor: Colors.white,
                      padding: currentIndex == 0
                          ? EdgeInsets.only(
                              bottom: 5.h,
                            )
                          : EdgeInsets.only(
                              bottom: 7.h,
                            ),
                      alignment: Alignment.bottomCenter,
                      icon: Image.asset(
                   LocalStorage.getData(key: "lang")=="ar" ?    "assets/images/home.png":"assets/images/settings.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    currentIndex == 0
                        ? RotationTransition(
                            turns: AlwaysStoppedAnimation(10 / 360),
                            child: Container(
                              width: 45.w,
                              height: 5.h,
                              margin: EdgeInsets.only(right: 1.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ))
                        : Container(),
                    SizedBox(height: 2.h),
                    // RotationTransition(
                    //   turns: AlwaysStoppedAnimation(10 / 360),
                    //   child: Text(
                    //     "الرئيسية",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Positioned(
              ///hiii
              bottom: 37.h,
              right: 125.w,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: currentIndex == 1
                            ? Colors.white.withOpacity(.35)
                            : Colors.transparent,
                        spreadRadius: 1,
                        blurRadius: 12,
                        offset: Offset(
                          0.0,
                          6.0,
                        ),
                      ),
                    ]),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setBottomBarIndex(1);
                        _selectedPageIndex = 1;
                      },
                      splashColor: Colors.white,
                      padding: currentIndex == 1
                          ? EdgeInsets.only(
                              bottom: 5,
                            )
                          : EdgeInsets.only(
                              bottom: 7,
                            ),
                      alignment: Alignment.bottomCenter,
                      icon: Image.asset(
                        LocalStorage.getData(key: "lang")=="ar" ?     "assets/images/fav.png":"assets/images/orders.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    currentIndex == 1
                        ? RotationTransition(
                            turns: AlwaysStoppedAnimation(0 / 360),
                            child: Container(
                              width: 40.w,
                              height: 5.h,
                              margin: EdgeInsets.only(left: 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ))
                        : Container(),
                    SizedBox(height: 2.h),
                    // Text(
                    //   "المفضلة",
                    //   style: TextStyle(color: Colors.white),
                    // ),
                  ],
                ),
              ),
            ),
            if (currentIndex == 0)
              Positioned(
                ///hiii
                bottom: 15.h,
                right: 172.w,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(),
                      SizedBox(height: 2.h),
                      Text(
                        titlePage[currentIndex],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            if (currentIndex == 1)
              Positioned(
                ///hiii
                bottom: 15.h,
                right: 175.w,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(),
                      SizedBox(height: 2.h),
                      Text(
                        titlePage[currentIndex],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            if (currentIndex == 2)
              Positioned(
                ///hiii
                bottom: 15.h,
                right: 175.w,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(),
                      SizedBox(height: 2.h),
                      Text(
                        titlePage[currentIndex],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            if (currentIndex == 3)
              Positioned(
                ///hiii
                bottom: 15.h,
                right: 170.w,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(),
                      SizedBox(height: 2.h),
                      Text(
                        titlePage[currentIndex],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            Positioned(
              bottom: 37.h,
              left: 125.w,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: currentIndex == 2
                            ? Colors.white.withOpacity(.35)
                            : Colors.transparent,
                        spreadRadius: 1,
                        blurRadius: 12,
                        offset: Offset(
                          0.0,
                          6.0,
                        ),
                      ),
                    ]),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setBottomBarIndex(2);
                        _selectedPageIndex = 2;
                      },
                      splashColor: Colors.white,
                      padding: currentIndex == 2
                          ? EdgeInsets.only(
                              bottom: 5,
                            )
                          : EdgeInsets.only(
                              bottom: 7,
                            ),
                      alignment: Alignment.bottomCenter,
                      icon: Image.asset(    LocalStorage.getData(key: "lang")=="ar" ?  "assets/images/orders.png":"assets/images/fav.png",
                          fit: BoxFit.fill),
                    ),
                    currentIndex == 2
                        ? RotationTransition(
                            turns: AlwaysStoppedAnimation(0 / 360),
                            child: Container(
                              width: 40,
                              height: 5,
                              margin: EdgeInsets.only(left: 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ))
                        : Container(),
                    SizedBox(height: 2.h),
                    // Text(
                    //   "الطلبات",
                    //   style: TextStyle(color: Colors.white),
                    // ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 25.h,
              left: 40.w,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: currentIndex == 3
                            ? Colors.white.withOpacity(.35)
                            : Colors.transparent,
                        spreadRadius: 1,
                        blurRadius: 12,
                        offset: Offset(
                          0.0,
                          6.0,
                        ),
                      ),
                    ]),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setBottomBarIndex(3);
                        _selectedPageIndex = 3;
                      },
                      splashColor: Colors.white,
                      padding: currentIndex == 3
                          ? EdgeInsets.only(
                              bottom: 5.h,
                            )
                          : EdgeInsets.only(
                              bottom: 7.h,
                            ),
                      alignment: Alignment.bottomCenter,
                      icon: Image.asset(LocalStorage.getData(key: "lang")=="ar" ?  "assets/images/settings.png":"assets/images/home.png",
                          fit: BoxFit.fill),
                    ),
                    currentIndex == 3
                        ? RotationTransition(
                            turns: AlwaysStoppedAnimation(-10 / 360),
                            child: Container(
                              width: 40.w,
                              height: 5.h,
                              margin: EdgeInsets.only(left: 1.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ))
                        : Container(),
                    SizedBox(height: 2.h),
                    // RotationTransition(
                    //   turns: AlwaysStoppedAnimation(-10 / 360),
                    //   child: Text(
                    //     "الاعدادات",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
