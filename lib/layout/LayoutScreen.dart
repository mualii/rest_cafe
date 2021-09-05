import 'package:flutter/material.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/OrderCurrentAndEnd.dart';
import 'package:rest_cafe/modules/favorites_screen/favorites_screen.dart';
import 'package:rest_cafe/modules/home_screen/homeScreen.dart';
import 'package:rest_cafe/modules/settings_screen/settings_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
      print(currentIndex);

    });
  }

  List<Widget> _pages = [];
  int _selectedPageIndex = 0;
  void initState() {
    _pages = [
      HomeScreen(),
      FavoritesScreen(),
      OrderCurrentAndEnd(),
      SettingsScreen()


    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // body: HomeScreen(),
      extendBody: true, // very important as noted
      body: Stack(
        children: [
          //_pages[_selectedPageIndex]['page'],
          _pages.elementAt(_selectedPageIndex),
          Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                  data: Theme.of(context)
                      .copyWith(canvasColor: Colors.red),
                  child: Container(
                    //   color: Colors.white,

                    width: size.width,
                    height: 100,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CustomPaint(
                          size: Size(size.width, 100),
                          painter: BNBCustomPainter(),
                        ),


                        CustomPaint(
                          size: Size(size.width, 100),
                          painter: BNBCustomPainter2(),
                        ),

                        Positioned(
                          bottom: 30,
                          right: 40,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setBottomBarIndex(0);
                                  _selectedPageIndex = 0;
                                },
                                splashColor: Colors.white,
                                padding:   currentIndex == 0? EdgeInsets.only(bottom:5, ):EdgeInsets.only(bottom:7, ),


                                alignment:
                                Alignment.bottomCenter,
                                icon: Image.asset("assets/images/home.png",fit: BoxFit.fill,),
                              ),
                              currentIndex == 0?
                              RotationTransition(
                                  turns:  AlwaysStoppedAnimation(10 / 360),
                                  child: Container(width: 40,height: 5,margin: EdgeInsets.only(right: 5 ) ,
                                    decoration:BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ) ,)):Container()
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 35,
                          right: 125,
                          child: Column(
                            children: [
                              // GestureDetector(onTap: (){
                              //   setBottomBarIndex(1);
                              //   _selectedPageIndex = 1;
                              // },child: Image.asset("assets/images/fav.png",fit: BoxFit.fill,),),
                              IconButton(

                                onPressed: () {
                                  setBottomBarIndex(1);
                                  _selectedPageIndex = 1;
                                } ,splashColor: Colors.white,
                                padding:   currentIndex == 1? EdgeInsets.only(bottom:5, ):EdgeInsets.only(bottom:7, ),

                                alignment:
                                Alignment.bottomCenter,
                                icon: Image.asset("assets/images/fav.png",fit: BoxFit.fill,),
                              ),
                              currentIndex == 1?

                              RotationTransition(
                                  turns:  AlwaysStoppedAnimation(0 / 360),
                                  child: Container(width: 40,height: 5,margin: EdgeInsets.only(left: 0 ) ,
                                    decoration:BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ) ,)):Container()
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 35,
                          left: 125,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setBottomBarIndex(2);
                                  _selectedPageIndex = 2;
                                },
                                splashColor: Colors.white,

                                padding:   currentIndex == 2? EdgeInsets.only(bottom:5, ):EdgeInsets.only(bottom:7, ),

                                alignment:
                                Alignment.bottomCenter,
                                icon: Image.asset("assets/images/orders.png",fit: BoxFit.fill),
                              ),
                              currentIndex == 2?

                              RotationTransition(
                                  turns:  AlwaysStoppedAnimation(0 / 360),
                                  child: Container(width: 40,height: 5,margin: EdgeInsets.only(left: 0 ) ,
                                    decoration:BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ) ,)):Container()
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 30,
                          left: 40,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setBottomBarIndex(3);
                                  _selectedPageIndex = 3;
                                },
                                splashColor: Colors.white,

                                padding:   currentIndex == 3? EdgeInsets.only(bottom:5, ):EdgeInsets.only(bottom:7, ),


                                alignment:
                                Alignment.bottomCenter,
                                icon: Image.asset("assets/images/settings.png",fit: BoxFit.fill),
                              ),
                              currentIndex == 3?

                              RotationTransition(
                                  turns:  AlwaysStoppedAnimation(-10 / 360),
                                  child: Container(width: 40,height: 5,margin: EdgeInsets.only(left: 8 ) ,
                                    decoration:BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ) ,)):Container()
                            ],
                          ),
                        ),






                      ],
                    ),
                  ))),

        ],
      ),
     //  bottomNavigationBar: Container(
     // //   color: Colors.white,
     //
     //    width: size.width,
     //    height: 100,
     //    child: Stack(
     //      clipBehavior: Clip.none,
     //      children: [
     //        CustomPaint(
     //          size: Size(size.width, 100),
     //          painter: BNBCustomPainter(),
     //        ),
     //
     //
     //        CustomPaint(
     //          size: Size(size.width, 100),
     //          painter: BNBCustomPainter2(),
     //        ),
     //
     //        Positioned(
     //          bottom: 30,
     //          right: 40,
     //          child: Column(
     //            children: [
     //              IconButton(
     //                onPressed: () {
     //                  setBottomBarIndex(0);
     //                  _selectedPageIndex = 0;
     //                },
     //                splashColor: Colors.white,
     //                padding:   currentIndex == 0? EdgeInsets.only(bottom:5, ):EdgeInsets.only(bottom:7, ),
     //
     //
     //                alignment:
     //                 Alignment.bottomCenter,
     //                icon: Image.asset("assets/images/home.png",fit: BoxFit.fill,),
     //              ),
     //              currentIndex == 0?
     //              RotationTransition(
     //                  turns:  AlwaysStoppedAnimation(10 / 360),
     //                  child: Container(width: 40,height: 5,margin: EdgeInsets.only(right: 5 ) ,
     //                    decoration:BoxDecoration(
     //                      color: Colors.white,
     //                      borderRadius: BorderRadius.circular(10),
     //                    ) ,)):Container()
     //            ],
     //          ),
     //        ),
     //
     //        Positioned(
     //          bottom: 35,
     //          right: 125,
     //          child: Column(
     //            children: [
     //              // GestureDetector(onTap: (){
     //              //   setBottomBarIndex(1);
     //              //   _selectedPageIndex = 1;
     //              // },child: Image.asset("assets/images/fav.png",fit: BoxFit.fill,),),
     //              IconButton(
     //
     //                onPressed: () {
     //                  setBottomBarIndex(1);
     //                  _selectedPageIndex = 1;
     //                } ,splashColor: Colors.white,
     //                padding:   currentIndex == 1? EdgeInsets.only(bottom:5, ):EdgeInsets.only(bottom:7, ),
     //
     //                alignment:
     //              Alignment.bottomCenter,
     //                icon: Image.asset("assets/images/fav.png",fit: BoxFit.fill,),
     //              ),
     //              currentIndex == 1?
     //
     //              RotationTransition(
     //                  turns:  AlwaysStoppedAnimation(0 / 360),
     //                  child: Container(width: 40,height: 5,margin: EdgeInsets.only(left: 0 ) ,
     //                    decoration:BoxDecoration(
     //                      color: Colors.white,
     //                      borderRadius: BorderRadius.circular(10),
     //                    ) ,)):Container()
     //            ],
     //          ),
     //        ),
     //
     //        Positioned(
     //          bottom: 35,
     //          left: 125,
     //          child: Column(
     //            children: [
     //              IconButton(
     //                onPressed: () {
     //                  setBottomBarIndex(2);
     //                  _selectedPageIndex = 2;
     //                },
     //                splashColor: Colors.white,
     //
     //                padding:   currentIndex == 2? EdgeInsets.only(bottom:5, ):EdgeInsets.only(bottom:7, ),
     //
     //                alignment:
     //              Alignment.bottomCenter,
     //                icon: Image.asset("assets/images/orders.png",fit: BoxFit.fill),
     //              ),
     //              currentIndex == 2?
     //
     //              RotationTransition(
     //                  turns:  AlwaysStoppedAnimation(0 / 360),
     //                  child: Container(width: 40,height: 5,margin: EdgeInsets.only(left: 0 ) ,
     //                    decoration:BoxDecoration(
     //                      color: Colors.white,
     //                      borderRadius: BorderRadius.circular(10),
     //                    ) ,)):Container()
     //            ],
     //          ),
     //        ),
     //
     //        Positioned(
     //          bottom: 30,
     //          left: 40,
     //          child: Column(
     //            children: [
     //              IconButton(
     //                onPressed: () {
     //                  setBottomBarIndex(3);
     //                  _selectedPageIndex = 3;
     //                },
     //                splashColor: Colors.white,
     //
     //                padding:   currentIndex == 3? EdgeInsets.only(bottom:5, ):EdgeInsets.only(bottom:7, ),
     //
     //
     //                alignment:
     //              Alignment.bottomCenter,
     //                icon: Image.asset("assets/images/settings.png",fit: BoxFit.fill),
     //              ),
     //              currentIndex == 3?
     //
     //              RotationTransition(
     //                turns:  AlwaysStoppedAnimation(-10 / 360),
     //              child: Container(width: 40,height: 5,margin: EdgeInsets.only(left: 8 ) ,
     //                decoration:BoxDecoration(
     //                  color: Colors.white,
     //                  borderRadius: BorderRadius.circular(10),
     //                ) ,)):Container()
     //            ],
     //          ),
     //        ),
     //
     //
     //
     //
     //
     //
     //      ],
     //    ),
     //  ),
    );
  }
}




///first half circle paint
class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xff4CB379).withOpacity(.90)

    /// fill color
      ..style = PaintingStyle.fill;

    Path path = Path();

    print(size.height );
    path.moveTo(0,35  );
    // دية بداية اول نقطة فى الانحناء
    path.quadraticBezierTo(
        size.width / 2,
        -12,
        size.width, 35
    );

    //اول نقطتين يمثلوا مركز الانحناء
    // اخر نقطتين يمثلوا اخر نقطة فى الانحناء

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);






    canvas.drawPath(path, paint);

    // path.moveTo(0, 30);
    //
    // /// Start
    // path.quadraticBezierTo(size.width * 0.15, 0, size.width * 0.50, 0);
    //
    // path.quadraticBezierTo(size.width * 0.50, 0, size.width * 0.50, 0);
    //
    // path.arcToPoint(Offset(size.width * 0.50, 0),
    //     radius: Radius.circular(20.0), clockwise: false);
    // path.quadraticBezierTo(size.width * 0.50, 0, size.width * 0.55, 0);
    // path.quadraticBezierTo(size.width * 0.80, 0, size.width, 30);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    // path.lineTo(0, 40);
    // canvas.drawShadow(path, Colors.black, 5, true);
    // canvas.drawPath(path, paint);
  }
















  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// the second half circle paint
class BNBCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xff41AA6E)
      ..style = PaintingStyle.fill;

    Path path = Path();


    path.moveTo(0,80  );
    // دية بداية اول نقطة فى الانحناء
    path.quadraticBezierTo(
        size.width / 2,
        40,
        size.width, 80
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);

    // path.moveTo(-50, 27); // Start
    //
    // path.quadraticBezierTo(size.width * 0.15, -10, size.width * 0.50, -10);
    // path.quadraticBezierTo(size.width * 0.50, -10, size.width * 0.50, -10);
    // path.arcToPoint(Offset(size.width * 0.5, -10),
    //     radius: Radius.circular(10.0), clockwise: false);
    // path.quadraticBezierTo(size.width * 0.65, -10, size.width * 0.4, -10);
    // path.quadraticBezierTo(size.width * 0.80, -10, size.width + 50, 27);
    //
    // path.lineTo(size.width + 60, size.height);
    //
    // path.lineTo(0, size.height);
    //
    // path.lineTo(0, 40);
    // canvas.drawShadow(path, Colors.black, 5, true);
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
