import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/shared/components/components.dart';

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
              SizedBox(width: 20.w),
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
                  onPressed: () {},
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
          Container(
            height: .75.sh,
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
                        child: myTitle(
                            title: "السلام عليكم و رحمة الله و بركاته",
                            font: 14.sp,
                            color: Colors.white),
                      ),
                    ),
                    myTitle(
                        title: "02:21PM", font: 12.sp, color: Color(0xff767676))
                  ],
                ),
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
                        child: myTitle(
                            title: " عليكم  السلام و رحمة الله و بركاته",
                            font: 14.sp,
                            color: Colors.black),
                      ),
                    ),
                    myTitle(
                        title: "02:21PM", font: 12.sp, color: Color(0xff767676))
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
                        child: myTitle(
                            title: "اين الطعام",
                            font: 14.sp,
                            color: Colors.white),
                      ),
                    ),
                    myTitle(
                        title: "02:21PM", font: 12.sp, color: Color(0xff767676))
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: .1475.sh,
            padding: EdgeInsets.all(30.sp),
            child: defaultFormField(
              controller: massegeController,
              type: TextInputType.text,
            ),
          )
        ],
      ),
    );
  }
}
