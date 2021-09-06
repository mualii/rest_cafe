import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/order/order_detail_%D9%8Dscreen/orderDedailScreen.dart';
import 'package:rest_cafe/shared/Model/OrderCurrentAndEnd.dart';
import 'package:rest_cafe/shared/components/components.dart';

class OrderCard extends StatelessWidget {
  OrderCard({required this.listOrder, this.haveRate = false});

  ModelOrderCurrentAndEnd listOrder;
  bool haveRate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, OrderDetailScreen());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                                "assets/images/ic_delivery_cafe.png",
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
                    Image.asset(
                      listOrder.image!,
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
        Text(listOrder.star ?? ""),
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
            listOrder.statue!,
            style: TextStyle(
                fontFamily: "FrutigerLTArabic",
                fontSize: 12.sp,
                color: Color(0xff4CB379)),
          ),
          Spacer(),
          Text(
            listOrder.name!,
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
          listOrder.date ?? "",
          style: TextStyle(
            fontFamily: "FrutigerLTArabic",
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        FaIcon(
          FontAwesomeIcons.solidClock,
          color: Color(0xff4CB379),
        ),
      ],
    );
  }
//======================== Widget_NumItem =============================

  Row Widget_NumItem() {
    return Row(
      children: [
        Text(listOrder.numItem ?? ""),
        SizedBox(
          width: 5.w,
        ),
        Text(
          "منتجات",
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
          height: 25,
          width: 25,
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
        Text(listOrder.cost ?? ""),
        SizedBox(
          width: 5.w,
        ),
        Text(
          "ريال",
          style: TextStyle(
            fontFamily: "FrutigerLTArabic",
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        FaIcon(
          FontAwesomeIcons.solidClock,
          color: Color(0xff4CB379),
        ),
      ],
    );
  }
}
