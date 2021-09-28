import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/layout/Fuction/ScrollListener.dart';
import 'package:rest_cafe/modules/QuestionsScreen/QuestionsScreen.dart';
import 'package:rest_cafe/modules/contact_screen/contactScreen.dart';
import 'package:rest_cafe/modules/profile_screen/profile_screen.dart';
import 'package:rest_cafe/shared/components/components.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool? langIsArabic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomisedAppBar(
        title: 'الاعدادات',
        actions: [],
      ),
      body: ListView(
        controller: scrollController,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        children: [
          GestureDetector(
            onTap: () {
              navigateTo(context, ProfileScreen());
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15.h),
              height: 0.15.sh,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff4CB379)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.06.sw),
                    height: 0.16.sw,
                    width: 0.16.sw,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      Icons.person_outline,
                      color: Color(0xff4CB379),
                      size: 30.sp,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'البروفايل',
                        style: TextStyle(
                            fontFamily: "FrutigerLTArabic", fontSize: 20.sp),
                      ),
                      Text(
                        'محمد عبد الله',
                        style: TextStyle(
                            fontFamily: "FrutigerLTArabic",
                            fontSize: 18.sp,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          SettingsOption(
            title: 'اتصل بنا',
            iconData: Icon(
              Icons.call_outlined,
              color: Color(0xff4CB379),
              size: 30,
            ),
            function: () {
              navigateTo(context, ContactScreen());
            },
          ),
          SettingsOption(
            title: 'عن التطبيق',
            iconData: Container(
                height: 30.h,
                child: Image.asset("assets/images/ic_about_app.png")),
            function: () {},
          ),
          SettingsOption(
            title: 'مشاركة التطبيق',
            iconData: Icon(
              Icons.share_outlined,
              color: Color(0xff4CB379),
              size: 30,
            ),
            function: () {},
          ),
          SettingsOption(
            title: 'تقييم التطبيق',
            iconData: Icon(
              FontAwesomeIcons.thumbsUp,
              color: Color(0xff4CB379),
              size: 30,
            ),
            function: () {},
          ),
          SettingsOption(
            title: 'الاشتراكات',
            iconData: Icon(
              Icons.share_outlined,
              color: Color(0xff4CB379),
              size: 30,
            ),
            function: () {},
          ),
          langIsArabic!
              ? SettingsOption(
                  title: 'اللغة',
                  iconData: Icon(
                    Icons.language,
                    color: Color(0xff4CB379),
                    size: 25,
                  ),
                  function: () {
                    setState(() {
                      langIsArabic = !langIsArabic!;
                      print("hi");
                    });
                  },
                )
              : SettingsOption(
                  title: "English",
                  iconData: Icon(
                    Icons.language,
                    color: Color(0xff4CB379),
                    size: 25,
                  ),
                  function: () {
                    setState(() {
                      print("bye");
                      langIsArabic = !langIsArabic!;
                    });
                  },
                ),
          SettingsOption(
            title: 'الاسئلة الشائعة',
            iconData: Container(
                height: 30.h, child: Image.asset("assets/images/ic_faq.png")),
            function: () {
              navigateTo(context, QuestionsScreen());
            },
          ),
          SettingsOption(
            title: 'الشروط و الاحكام',
            iconData: Container(
              height: 30.h,
              child: Image.asset("assets/images/ic_faq.png"),
            ),
            function: () {},
          ),
          SizedBox(
            height: 50.h,
          )
        ],
      ),
    );
  }
}
