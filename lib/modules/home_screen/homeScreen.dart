import 'dart:io';
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/layout/Fuction/ScrollListener.dart';
import 'package:rest_cafe/modules/branches_screen/BranchesScreen.dart';
import 'package:rest_cafe/modules/home_screen/cubit/HomeCubit.dart';
import 'package:rest_cafe/modules/home_screen/cubit/HomeState.dart';
import 'package:rest_cafe/modules/notifications_screen/notifications_screen.dart';
import 'package:rest_cafe/modules/save_location_screen/saveLocationScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/components/constants.dart';
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
                padding: EdgeInsets.only(
                    top: 20.0.sp, left: 20.0.sp, right: 20.0.sp),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "موقعك",
                            style: TextStyle(
                                color: Color(0xffAEAEAE), fontSize: 16.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              navigateTo(context, SaveLocationScreen());
                            },
                            child: Text(
                              "Diptul Glen 1704 ",
                              style: TextStyle(
                                  color: color1,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Icon(Icons.keyboard_arrow_down_sharp,
                              color: Color(0xffAEAEAE)),
                          Spacer(),
                          //   SizedBox(width: .404.sw),
                          GestureDetector(
                            onTap: () {
                              navigateTo(context, NotificationsScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF1F1F3),
                              ),
                              child: Badge(
                                animationType: BadgeAnimationType.scale,
                                badgeContent: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 1, horizontal: 0),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1, horizontal: 1),
                                ),
                                badgeColor: Color(0xff4CB379),
                                child: Icon(Icons.notifications_none,
                                    size: 25.sp, color: Color(0xff2C3E50)),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        height: 40.h,
                        child: defaultFormField(
                            onSubmit: (String qw) {
                              isVis = false;
                            },
                            onTap: () {
                              isVis = !isVis!;
                            },
                            // onEditingComplete: () {
                            //   isVis = true;
                            // },
                            controller: _searchController,
                            type: TextInputType.name,
                            hint: "بحث عن متجر او منتج",
                            suffix: Icon(
                              Icons.clear,
                              color: Colors.grey,
                            ),
                            suffixPressed: () {
                              _searchController.clear();
                              FocusScope.of(context).unfocus();
                              Platform.isIOS ? isVis = false : isVis = true;
                            },
                            prefix: Icon(
                              Icons.search,
                              color: color1,
                            ),
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
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  navigateTo(context, BranchesScreen());
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
  bool isFav = false;

  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffDADADA)),
          borderRadius: BorderRadius.circular(20.sp)),
      child: Padding(
        padding: EdgeInsets.all(6.0.sp),
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
            SizedBox(width: 10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("هارديز",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: "FrutigerLTArabic",
                    )),
                SizedBox(height: 5.h),
                Row(children: [
                  Container(
                      height: 20,
                      child: Image.asset("assets/images/ic_restaurant.png")),
                  SizedBox(width: 5.w),
                  Text("ياباني",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.sp,
                        fontFamily: "FrutigerLTArabic",
                      )),
                ]),
                Spacer(),
                Row(
                  children: [
                    Container(
                        height: 20,
                        child: Image.asset("assets/images/ic_location.png")),
                    SizedBox(width: 5.w),
                    Row(
                      children: [
                        Text("Km",
                            style: TextStyle(
                                fontFamily: "FrutigerLTArabic",
                                color: Colors.black54,
                                fontSize: 12.sp)),
                        Text(" 5",
                            style: TextStyle(
                                fontFamily: "FrutigerLTArabic",
                                color: Colors.black54,
                                fontSize: 12.sp)),
                      ],
                    ),
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
                    Icon(
                      Icons.access_time_filled,
                      color: color1,
                      size: 15.sp,
                    ),
                    SizedBox(width: 3),
                    Text("45 دقيقة",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 12.sp,
                          fontFamily: "FrutigerLTArabic",
                        )),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Text("مفتوح",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.sp,
                        fontFamily: "FrutigerLTArabic",
                      )),
                  Icon(
                    Icons.circle,
                    color: color1,
                    size: 10.sp,
                  ),
                ]),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) => Row(
                    children: [
                      IconButton(
                        icon: isFav
                            ? Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.grey,
                        )
                            : Icon(
                          Icons.favorite,
                          color: color1,
                        ),
                        onPressed: () {
                          setState(() {
                            isFav = !isFav;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25.h,
                  width: 40.w,
                  child: Image.asset("assets/images/ic_delivery_car.png"),
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

  const labolOfFristListView({Key? key, this.icon, required this.text, required this.index})
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
          Container(
              height: 20,
              child: index == HomeCubit.get(context).currentIndex
                  ? Image.asset("assets/images/ic_restaurant_white.png")
                  : Image.asset("assets/images/ic_restaurant.png")),
          SizedBox(width: 10.w),
          Text(
            text,
            style: TextStyle(
                fontFamily: "FrutigerLTArabic",
                color: index == HomeCubit.get(context).currentIndex
                    ? Colors.white
                    : Colors.black),
          )
        ],
      ),
    );
  }
}

//
