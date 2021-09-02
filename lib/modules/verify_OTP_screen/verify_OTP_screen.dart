import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/complete_profile_screen/completeProfileScreen.dart';
import 'package:rest_cafe/modules/verify_OTP_screen/PinCodeScreen/pin_code_Input.dart';
import 'package:rest_cafe/modules/verify_OTP_screen/PinCodeScreen/text_sent_otp_again.dart';
import 'package:rest_cafe/modules/verify_OTP_screen/PinCodeScreen/text_show_timer.dart';
import 'package:rest_cafe/shared/components/components.dart';
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
        backgroundColor: Colors.white,
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
                          title: "الرجاء إدخال رمز التحقق للمتابعة",
                          font: 18.sp),
                    ),
                    SizedBox(
                      height: .13.sh,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: .8.sw,
                        child: myTitle(
                            title: "لقد أرسلنا رمز التحقق إلى رقم الجوال",
                            font: 18.sp)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.pen,
                          color: color1,
                          size: 18.sp,
                        ),
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
                PinCodeInput(
                  controllerPinText: controllerPinText,
                ),
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
                        _timer.cancel();
                        navigateAndFinish(context, CompleteProfileScreen());
                      },
                      elevation: 3,
                      child: Text(
                        "تحقق",
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
