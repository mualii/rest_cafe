import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/layout/Fuction/ScrollListener.dart';
import 'package:rest_cafe/main.dart';
import 'package:rest_cafe/modules/QuestionsScreen/QuestionsScreen.dart';
import 'package:rest_cafe/modules/branches_screen/cubit.dart';
import 'package:rest_cafe/modules/branches_screen/states.dart';
import 'package:rest_cafe/modules/contact_screen/contactScreen.dart';
import 'package:rest_cafe/modules/home_screen/cubit/HomeCubit.dart';
import 'package:rest_cafe/modules/home_screen/cubit/HomeState.dart';
import 'package:rest_cafe/modules/profile_screen/profile_screen.dart';
import 'package:rest_cafe/modules/splash_screen/splashScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/localstroage.dart';
import 'package:share/share.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool? langIsArabic = false;
String lang= LocalStorage.getData(key: "lang")=="en"?"العربية":"English";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder:(context,state)=> Scaffold(
        appBar: CustomisedAppBar(
          title: 'Settings'.tr(),
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
                          'profile'.tr(),
                          style: TextStyle(
                              fontFamily: "FrutigerLTArabic", fontSize: 20.sp),
                        ),
                        Text(
                         HomeCubit.get(context).user==null?"UserName".tr(): HomeCubit.get(context).user!.name!,
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
              title: 'call us'.tr(),
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
              title: 'About Application'.tr(),
              iconData: Container(
                  height: 30.h,
                  child: Image.asset("assets/images/ic_about_app.png")),
              function: () {},
            ),
            SettingsOption(
              title: 'Share the app'.tr(),

              iconData: Icon(
                Icons.share_outlined,
                color: Color(0xff4CB379),
                size: 30,
              ),
              function: () {Share.share('check out my website https://example.com');},
            ),
            SettingsOption(
              title: 'Rate the app'.tr(),
              iconData: Icon(
                FontAwesomeIcons.thumbsUp,
                color: Color(0xff4CB379),
                size: 30,
              ),
              function: () {},
            ),
            // SettingsOption(
            //   title: 'المشاركة',
            //   iconData: Icon(
            //     Icons.share_outlined,
            //     color: Color(0xff4CB379),
            //     size: 30,
            //   ),
            //   function: () {},
            // ),
           SettingsOption(
                    title: lang,
                    iconData: Icon(
                      Icons.language,
                      color: Color(0xff4CB379),
                      size: 25,
                    ),
                    function: () {
                      setState(() {

                        if(lang=="English") {

                          LocalStorage.saveData(key: "lang", value: "en");
                          context.setLocale(Locale('en'));
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyApp(),
                            ),
                                (route) => false,
                          );
                        }
                        else {
                          LocalStorage.saveData(key: "lang", value: "ar");
                          context.setLocale(Locale('ar'));

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyApp(),
                            ),
                                (route) => false,
                          );
                        }
                        print("bye");
                        langIsArabic = !langIsArabic!;
                      });
                    },
                  ),
    Column(
    children: [
    ListTile(
    leading: Icon(Icons.nightlight_round,color:Color(0xff4CB379),),
    title: ListTile(
        title: Text(
        "Light mode".tr(),
        style: TextStyle(fontFamily: "FrutigerLTArabic", fontSize: 16),
      ),

      trailing:  Switch(activeColor:Color(0xff4CB379),value: LocalStorage.getData(key: "theme")==null? false:true, onChanged: (v){
          setState(() {
          if(v==true)  LocalStorage.saveData(key: "theme", value: "light");
          else
            LocalStorage.removeData(key: "theme");
            Phoenix.rebirth(context);
          });

        }),

    ),

    onTap: () {

    },
    ),
    Divider()
    ],
    )

,

SettingsOption(
              title: 'Common questions'.tr(),
              iconData: Container(
                  height: 30.h, child: Image.asset("assets/images/ic_faq.png")),
              function: () {
                navigateTo(context, QuestionsScreen());
              },
            ),
            SettingsOption(
              title: 'Terms and Conditions'.tr(),
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
      ),
    );
  }
}
