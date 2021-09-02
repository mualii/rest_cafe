import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';

class SaveLocationScreen extends StatelessWidget {
  var _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        flexibleSpace: Column(
          children: [
            SizedBox(height: 30.h),
            Text(
              "عنوان التوصيل",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            defaultFormField(
                height: 40.h,
                controller: _searchController,
                type: TextInputType.name,
                label: "بحث",
                prefix: Icons.search),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.r),
        )),
      ),
      body: Container(
        width: double.infinity,
        child: Image.asset(
          "assets/images/location.png",
          fit: BoxFit.fill,
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.sp),
                topLeft: Radius.circular(30.sp))),
        width: double.infinity,
        height: 120.h,
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    myTitle(
                        title: "Vamajo Loop",
                        font: 18.sp,
                        color: Color(0xff727272)),
                    myTitle(
                        title: "43242", font: 18.sp, color: Color(0xff727272)),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  navigateTo(context, LayoutScreen());
                },
                child: mainBottom(
                    title: "تاكيد وحفظ العنوان", height: 50.h, width: .9.sw),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
