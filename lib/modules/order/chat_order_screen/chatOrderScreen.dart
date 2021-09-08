import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class ChatOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var massegeController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
        flexibleSpace: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: 40.w),
              Container(
                height: 40.h,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
                child: Image.asset(
                  "assets/images/mac.png",
                  fit: BoxFit.fill,
                ),
              ),
              myTitle(title: "ماكدونالد", color: Colors.black, font: 16.sp),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ))
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xffF7F7F7),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              showBottomSheet(context);
            },
            child: Container(
              // height: .75.sh,
              padding: EdgeInsets.all(20.sp),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xff6A6A6A),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.sp),
                                topRight: Radius.circular(20.sp),
                                bottomLeft: Radius.circular(20.sp))),
                        child: Padding(
                          padding: EdgeInsets.all(10.0.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              myTitle(
                                  title: "السلام عليكم و رحمة الله و بركاته",
                                  font: 14.sp,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                      myTitle(
                          title: "02:21PM",
                          font: 12.sp,
                          color: Color(0xff767676))
                    ],
                  ), // title: "السلام عليكم و رحمة الله و بركاته",

                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffEAEAEA),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.sp),
                                topRight: Radius.circular(20.sp),
                                bottomRight: Radius.circular(20.sp))),
                        child: Padding(
                          padding: EdgeInsets.all(10.0.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              myTitle(
                                  title: " عليكم  السلام و رحمة الله و بركاته",
                                  font: 14.sp,
                                  color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                      myTitle(
                          title: "02:21PM",
                          font: 12.sp,
                          color: Color(0xff767676))
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xff6A6A6A),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.sp),
                                topRight: Radius.circular(20.sp),
                                bottomLeft: Radius.circular(20.sp))),
                        child: Padding(
                          padding: EdgeInsets.all(10.0.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              myTitle(
                                  title: "اين الطعام",
                                  font: 14.sp,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                      myTitle(
                          title: "02:21PM",
                          font: 12.sp,
                          color: Color(0xff767676))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
              // height: .1475.sh,
              padding: EdgeInsets.all(30.sp),
              child: defaultFormField(
                height: 80.h,
                controller: massegeController,
                type: TextInputType.text,
                hint: "اكتب رسالتك هنا",
                suffix: Image.asset("assets/images/ic_send.png"),
                prefix: SizedBox(
                    height: 0,
                    width: 0,
                    child: Image.asset("assets/images/ic_attach.png")),
              )),
        ],
      ),
    );
  }
}

showBottomSheet(BuildContext context) {
  var massegeController2 = TextEditingController();

  return showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
      ),
      builder: (ctx) {
        return SingleChildScrollView(
          child: Container(
            height: .5.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)),
              color: Color(0xffFFFFFF),
            ),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "تقييم الشيف",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "ياسمين احمد",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    RatingBarIndicator(
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: color1,
                      ),
                      itemCount: 5,
                      itemSize: 50.sp,
                      rating: 3.5,
                    ),
                    Container(
                      height: 200.h,
                      child: defaultFormField(
                          controller: massegeController2,
                          type: TextInputType.text,
                          hint: "اكتب تقييمك",
                          maxLines: 8,
                          height: 180.h),
                    ),
                    mainBottom(height: 50, width: double.infinity, title: "قيم")
                  ],
                )),
          ),
        );
      });
}
