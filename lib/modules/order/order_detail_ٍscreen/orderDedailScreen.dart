import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/order/chat_order_screen/chatOrderScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class OrderDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 170.h,
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: .03.sw),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    child: InkWell(
                        onTap: () {},
                        child: IconButton(
                            onPressed: () {
                              navigateTo(context, ChatOrderScreen());
                            },
                            icon: Icon(FontAwesomeIcons.commentAlt))),
                  ),
                  SizedBox(width: .29.sw),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffDADADA)),
                            borderRadius: BorderRadius.circular(20.sp)),
                        child: Image.asset("assets/images/mac.png"),
                      ),
                      myTitle(
                          title: "ماكدونالد ",
                          font: 16.sp,
                          color: Colors.black),
                    ],
                  ),
                  SizedBox(width: .29.sw),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Divider(
                  height: 3.h,
                  color: Color(0xffD8D8D8),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(width: 20.w),
                  Container(
                    height: 20,
                    width: 20,
                    child: Image.asset("assets/images/deliver.png"),
                  ),
                  SizedBox(width: 10.w),
                  myTitle(
                      title: "التوصيل للسيارة",
                      color: Colors.black,
                      font: 12.sp),
                  SizedBox(width: .4.sw),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(color: Colors.grey)),
                      child: myTitle(
                          color: color1, font: 14.sp, title: " الطلب جاري"))
                ],
              )
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myTitle(title: "الفرع", font: 14.sp, color: Colors.black),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                height: .16.sh,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffDADADA)),
                    borderRadius: BorderRadius.circular(20.sp)),
                child: Image.asset(
                  "assets/images/location.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myTitle(title: "المنتجات", font: 14.sp, color: Colors.black),
                ],
              ),
              SizedBox(height: 10.h),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) => ListModle(),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 15.h),
                  itemCount: 2),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xffF7F7F7),
      bottomSheet: Container(
        padding: EdgeInsets.all(20.h),
        height: 100.h,
        decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.sp),
                topLeft: Radius.circular(40.sp))),
        child: Row(
          children: [
            Text("95 ريال"),
            SizedBox(width: .03.sw),
            Container(
                height: 30, child: Image.asset("assets/images/pay (1).jpg")),
            SizedBox(width: .2.sw),
            mainBottom(title: "انهاء الطلب", height: 50.h, width: .4.sw)
          ],
        ),
      ),
    );
  }
}

class ListModle extends StatelessWidget {
  const ListModle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffDADADA)),
          borderRadius: BorderRadius.circular(20.sp)),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) => Container(
                        padding: EdgeInsets.all(15.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.sp),
                                topLeft: Radius.circular(40.sp))),
                        height: .5.sh,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                child: Image.asset("assets/images/Bourger.png"),
                                height: 70.h,
                              ),
                              myTitle(
                                  title: "سموكي باربكيو",
                                  font: 14.sp,
                                  color: Colors.black),
                              // SizedBox(height: 5.h),
                              myTitle(
                                  title: "الاضافات",
                                  font: 14.sp,
                                  color: Colors.black),
                              Row(
                                children: [
                                  myTitle(
                                      title: "مشروم",
                                      font: 14.sp,
                                      color: Colors.black),
                                  Spacer(),
                                  myTitle(
                                      title: "2 ريال",
                                      font: 14.sp,
                                      color: Colors.black54),
                                ],
                              ),
                              Divider(color: Colors.grey),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  myTitle(
                                      title: "بصل",
                                      font: 14.sp,
                                      color: Colors.black),
                                  Spacer(),
                                  myTitle(
                                      title: "2 ريال",
                                      font: 14.sp,
                                      color: Colors.black54),
                                ],
                              ),
                              Divider(color: Colors.grey),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  myTitle(
                                      title: "حار",
                                      font: 14.sp,
                                      color: Colors.black),
                                  Spacer(),
                                  myTitle(
                                      title: "",
                                      font: 14.sp,
                                      color: Colors.black54),
                                ],
                              ),
                              Divider(color: Colors.grey),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  myTitle(
                                      title: "بيض",
                                      font: 14.sp,
                                      color: Colors.black),
                                  Spacer(),
                                  myTitle(
                                      title: "2 ريال",
                                      font: 14.sp,
                                      color: Colors.black54),
                                ],
                              ),
                              Divider(color: Colors.grey),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  myTitle(
                                      title: "الجبن",
                                      font: 14.sp,
                                      color: Colors.black),
                                  Spacer(),
                                  myTitle(
                                      title: "2 ريال",
                                      font: 14.sp,
                                      color: Colors.black54),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
            },
            child: Container(
                height: 80.h, child: Image.asset("assets/images/Bourger.png")),
          ),
          Column(
            children: [
              myTitle(title: "سموكي باربكيو", font: 14.sp, color: Colors.black),
              Row(
                children: [
                  myTitle(title: "2x", font: 14.sp, color: color1),
                  myTitle(title: "34 ريال", font: 14.sp, color: Colors.black54),
                ],
              ),
            ],
          ),
          SizedBox(width: 35.w),
          Column(
            children: [
              SizedBox(height: 25.h),
              Row(
                children: [
                  myTitle(
                      color: Colors.black54, font: 14.sp, title: "الاضافات"),
                  Icon(Icons.arrow_forward_ios, color: Colors.black54)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
