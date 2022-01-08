import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/modules/Payment_screens/first_payment_screen.dart';
import 'package:rest_cafe/modules/edit_profile/edit_profile.dart';
import 'package:rest_cafe/modules/login_screen/loginScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/localstroage.dart';

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
        appBar: CustomisedAppBar(title: 'Profile'.tr(), actions: []),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          children: [
            SettingsOption(
              title: 'Edit profile'.tr(),
              iconData: Container(
                  height: 20,
                  child: Image.asset("assets/images/ic_profile_edit.png")),
              function: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => EditProfile()));
              },
            ),
            SettingsOption(
              title: 'Payment methods'.tr(),
              iconData: Container(
                  height: 27,
                  child: Image.asset("assets/images/ic_profile_payment.png")),
              function: () {
                navigateTo(context, PaymentScreen1());
              },
            ),
            SwitchListTile.adaptive(
              title: Text('Notifications'.tr()),
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
                size: 25,
              ),
            ),
            Divider(),
            SettingsOption(
              title: "Help".tr(),
              iconData: Container(
                  height: 25,
                  child: Image.asset("assets/images/ic_profile_lang.png")),
              function: () {},
            ),
            SettingsOption(
              title: 'Log out'.tr(),
              iconData: Container(
                  height: 25,
                  child: Image.asset("assets/images/ic_profile_logout.png")),
              function: () {
                AwesomeDialog(
                  context: context,
                  //dialogType: DialogType.INFO,
                  customHeader: Container(
                    child: Image.asset("assets/images/ic_error.png"),
                  ),
                  animType: AnimType.BOTTOMSLIDE,
                  title: "Log out".tr(),
                  desc: "Are you sure you want to log out ?".tr(),

                  btnOk: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);

                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side:
                                        BorderSide(color: Color(0xffC3C6D1))))),
                    child: Text(
                      "Back".tr(),
                      style: TextStyle(color: Color(0xff4CB379)),
                    ),
                  ),

                  btnCancel: ElevatedButton(
                    onPressed: () {

                      LocalStorage.removeData(key: "access_token");
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));

                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5)),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff4CB379)),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side:
                                        BorderSide(color: Color(0xffC3C6D1))))),
                    child: Text(
                      "Exit".tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )..show();

                // showDialog<String>(
                //   context: context,
                //   builder: (BuildContext context) => AlertDialogWidget(),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class LanguageDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     bool selected = false;
//     return Dialog(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(12.0))),
//       child: StatefulBuilder(builder: (context, setState) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: Container(
//             width: 0.85.sw,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'اختر اللغة',
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w200),
//                   textAlign: TextAlign.center,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: GestureDetector(
//                         child: Column(
//                           children: [
//                             Opacity(
//                               opacity: selected ? 1 : 0.6,
//                               child: Image.asset(
//                                   "assets/images/united-kingdom.png"),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text('English'),
//                           ],
//                         ),
//                         onTap: () {
//                           setState(() {
//                             selected = !selected;
//                           });
//                         },
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: GestureDetector(
//                         child: Column(
//                           children: [
//                             Opacity(
//                               opacity: selected ? 0.6 : 1,
//                               child:
//                                   Image.asset("assets/images/saudi-arabia.png"),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text('العربية'),
//                           ],
//                         ),
//                         onTap: () {
//                           setState(() {
//                             selected = !selected;
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

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
