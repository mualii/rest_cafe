import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:easy_localization/src/public_ext.dart';
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
import 'package:rest_cafe/shared/Model/Resturants_model.dart';
import 'package:rest_cafe/shared/Model/location_model.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/components/constants.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/localstroage.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  var _searchController = TextEditingController();
Location location= Location.fromJson(json.decode( LocalStorage.getData(key: "Location")));
late List<Datum> resturants=[];
HomeCubit? homeCubit;

  @override
  Widget build(BuildContext context) {

    return
      BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {

          homeCubit= HomeCubit.get(context);

  resturants = homeCubit!.resturants;



          return Scaffold(
            extendBody: true,
            //   backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.only(
                    top: 20.0.sp, left: 20.0.sp, right: 20.0.sp),
                child: state is TypesLoading ?Center(child: CircularProgressIndicator()) :state is TypesFailed? Center(child: Text("اعد المحاولة لاحقا"),): SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Your location".tr(),
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
                              "${location.area!.isEmpty ? " " : location.area} ${location.district}",
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
                            },onChange: (name){
                              HomeCubit.get(context).filterByName(name);
                        },
                            onTap: () {
                              isVis = !isVis!;
                            },
                            // onEditingComplete: () {
                            //   isVis = true;
                            // },
                            controller: _searchController,
                            type: TextInputType.name,
                            hint: "Search for a restaurant".tr(),
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
                                text: HomeCubit.get(context).types[index].name!,
                                path:HomeCubit.get(context).types[index].icon!,
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 10),
                            itemCount: HomeCubit.get(context).types.length),
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

                                  navigateTo(context, BranchesScreen(resturants[index].id.toString()));
                                },
                                child: LabolOfSecondListView(data: resturants,index: index,)),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10.h),
                            itemCount: resturants.length),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },

    );
  }
}

class LabolOfSecondListView extends StatelessWidget {
  @override
  bool isFav = true;
  List<Datum> data=[];
  int ?index;
LabolOfSecondListView({required this.data,required this.index});
  Widget build(BuildContext context) {
isFav=data[index!].IsFavourite!;
    return Container(
      height: 125,
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
              child: Image.network(data[index!].logo!),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                   Row(
                      children: [
                        Text(data[index!].name!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: "FrutigerLTArabic",
                            )),
                        Spacer(),
                        Container(
                          height: 30,
                          child: Row(children: [
                            Text(data[index!].isOpen!?"Open".tr():"Closed".tr(),
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12.sp,
                                  fontFamily: "FrutigerLTArabic",
                                )),
                            Icon(
                              Icons.circle,
                              color: data[index!].isOpen!? color1:Colors.red,
                              size: 10.sp,
                            ),
                          ]),
                        ),

                      ],
                    ),


                  Row(
                      children: [
                        Row(children: [
                          Container(
                              height: 20,
                              child: Image.network(HomeCubit.get(context).types[HomeCubit.get(context).currentIndex].icon.toString(),)),
                          SizedBox(width: 5.w),
                          Text(data[index!].cuisine!,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12.sp,
                                fontFamily: "FrutigerLTArabic",
                              )),
                        ]),
                        Spacer(),

                        StatefulBuilder(
                          builder:(context,setState)=> IconButton(
                            icon: !isFav
                                ? Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.grey,
                            )
                                : Icon(
                              Icons.favorite,
                              color: color1,
                            ),
                            onPressed: () async{
                              setState(() {
                                isFav = !isFav;



                              });
                              if(isFav){
                                data[index!].IsFavourite=true;
                                await DioHelper.postData(endpoint: "api/v1/branch/favourites/${data[index!].id}", context: context);}
                              else{
                                data[index!].IsFavourite=false;
                              await DioHelper.delete(endpoint: "api/v1/branch/favourites/remove/${data[index!].id}", context: context);}
                            },
                          ),
                        ),



                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                              Text(data[index!].distance!.toString(),
                                  style: TextStyle(
                                      fontFamily: "FrutigerLTArabic",
                                      color: Colors.black54,
                                      fontSize: 12.sp)),

                            ],
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            color: color1,
                            size: 15.sp,
                          ),
                          SizedBox(width: 3),
                          Text(data[index!].preparationTime.toString(),
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 12.sp,
                                fontFamily: "FrutigerLTArabic",
                              )),
                        ],
                      ),


                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            data[index!].canDeliverToCar!?      Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Image.asset("assets/images/ic_delivery_car.png",width: 30,height: 22,fit: BoxFit.fill,),
                            ):Container(),
                            data[index!].canPickupOrder!?  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Image.asset("assets/images/ic_delivery_cafe.png",width: 30,height: 22,fit: BoxFit.fill,),
                            ):Container(),
                            data[index!].canReserveTable!?  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Image.asset("assets/images/3.png",width: 30,height: 22,fit: BoxFit.fill,),
                            ):Container(),
                          ],
                        ),

                    ],

                  )

                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}

class labolOfFristListView extends StatelessWidget {
  final String text,path;
  final int index;

  const labolOfFristListView({Key? key, required this.path, required this.text, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(



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
              child: ImageIcon(NetworkImage(path,scale: 1.5),color: index == HomeCubit.get(context).currentIndex
                  ?Colors.white:Theme.of(context).primaryColor,)
          ),
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
