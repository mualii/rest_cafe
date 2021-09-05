import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/layout/Fuction/ScrollListener.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/modules/detail_screen/detailScreen.dart';
import 'package:rest_cafe/modules/home_screen/cubit/HomeCubit.dart';
import 'package:rest_cafe/modules/home_screen/cubit/HomeState.dart';
import 'package:rest_cafe/modules/notifications_screen/notifications_screen.dart';
import 'package:rest_cafe/modules/save_location_screen/saveLocationScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  var _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              extendBody: true,
         //   backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.all(20.0.sp),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "التوصيل الى",
                          style: TextStyle(
                              color: Color(0xffAEAEAE), fontSize: 12.sp),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              navigateTo(context, SaveLocationScreen());
                            },
                            child: Text(
                              "1704 Diptul Glen",
                              style: TextStyle(color: color1, fontSize: 16.sp),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Icon(Icons.keyboard_arrow_down_sharp,
                              color: Color(0xffAEAEAE)),
                          Spacer(),
                          //   SizedBox(width: .404.sw),
                          GestureDetector(
                            onTap: (){
                              navigateTo(context, NotificationsScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF1F1F3),),
                              child: Badge(
                                animationType: BadgeAnimationType.scale,
                                badgeContent: Container(
                                  alignment: Alignment.center,


                                  margin: EdgeInsets.symmetric(vertical: 1,horizontal: 0) ,
                                  padding:EdgeInsets.symmetric(vertical: 1,horizontal: 1) ,
                                ),
                                badgeColor: Color(0xff4CB379),
                                child:  Icon(Icons.notifications_none,
                                    size: 20.sp, color: Colors.black),
                              ),
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        height: 40.h,
                        child: defaultFormField(
                            controller: _searchController,
                            type: TextInputType.name,
                            hint: "بحث عن متجر او منتج",
                            prefix: Icons.search,
                            color: color1),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        height: 30.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: false,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                HomeCubit.get(context)
                                    .changeListItem(index);
                              },
                              child: labolOfFristListView(
                                index: index,
                                text: "المطاعم",
                                icon: FontAwesomeIcons.utensils,
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 10.w),
                            itemCount: 7),
                      ),
                      SizedBox(height: 10.h),
                      // LabolOfSecondListView()
                      Container(
                      //  height: .6.sh,
                        child: ListView.separated(
                            shrinkWrap: true,physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  navigateTo(context, DetailScreen());
                                },
                                child: LabolOfSecondListView()),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10.h),
                            itemCount: 10),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LabolOfSecondListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffDADADA)),
          borderRadius: BorderRadius.circular(20.sp)),
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Row(
          children: [
            Container(
              height: 100.h,
              width: 90.w,
              decoration: BoxDecoration(
                // border: Border.all(color: Color(0xffDADADA)),
                  borderRadius: BorderRadius.circular(20.sp)),
              child: Image.asset("assets/images/mac.png"),
            ),
            SizedBox(width: 20.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("هارديز",
                    style: TextStyle(color: Colors.black, fontSize: 16.sp)),
                SizedBox(height: 10.h),
                Row(children: [
                  Icon(
                    FontAwesomeIcons.utensils,
                    color: color1,
                    size: 15.sp,
                  ),
                  Text("ياباني",
                      style: TextStyle(color: Colors.black54, fontSize: 12.sp)),
                ]),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Icon(Icons.location_on_rounded, color: color1),
                    Text("ياباني",
                        style:
                        TextStyle(color: Colors.black54, fontSize: 12.sp)),
                  ],
                ),
              ],
            ),
            SizedBox(width: 20.w),
            Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // SizedBox(height: 10.h),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.access_time_filled, color: color1,size: 15.sp,),
                    Text("45 دقيقة",
                        style: TextStyle(color: Colors.black38, fontSize: 12.sp)),
                  ],
                ),
                SizedBox(height: 1.h)
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Text("مفتوح",
                      style: TextStyle(color: Colors.black54, fontSize: 12.sp)),
                  Icon(
                    Icons.circle,
                    color: color1,
                    size: 15.sp,
                  ),
                ]),
                Spacer(),
                Container(
                  height: 30.h,
                  width: 60.w,
                  child: Image.asset("assets/images/Type1Rest.png"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class labolOfFristListView extends StatelessWidget {
  final IconData? icon;
  final String text;
  final int index;

  const labolOfFristListView(
      {Key? key, this.icon, required this.text, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 90.w,
      decoration: index == HomeCubit.get(context).currentIndex
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: color1,
      )
          : BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: 15.sp,
              color: index == HomeCubit.get(context).currentIndex
                  ? Colors.white
                  : color1),
          SizedBox(width: 10.w),
          Text(
            text,
            style: TextStyle(
                color: index == HomeCubit.get(context).currentIndex
                    ? Colors.white
                    : Colors.black),
          )
        ],
      ),
    );
  }
}
