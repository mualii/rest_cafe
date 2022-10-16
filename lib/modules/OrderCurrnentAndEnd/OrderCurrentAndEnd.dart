import 'package:easy_localization/src/public_ext.dart';
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

          appBar: CustomisedAppBar(
            title: 'Orders'.tr(),
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
                          "Current".tr(),
                          style: TextStyle(
                              fontFamily: "FrutigerLTArabic", ),
                        ),
                      ),
                      Tab(
                        child: Text("Previous".tr(),
                            style: TextStyle(
                                fontFamily: "FrutigerLTArabic",
                               )),
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
