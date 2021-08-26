import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  String? hint,
  Color? color,
  int? maxLines,
  VoidCallback? onTap,
  bool isPassword = false,
  String? Function(String?)? validate,
  String? label,
  IconData? prefix,
  IconData? suffix,
  double? height = 50,
  VoidCallback? suffixPressed,
  bool isClickable = true,
}) =>
    Container(
      height: height,
      width: .9.sw,
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Color(0xffAAAAAA),
            fontSize: 16,
          ),
          labelStyle: TextStyle(
            color: Color(0xffAAAAAA),
          ),
          labelText: label,
          prefixIcon: Icon(
            prefix,
            color: color,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );
Widget myTitle({String? title, double? font, Color? color}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.w),
    child: Text(
      title!,
      style: TextStyle(fontSize: font!, color: color),
    ),
  );
}

Widget mainBottom({double? width, double? height, String? title}) {
  return Container(
    height: height,
    width: width,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), color: color1),
    child: Center(
      child: Text(
        title!,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    ),
  );
}
