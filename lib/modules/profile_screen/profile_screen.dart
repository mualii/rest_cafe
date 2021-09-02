import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/Payment_screens/first_payment_screen.dart';
import 'package:rest_cafe/modules/edit_profile/edit_profile.dart';
import 'package:rest_cafe/shared/components/components.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notificationsToggle = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: CustomisedAppBar(title: 'البروفايل', actions: []),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          children: [
            SettingsOption(
              title: 'تعديل الملف الشخصي',
              iconData: Icon(
                Icons.person,
                color: Color(0xff4CB379),
                size: 30,
              ),
              function: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => EditProfile()));
              },
            ),
            SettingsOption(
              title: 'وسائل الدفع',
              iconData: Icon(
                Icons.payment,
                color: Color(0xff4CB379),
                size: 30,
              ),
              function: () {
                navigateTo(context, PaymentScreen1());
              },
            ),
            SettingsOption(
              title: 'اللغة',
              iconData: Icon(
                Icons.language,
                color: Color(0xff4CB379),
                size: 30,
              ),
              function: () {
                return showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => LanguageDialog());
              },
            ),
            SwitchListTile.adaptive(
              title: Text('الاشعارات'),
              value: notificationsToggle,
              onChanged: (bool value) {
                setState(() {
                  notificationsToggle = value;
                });
              },
              activeColor: Colors.green,
              secondary: Icon(
                Icons.notifications_none,
                color: Color(0xff4CB379),
                size: 30,
              ),
            ),
            Divider(),
            SettingsOption(
              title: 'تريد مساعدة',
              iconData: Icon(
                FontAwesomeIcons.lifeRing,
                color: Color(0xff4CB379),
                size: 30,
              ),
              function: () {},
            ),
            SettingsOption(
              title: 'تسجيل خروج',
              iconData: Icon(
                FontAwesomeIcons.signOutAlt,
                color: Color(0xff4CB379),
                size: 30,
              ),
              function: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialogWidget(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            width: 0.85.sw,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'اختر اللغة',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        child: Column(
                          children: [
                            Opacity(
                              opacity: selected ? 1 : 0.6,
                              child: Image.asset(
                                  "assets/images/united-kingdom.png"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('English'),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            selected = !selected;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        child: Column(
                          children: [
                            Opacity(
                              opacity: selected ? 0.6 : 1,
                              child:
                                  Image.asset("assets/images/saudi-arabia.png"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('العربية'),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            selected = !selected;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class AlertDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.only(top: 0.04.sh, bottom: 10),
            height: 0.32.sh,
            width: 0.8.sw,
            child: Column(
              children: [
                Text(
                  'تسجيل خروج',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: 0.5.sw,
                  child: const Text(
                    'هل أنت متأكد من تسجيل خروجك بالتطبيق',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'خروج'),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .067,
                        child: Center(
                          child: Text(
                            'خروج',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * .3,
                        decoration: BoxDecoration(
                          color: Color(0xff4CB379),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'تراجع'),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .067,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffC3C6D1))),
                        child: Center(
                          child: Text(
                            'تراجع',
                            style: TextStyle(color: Color(0xff4CB379)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * .3,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
              bottom: 535.h,
              right: 0.32.sw,
              child: Image.asset('assets/images/Group.png')),
        ],
      ),
    );
  }
}
