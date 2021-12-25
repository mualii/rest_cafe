import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/cart_cubit.dart';
import 'package:rest_cafe/shared/components/components.dart';

import 'Screens/Tabar_Screen.dart';
import 'Screens/cart_state.dart';

class OrderCurrentAndEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return

         Scaffold(
          backgroundColor: Color(0xffF7F7F7),
          appBar: CustomisedAppBar(
            title: 'الطلبات',
            actions: [],
          ),
          body:DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  width: .85.sw,
                  //  padding:EdgeInsets.symmetric(horizontal: 10) ,
                  decoration: BoxDecoration(
                      //This is for background color
                      color: Color(0xffF7F7F7),

                      //This is for bottom border that is needed
                      border:
                          Border(bottom: BorderSide(color: Colors.grey, width: 1))),
                  // constraints: BoxConstraints(maxHeight: 150.0),
                  child: TabBar(
                    indicatorColor: Color(0xff4CB379),
                    //  unselectedLabelColor:  Colors.cyan,

                    tabs: [
                      Tab(
                        child: Text(
                          "الحالية",
                          style: TextStyle(
                              fontFamily: "FrutigerLTArabic", color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text("السابقة",
                            style: TextStyle(
                                fontFamily: "FrutigerLTArabic",
                                color: Colors.black)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      OrderCurrent(0),
                      OrderCurrent(1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );


  }
}
