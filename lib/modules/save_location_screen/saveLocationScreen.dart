import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
            ),
            defaultFormField(
                height: 30.h,
                controller: _searchController,
                type: TextInputType.name,
                label: "بحث",
                prefix: Icons.search),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Image.asset("assets/images/location.png"),
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
                child: myTitle(
                    title: "1115 Vamajo Loop",
                    font: 18.sp,
                    color: Color(0xff727272)),
              ),
              SizedBox(height: 10.h),
              mainBottom(
                  title: "تاكيد وحفظ العنوان", height: 50.h, width: .9.sw),
            ],
          ),
        ),
      ),
    );
  }
}
