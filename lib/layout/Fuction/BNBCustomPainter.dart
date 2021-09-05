import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///first half circle paint
class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xff4CB379).withOpacity(.90)

    /// fill color
      ..style = PaintingStyle.fill;

    Path path = Path();

    print(size.height );
    path.moveTo(0,35.h  );
    // دية بداية اول نقطة فى الانحناء
    path.quadraticBezierTo(
        size.width / 2, -12.h,
        size.width, 35.h
    );

    //اول نقطتين يمثلوا مركز الانحناء
    // اخر نقطتين يمثلوا اخر نقطة فى الانحناء

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);






    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}