import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/layout/Fuction/ScrollListener.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomisedAppBar(
        title: 'المفضلة',
        actions: [],
      ),
      body: ListView(
        controller: scrollController,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          FavoriteItem(),
          SizedBox(height: 20.h),
          FavoriteItem(),
        ],
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
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
