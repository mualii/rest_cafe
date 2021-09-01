
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/shared/Model/OrderCurrentAndEnd.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  OrderCard({
    required this.listOrder,
    this.haveRate = false
  }) ;

  ModelOrderCurrentAndEnd listOrder;
  bool haveRate ;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                            FaIcon(
                              FontAwesomeIcons.truck,
                              color: Color(0xff4CB379),
                            ),
                            Spacer(),
                            haveRate?   Widget_Star():Container(),
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
    );
  }

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
                            style: TextStyle(fontSize: 16.sp,color:  Color(0xff4CB379)),
                          ),
                          Spacer(),
                          Text(

                            listOrder.name!,
                            style: TextStyle(fontSize: 18.sp),
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
                Text(listOrder.date ?? ""),
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
                              Text("منتجات"),
                              SizedBox(
                                width: 10.w,
                              ),
                              FaIcon(
                                FontAwesomeIcons.shoppingBasket,
                                color: Color(0xff4CB379),
                              ),
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
                        Text("ريال"),
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