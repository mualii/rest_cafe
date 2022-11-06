import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class ContactScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
return ContactScreenState();
  }

}
class ContactScreenState extends State<ContactScreen> {
  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var massController = TextEditingController();
  var phoneController = TextEditingController();
  bool nameError=false;
  bool emailError=false;
  bool messageError=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomisedAppBar(
        title: 'call us'.tr(),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              Row(
                children: [
                  myTitle(title: "Email".tr(),  font: 15.sp),
                  SizedBox(width: .30.sw),
                  myTitle(
                      title: "support@zoq.com",

                      font: 15.sp),
                  Icon(FontAwesomeIcons.at, )
                ],
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 10.h),
              Row(
                children: [
                  myTitle(title: "Phone".tr(), font: 15.sp),
                  SizedBox(width: .32.sw),
                  myTitle(
                      title: "543-649-3478",

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

                      font: 19.sp)),
              SizedBox(height: 20.h),
              defaultFormField(
                error: nameError,
                  controller: nameController,
                  type: TextInputType.name,
                  prefix: Icon(
                    Icons.person_outline_sharp,
                    color: color1,
                  ),
                  hint: "Name".tr()),
              SizedBox(height: 10.h),
              defaultFormField(
                 error: emailError,
                  controller: mailController,
                  type: TextInputType.emailAddress,
                  prefix: Icon(
                    Icons.email_outlined,
                    color: color1,
                  ),
                  hint: "Email".tr()),
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
                      title: 'Phone'.tr(),
                      controller: phoneController,
                      disable: false,
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
error: messageError,
                  maxLines: 20,
                  controller: massController,
                  type: TextInputType.name,
                  hint: "Write your message here".tr(),
                  height: 180.h),
              SizedBox(height: 20.h),
              InkWell(onTap: ()async{

                if(nameController.text.isEmpty)
                  setState(() {
                    nameError=true;
                  });
                if(mailController.text.isEmpty)
                  setState(() {
                    emailError=true;
                  });
                if(massController.text.isEmpty)
                  setState(() {
                    messageError=true;
                  });
                if(nameController.text.isEmpty || massController.text.isEmpty || mailController.text.isEmpty)
                  Fluttertoast.showToast(msg: "Complete required data".tr());

                await DioHelper.postData(endpoint: "api/v1/contacts", context: context,formData: {

                  "name":nameController.text,"email":mailController.text,"message":massController.text,"phone":phoneController.text

                }).then((v){

                  if ( v is Response){
                    Fluttertoast.showToast(msg: "تم الارسال");
                      Navigator.of(context).pop();}

                  else
                    Fluttertoast.showToast(msg: "حاول مجددا ");

                });
                
              },child: mainBottom(height: 50.h, title: "ارسل", width: double.infinity)),
            ],
          ),
        ),
      ),
    );
  }
}
