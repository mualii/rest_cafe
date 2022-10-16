import 'dart:async';

import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/modules/complete_profile_screen/completeProfileScreen.dart';
import 'package:rest_cafe/modules/save_location_screen/saveLocationScreen.dart';
import 'package:rest_cafe/modules/verify_OTP_screen/PinCodeScreen/pin_code_Input.dart';
import 'package:rest_cafe/modules/verify_OTP_screen/PinCodeScreen/text_sent_otp_again.dart';
import 'package:rest_cafe/modules/verify_OTP_screen/PinCodeScreen/text_show_timer.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/cubits/startCubit.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class PinCodePhoneScreen extends StatefulWidget {
  String PhoneUser;
  int timerStart;
  PinCodePhoneScreen({
    required this.PhoneUser,
    required this.timerStart,
  });

  @override
  _PinCodePhoneScreenState createState() => _PinCodePhoneScreenState();
}

class _PinCodePhoneScreenState extends State<PinCodePhoneScreen> {
  TextEditingController controllerPinText = TextEditingController();
  late Timer _timer;
  late int timerCount;

//==================**** Start Data *** ==============================

  @override
  void initState() {
    timerCount = widget.timerStart;
    print("timerCount = " + timerCount.toString());
    startTimer();
    super.initState();
  }

//================== Fun Start time ==============================

  void startTimer() {
    print("Run");
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (timerCount < 1) {
          //  timer.cancel();
          _timer.cancel();
        } else {
          setState(() {
            timerCount = timerCount - 1;
          });
        }
      },
    );
  }

  bool verfiy = true;

//=========================== ****** Main Build ******* ========================================

  @override
  Widget build(BuildContext context) {
    print("phone${widget.PhoneUser}");
    return WillPopScope(
      onWillPop: () async {
        _timer.cancel();
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(elevation: 0,
        title: Text(""),leading:
              new IconButton(

                icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),

        body: Center(
          child: SingleChildScrollView(
            child: Column(
              //    mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5.h),
                  child: Image.asset(
                    "assets/images/otp.png",
                    fit: BoxFit.fill,
                    scale: .75,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: .8.sw,
                      child: myTitle(
                          title: "Please enter verification code".tr(),
                          font: 18.sp),
                    ),
                    SizedBox(
                      height: .06.sh,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: .8.sw,
                        child: myTitle(
                            title: "We sent a verification code to your phone"
                                .tr(),
                            font: 18.sp)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 20,
                            child: Image.asset(
                                "assets/images/ic_action_edit.png")),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "(${widget.PhoneUser})",
                          style: TextStyle(
                              fontSize: 18.sp, color: Color(0xff555555)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: .02.sh,
                ),
                PinCodeInput(controllerPinText: controllerPinText),
                verfiy == false
                    ? Text(
                        "Wrong code".tr(),
                        style: TextStyle(color: Colors.red),
                      )
                    : Container(),
                SizedBox(
                  height: .02.sh,
                ),
                Center(
                  child: Container(
                    width: .87.sw,
                    height: 50.h,
                    margin: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      onPressed: () async {
                        var response = await DioHelper.postData(
                            endpoint: "/api/v1/auth/verify-otp",
                            context: context,
                            formData: {
                              "phone": widget.PhoneUser,
                              "otp": controllerPinText.text.trim(),
                            });
                        if (response is Response) {
                          StartCubit.get(context).saveNumber(response);
                          _timer.cancel();
                          navigateAndFinish(context, SaveLocationScreen());
                        } else {
                          setState(() {
                            verfiy = false;
                          });
                        }
                      },
                      elevation: 3,
                      child: Text(
                        "Verify".tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      color: color1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(
                  height: .03.sh,
                ),
                (timerCount > 1)
                    ? TextShowTimer(
                        timerCount: timerCount,
                      )
                    : TextSentOtpAgain(
                        FunctionSentSms: () => FunctionSentSms(),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

//========================= Row _ Sent Otp Again ========================

  void FunctionSentSms() async {
    setState(() {
      timerCount = widget.timerStart;
    });
    startTimer();
    controllerPinText.clear();

    //await ServiceSignInSms().postSignInSms(  phone: widget.phoneUser)
  }

//========================= show Error Dialog========================
  showErrorDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Text(
                "لقد ادخلت رقم خطا",
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      margin: const EdgeInsets.only(right: 2, left: 2),
                      decoration: BoxDecoration(
                          color: Color(0xff222B45),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white)),
                      width: MediaQuery.of(context).size.width * 0.28,
                      alignment: Alignment.center,
                      child: Text(
                        "تم",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
