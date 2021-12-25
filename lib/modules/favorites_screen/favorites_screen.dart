import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/layout/Fuction/ScrollListener.dart';
import 'package:rest_cafe/modules/add_screen/addScreen.dart';
import 'package:rest_cafe/modules/detail_screen/detailScreen.dart';
import 'package:rest_cafe/modules/favorites_screen/favourites_cubit.dart';
import 'package:rest_cafe/shared/Model/favourties_model.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

import 'favourites_state.dart';

class FavoritesScreen extends StatelessWidget {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    FavoutiresCubit.get(context).getFavourties(context);
    return 
       BlocConsumer<FavoutiresCubit,FavouritesState>(
        listener: (context,state){},
        builder:(context,state)=>  Scaffold(
          appBar: CustomisedAppBar(
            title: 'المفضلة',
            actions: [],
          ),
          body:state is FavourtiesLoadingState? Center(child: CircularProgressIndicator()): ListView.separated(
            itemCount: FavoutiresCubit.get(context).favourites.length,
separatorBuilder: (context,index)=>SizedBox(height: 10,),

           itemBuilder: (context,index)=>FavouriteCard( FavoutiresCubit.get(context).favourites[index].item!),
          ),
        ),
      
    );
  }
}

class FavouriteCard extends StatelessWidget {
  Item item;
  FavouriteCard(this.item);
  @override
  Widget build(BuildContext context) {
    bool isFav = true;
    return GestureDetector(
      onTap: (){   showDialog(
        context: context,
        builder: (_) => Dialog(
          insetPadding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(20)),
          child: AddScreen( item.branchId.toString(),item.id.toString(), item.price!.toInt(),true,false),
        ), //AddScreen()
        barrierDismissible: true,
      );},
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xffDADADA)),
            borderRadius: BorderRadius.circular(20.sp)),
        child: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Row(
            children: [
              Container(
                height: 100.h,
                width: 90.w,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
                child: Image.network(item.image.toString()),
              ),
              SizedBox(width: 30.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name.toString(),
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: "FrutigerLTArabic",
                        )),
                    Row(children: [
                      Text(item.price.toString(),
                          style: TextStyle(
                              fontFamily: "FrutigerLTArabic",
                              color: Colors.black54,
                              fontSize: 12.sp)),
                    ]),
                  ],
                ),
              ),


              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) => Row(
                      children: [
                         Icon(
                            Icons.favorite,
                            color: color1,
                          ),


                 
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  @override
  bool isFav = false;
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, DetailScreen());
      },
      child: Container(
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
                  SizedBox(height: 10.h),
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
                    builder: (BuildContext context, StateSetter setState) =>
                        Row(
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
      ),
    );
  }
}
