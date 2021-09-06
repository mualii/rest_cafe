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
        Text("لم أتلق الرمز !",
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
            "ارسالها مجددا",
            style: TextStyle(
                fontFamily: "FrutigerLTArabic",
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                textBaseline: TextBaseline.alphabetic,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
