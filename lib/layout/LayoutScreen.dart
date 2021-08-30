import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/modules/favourites_screen/favouritesScreen.dart';
import 'package:rest_cafe/modules/home_screen/homeScreen.dart';
import 'package:rest_cafe/modules/orders_screen/ordersScreen.dart';
import 'package:rest_cafe/modules/profile_screen/profile_screen.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _LayoutScreenState extends State<LayoutScreen> {
  List<Map<String, Widget>> _pages = [];
  int _selectedPageIndex = 0;
  void initState() {
    _pages = [
      {'page': HomeScreen()},
      {
        'page': FavouritesScreen(),
      },
      {
        'page': OrdersScreen(),
      },
      {
        'page': ProfileScreen(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        backgroundColor: color1,
        showSelectedLabels: false,
        iconSize: 30.sp,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_sharp),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'home',
          ),
        ],
      ),
    );
  }
}
