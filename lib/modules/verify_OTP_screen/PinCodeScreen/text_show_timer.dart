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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "أرسل رمز التحقق مرة أخرى",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            myTitle(
              title: "لم تتلق الرسائل القصيرة؟",
              font: 18.sp,
            )
          ],
        ),
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
