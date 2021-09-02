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
    });
  }

  List<Map<String, Widget>> _pages = [];
  int _selectedPageIndex = 0;
  void initState() {
    _pages = [
      {'page': HomeScreen()},
      {
        'page': FavoritesScreen(),
      },
      {
        'page': OrderCurrentAndEnd(), // NotificationsScreen()
      },
      {
        'page': SettingsScreen(),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // body: HomeScreen(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Container(
        color: Color(0x00ffffff),
        width: size.width,
        height: 100,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomPaint(
              size: Size(size.width, 100),
              painter: BNBCustomPainter(),
            ),
            Container(
              color: Colors.transparent,
              width: size.width,
              height: 120,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setBottomBarIndex(0);
                            _selectedPageIndex = 0;
                          },
                          splashColor: Colors.white,
                          icon: Image.asset("assets/images/home.png"),
                        ),
                        IconButton(
                            icon: Image.asset("assets/images/fav.png"),
                            onPressed: () {
                              setBottomBarIndex(1);
                              _selectedPageIndex = 1;
                              // _selectPage;
                            }),
                        // Container(
                        //   width: size.width * 0.10,
                        // ),
                        IconButton(
                            icon: Image.asset("assets/images/orders.png"),
                            onPressed: () {
                              setBottomBarIndex(2);
                              _selectedPageIndex = 2;

                              // _selectPage;
                            }),
                        IconButton(
                            icon: Image.asset("assets/images/settings.png"),
                            onPressed: () {
                              setBottomBarIndex(3);
                              _selectedPageIndex = 3;

                              // _selectPage;
                            }),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      CustomPaint(
                        size: Size(size.width, 25),
                        painter: BNBCustomPainter2(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///first half circle paint
class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xff53BC80)

      /// fill color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 30);

    /// Start
    path.quadraticBezierTo(size.width * 0.15, 0, size.width * 0.50, 0);

    path.quadraticBezierTo(size.width * 0.50, 0, size.width * 0.50, 0);

    path.arcToPoint(Offset(size.width * 0.50, 0),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.50, 0, size.width * 0.55, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 40);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
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
    path.moveTo(-50, 27); // Start

    path.quadraticBezierTo(size.width * 0.15, -10, size.width * 0.50, -10);
    path.quadraticBezierTo(size.width * 0.50, -10, size.width * 0.50, -10);
    path.arcToPoint(Offset(size.width * 0.5, -10),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.65, -10, size.width * 0.4, -10);
    path.quadraticBezierTo(size.width * 0.80, -10, size.width + 50, 27);

    path.lineTo(size.width + 60, size.height);

    path.lineTo(0, size.height);

    path.lineTo(0, 40);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
