import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextSentOtpAgain extends StatelessWidget {
  VoidCallback FunctionSentSms;

  TextSentOtpAgain({required this.FunctionSentSms});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("I didn't receive a code".tr(),
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: "FrutigerLTArabic",
            )),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          onTap: FunctionSentSms,
          child: Text(
            "Send again".tr(),
            style: TextStyle(
                fontFamily: "FrutigerLTArabic",
                fontSize: 16.sp,
                textBaseline: TextBaseline.alphabetic,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
