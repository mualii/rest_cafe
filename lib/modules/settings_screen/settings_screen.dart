import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/QuestionsScreen/QuestionsScreen.dart';
import 'package:rest_cafe/modules/profile_screen/profile_screen.dart';
import 'package:rest_cafe/shared/components/components.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomisedAppBar(
        title: 'الاعدادات',
        actions: [],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        children: [
          GestureDetector(
            onTap: (){
              navigateTo(context, ProfileScreen());

            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
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
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Text(
                        'محمد عبد الله',
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
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
            iconData: Icons.call_outlined,
            function: () {},
          ),
          SettingsOption(
            title: 'عن التطبيق',
            iconData: Icons.post_add,
            function: () {},
          ),
          SettingsOption(
            title: 'مشاركة التطبيق',
            iconData: Icons.share_outlined,
            function: () {},
          ),
          SettingsOption(
            title: 'قيم التطبيق',
            iconData: FontAwesomeIcons.thumbsUp,
            function: () {},
          ),
          SettingsOption(
            title: 'الاشتراكات',
            iconData: Icons.share_outlined,
            function: () {},
          ),
          SettingsOption(
            title: 'الاسئلة الشائعة',
            iconData: FontAwesomeIcons.fileInvoice,
            function: () {
              navigateTo(context, QuestionsScreen());
            },
          ),
          SettingsOption(
            title: 'الشروط و الاحكام',
            iconData: Icons.book,
            function: () {},
          ),
        ],
      ),
    );
  }
}
