
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// the second half circle paint
class BNBCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xff41AA6E)
      ..style = PaintingStyle.fill;

    Path path = Path();


    path.moveTo(0,80.h  );
    // دية بداية اول نقطة فى الانحناء
    path.quadraticBezierTo(
        size.width / 2,
        40.h,
        size.width, 80.h
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
