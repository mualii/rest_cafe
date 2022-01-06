import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/shared/components/components.dart';

class TextShowTimer extends StatelessWidget {
  int timerCount;

  TextShowTimer({required this.timerCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     myTitle(
        //       title: "didn't re",
        //       font: 16.sp,
        //     ),
        //     Text(
        //       "أرسل رمز التحقق مرة أخرى",
        //       style: TextStyle(
        //         fontFamily: "FrutigerLTArabic",
        //         fontSize: 16.sp,
        //         textBaseline: TextBaseline.alphabetic,
        //       ),
        //     ),
        //   ],
        // ),
        Padding(
          padding: EdgeInsets.all(8.h),
          child: Text(
            "${timerCount.toString()}  second",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
