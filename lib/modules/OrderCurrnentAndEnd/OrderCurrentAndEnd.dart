import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_cafe/shared/Model/OrderCurrentAndEnd.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Screens/Tabar_Screen.dart';
import 'Widgets/OrderCard.dart';

class OrderCurrentAndEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffF7F7F7),
        appBar: CustomisedAppBar(
          title: 'الطلبات',
          actions: [],
        ),
        body: DefaultTabController(
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
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1))),
                // constraints: BoxConstraints(maxHeight: 150.0),
                child: TabBar(
                  indicatorColor: Color(0xff4CB379),
                  //  unselectedLabelColor:  Colors.cyan,

                  tabs: [
                    Tab(
                      child: Text(
                        "الحالية",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text("المنتهية",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    OrderCurrent(),
                    OrderEnd(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

