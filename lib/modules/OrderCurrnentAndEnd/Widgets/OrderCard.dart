import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/shared/Model/OrderCurrentAndEnd.dart';
import 'package:rest_cafe/shared/Model/orders_model.dart';
import 'package:rest_cafe/shared/localstroage.dart';

class OrderCard extends StatelessWidget {
  OrderCard({required this.order, this.haveRate = false});

  Orders order;
  bool haveRate;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:LocalStorage.getData(key: "lang")=="ar"? TextDirection.ltr:TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.h),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Widget_NameAndStatus(),
                        Widget_Cost(),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          width: .64.sw,
                          child: Row(
                            children: [
                              Image.asset(
                             order.deliveryType=="PICKUP"?"assets/images/ic_delivery_cafe.png": order.deliveryType=="VEHICLE"?  "assets/images/4.png":"assets/images/3.png",
                                fit: BoxFit.fill,
                                height: 20,
                              ),
                              // FaIcon(
                              //   FontAwesomeIcons.truck,
                              //   color: Color(0xff4CB379),
                              // ),
                              Spacer(),
                              haveRate ? Widget_Star() : Container(),
                              SizedBox(
                                width: 15.w,
                              ),
                              Widget_NumItem(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Image.network(
                     order.branch!.logo.toString(),
                      fit: BoxFit.fill,
                      height: 73.h,
                      width: 73.w,
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                Widget_Time()
              ],
            ),
          ),
        ),
      ),
    );
  }
//======================== Widget_Star =============================

  Row Widget_Star() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(""),
        SizedBox(
          width: 5.w,
        ),
        FaIcon(
          FontAwesomeIcons.solidStar,
          color: Color(0xff4CB379),
        ),
      ],
    );
  }

//======================== Widget_NameAndStatus =============================
  Container Widget_NameAndStatus() {
    return Container(
      width: .64.sw,
      child: Row(
        children: [
          Text(
            order.status.toString(),
            style: TextStyle(
                fontFamily: "FrutigerLTArabic",
                fontSize: 12.sp,
                color: Color(0xff4CB379)),
          ),
          Spacer(),
          Text(
            order.branch!.name.toString(),
            style: TextStyle(fontFamily: "FrutigerLTArabic", fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
//======================== Widget_Time =============================

  Row Widget_Time() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          order.createdAt.toString() ,
          style: TextStyle(
            fontFamily: "FrutigerLTArabic",
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        FaIcon(
          FontAwesomeIcons.solidClock,
          size: 20.sp,
          color: Color(0xff4CB379),
        ),
      ],
    );
  }
//======================== Widget_NumItem =============================

  Row Widget_NumItem() {
    return Row(
      children: [
        Text(order.itemsCount.toString()),
        SizedBox(
          width: 5.w,
        ),
        Text(
          "Products".tr(),
          style: TextStyle(
            fontFamily: "FrutigerLTArabic",
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Image.asset(
          "assets/images/ic_cart.png",
          fit: BoxFit.fill,
          height: 20,
          width: 20,
          color: Color(0xff4CB379),
        ),

        // FaIcon(
        //   FontAwesomeIcons.shoppingBasket,
        //   color: Color(0xff4CB379),
        // ),
      ],
    );
  }
//======================== Widget_Cost =============================

  Row Widget_Cost() {
    return Row(
      children: [

        Text(
          "SAR".tr(),
          style: TextStyle(
            fontFamily: "FrutigerLTArabic",
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(order.total.toString()),

        SizedBox(
          width: 10.w,
        ),
        FaIcon(
          FontAwesomeIcons.solidClock,
          size: 18.sp,
          color: Color(0xff4CB379),
        ),
      ],
    );
  }
}
