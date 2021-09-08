import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/modules/card_screen_2/cardScreen2.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class CardScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isChecked1 = true;
    bool isChecked2 = true;
    bool isChecked3 = true;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) => Container(
        height: .91.sh,
        padding: EdgeInsets.all(10.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: .15.sw),
                  Center(
                      child: myTitle(
                          title: "الدفع", font: 16.sp, color: Colors.black)),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      showDialog(
                        barrierColor: Colors.white10, //AddScreen()

                        context: context,
                        builder: (_) => Dialog(
                          insetPadding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: CardScreen2(),
                        ), //AddScreen()
                        barrierDismissible: false,
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 15.h),
              Center(child: Image.asset("assets/images/card3.png")),
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    border: Border.all(
                        color: isChecked1 ? Colors.black12 : Colors.black)),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SizedBox(width: 15.w),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isChecked1 = !isChecked1;
                            });
                          },
                          child: isChecked1
                              ? Icon(
                                  Icons.circle_outlined,
                                  color: Colors.black12,
                                  size: 30.sp,
                                )
                              : Icon(
                                  Icons.check_circle,
                                  color: color1,
                                  size: 30.sp,
                                ),
                        ),
                        SizedBox(width: 15.w),
                        myTitle(
                            title: "دفع بسداد",
                            font: 16.sp,
                            color: Colors.black),
                        SizedBox(width: .35.sw),
                        Container(
                            height: 15.h,
                            child: Image.asset("assets/images/pay (1).png")),
                      ],
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    border: Border.all(
                        color: isChecked2 ? Colors.black12 : Colors.black)),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SizedBox(width: 15.w),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isChecked2 = !isChecked2;
                            });
                          },
                          child: isChecked2
                              ? Icon(
                                  Icons.circle_outlined,
                                  color: Colors.black12,
                                  size: 30.sp,
                                )
                              : Icon(
                                  Icons.check_circle,
                                  color: color1,
                                  size: 30.sp,
                                ),
                        ),
                        SizedBox(width: 15.w),
                        myTitle(
                            title: "Paypal", font: 16.sp, color: Colors.black),
                        SizedBox(width: .38.sw),
                        Container(
                            height: 20.h,
                            child: Image.asset("assets/images/pay (2).png")),
                      ],
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    border: Border.all(
                        color: isChecked3 ? Colors.black12 : Colors.black)),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SizedBox(width: 15.w),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isChecked3 = !isChecked3;
                            });
                          },
                          child: isChecked3
                              ? Icon(
                                  Icons.circle_outlined,
                                  color: Colors.black12,
                                  size: 30.sp,
                                )
                              : Icon(
                                  Icons.check_circle,
                                  color: color1,
                                  size: 30.sp,
                                ),
                        ),
                        SizedBox(width: 15.w),
                        myTitle(
                            title: "فيزا", font: 16.sp, color: Colors.black),
                        myTitle(
                            title: "****5689",
                            font: 16.sp,
                            color: Colors.black38),
                        SizedBox(width: .25.sw),
                        Container(
                            height: 20.h,
                            child: Image.asset("assets/images/pay (1).jpg")),
                      ],
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              SizedBox(height: .22.sh),
              Divider(color: Colors.black38),
              Row(
                children: [
                  myTitle(title: "الاجمالي", color: Colors.black, font: 16.sp),
                  Spacer(),
                  myTitle(
                      title: "108 ريال", color: Colors.black38, font: 16.sp),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  myTitle(title: "للسيارة", color: Colors.black, font: 16.sp),
                  Spacer(),
                  myTitle(title: "2 ريال", color: Colors.black38, font: 16.sp),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(color: Colors.black38),
              SizedBox(height: 10.h),
              Row(
                children: [
                  myTitle(
                      title: "المبلغ الاجمالي",
                      color: Colors.black,
                      font: 16.sp),
                  Spacer(),
                  myTitle(
                      title: "110 ريال", color: Colors.black38, font: 16.sp),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(color: Colors.black38),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        navigateAndFinish(context, LayoutScreen());
                      },
                      child: mainBottom(
                          title: "اكمل عملية الشراء",
                          width: 150.w,
                          height: 50.h)),
                  InkWell(
                    onTap: () {
                      showDialog(
                        barrierColor: Colors.white10, //AddScreen()

                        context: context,
                        builder: (_) => Dialog(
                          insetPadding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: CardScreen2(),
                        ), //AddScreen()
                        barrierDismissible: false,
                      );
                    },
                    child: Container(
                      height: 60.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15.sp),
                          color: Colors.white10),
                      child: Center(
                        child: Text(
                          "السابق",
                          style: TextStyle(
                              fontFamily: "FrutigerLTArabic",
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ),
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
