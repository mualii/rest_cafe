import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';

class CompleteProfileScreen extends StatelessWidget {
  var _nameController = TextEditingController();
  var _mailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //  File _image;
    //  Future getImage()async{
    //    final ImagePicker _picker = ImagePicker();
    // final   _image  = await _picker.pickImage(source: ImageSource.gallery);
    //  }
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.r),
        )),
        title: myTitle(
            color: Colors.black, title: "اكمل الملف الشخصي", font: 18.sp),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Center(
            child: myTitle(font: 14.sp, title: "تخطي", color: Colors.black)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Image.asset(
              "assets/images/logoTakeImage.png",
            ),
            SizedBox(height: 20.h),
            Container(
              width: .8.sw,
              child: defaultFormField(
                  controller: _nameController,
                  type: TextInputType.name,
                  hint: "الاسم",
                  color: Color(0xff4CB379),
                  prefix: (Icons.person_outline)),
            ),
            SizedBox(height: 15.h),
            Container(
              width: .8.sw,
              child: defaultFormField(
                  controller: _mailController,
                  type: TextInputType.emailAddress,
                  hint: "الايميل  اختيارى",
                  color: Color(0xff4CB379),
                  prefix: (Icons.email_outlined)),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                navigateAndFinish(context, LayoutScreen());
              },
              child:
                  mainBottom(title: "اكمل الملف", width: .8.sw, height: 50.h),
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}
