import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class ContactScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var massController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomisedAppBar(
        title: 'اتصل بنا',
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              Row(
                children: [
                  myTitle(title: "ايميل", color: Colors.black, font: 15.sp),
                  SizedBox(width: .30.sw),
                  myTitle(
                      title: "support@zoq.com",
                      color: Colors.black38,
                      font: 15.sp),
                  Icon(FontAwesomeIcons.at, color: color1)
                ],
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 10.h),
              Row(
                children: [
                  myTitle(title: "رقم هاتف", color: Colors.black, font: 15.sp),
                  SizedBox(width: .32.sw),
                  myTitle(
                      title: "543-649-3478",
                      color: Colors.black38,
                      font: 15.sp),
                  Container(
                      height: 20,
                      child: Image.asset("assets/images/ic_call.png")),
                ],
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 30.h),
              Center(
                  child: myTitle(
                      title: "التواصل مع الادارة ",
                      color: Colors.black,
                      font: 19.sp)),
              SizedBox(height: 20.h),
              defaultFormField(
                  controller: nameController,
                  type: TextInputType.name,
                  prefix: Icon(
                    Icons.person_outline_sharp,
                    color: color1,
                  ),
                  hint: "الاسم"),
              SizedBox(height: 10.h),
              defaultFormField(
                  controller: mailController,
                  type: TextInputType.emailAddress,
                  prefix: Icon(
                    Icons.email_outlined,
                    color: color1,
                  ),
                  hint: "الايميل"),
              Row(
                children: [
                  Container(
                    height: 0.075.sh,
                    width: 0.2.sw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white10),
                    child: Center(
                        child: Text(
                      '966+',
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                  Spacer(),
                  Container(
                    width: 0.65.sw,
                    child: DetailsField(
                      title: 'رقم الهاتف',
                      iconData: Icon(
                        Icons.call,
                        color: color1,
                      ),
                      isIcon: false,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              defaultFormField(
                  maxLines: 20,
                  controller: massController,
                  type: TextInputType.name,
                  hint: "نص الرسالة",
                  height: 180.h),
              SizedBox(height: 20.h),
              mainBottom(height: 50.h, title: "ارسل", width: double.infinity),
            ],
          ),
        ),
      ),
    );
  }
}
