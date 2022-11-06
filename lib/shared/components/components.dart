import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

Widget defaultFormField({
 double ?width,
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  String? hint,
  Color? color,
bool error=false,
  int? maxLines,

  VoidCallback? onTap,
  VoidCallback? onEditingComplete,
  bool isPassword = false,
  String? Function(String?)? validate,
  String? label,
  Widget? prefix,
  Widget? suffix,
  double? height = 50,
  VoidCallback? suffixPressed,
  bool isClickable = true,
}) =>
    Center(
      child: Container(
        // padding: EdgeInsets.zero,
        // decoration: BoxDecoration(
        //     border: Border.all(color: Colors.grey),
        //     borderRadius: BorderRadius.circular(10)),
        height: height,
        width: width==null ?0.9.sw:width,
        child: TextFormField(

          onEditingComplete: onEditingComplete,
          maxLines: maxLines,

          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          enabled: isClickable,
          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          onTap: onTap,
          validator: validate,
          textAlign: TextAlign.start,

          decoration: InputDecoration(

            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color:error==true ?Colors.red :Colors.grey,
                )),
            contentPadding: EdgeInsets.all(8),
            hintText: hint,
            hintStyle: TextStyle(
              color: Color(0xffAAAAAA),
              fontSize: 16,
            ),
            labelStyle: TextStyle(
              fontSize: 12,
              color: Color(0xffAAAAAA),
            ),
            labelText: label,
            prefixIcon: prefix,
            // color: color,

            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: suffix,
                  )
                : null,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
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
Widget myTitle({String? title, double? font, Color? color,int? lines}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 6.w),
    child: Text(
      title!,maxLines: lines,
      style: TextStyle(
          fontSize: font!, color: color, fontFamily: "FrutigerLTArabic"),
    ),
  );
}

Widget mainBottom({double? width, double? height, String? title}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp), color: color1),
    child: Center(
      child: Text(
        title!,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontFamily: "FrutigerLTArabic",
        ),
      ),
    ),
  );
}

class CustomisedAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final List<Widget> actions;

  CustomisedAppBar({required this.title, required this.actions});

  @override
  Size get preferredSize => Size.fromHeight(0.08.sh);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AppBar(
        iconTheme:
            IconThemeData( size: 25 //change your color here
                ),
        title: Text(
          title!,
          style: TextStyle(
              fontFamily: "FrutigerLTArabic",

              fontWeight: FontWeight.w100),
        ),
        // toolbarHeight: 0.12.sh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.r),
          ),
        ),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.grey,
        //   ),
        // ),
        actions: actions,

      ),
    );
  }
}

class DetailsField extends StatelessWidget {
  final String title;
  final Widget iconData;
  final bool? isNumeric;
  final bool? isIcon;
  final bool? isBorder;
  final bool? disable;
 TextEditingController ?controller;
  DetailsField({
    required this.title,
    required this.iconData,
    this.isNumeric = false,
    this.isBorder = false,
    this.isIcon = true,
    this.controller,
    this.disable
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller:controller ,
        readOnly: disable!,
        keyboardType: isNumeric! ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 12),
            filled: true,
            fillColor: Colors.white10,
            hintText: title,
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: isIcon == true
                ? iconData
                : Container(
                    width: 1,
                  ),
            // color: Color(0xff4CB379),
            // size: isIcon == true ? 25 : 0,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0.8, color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: 0.8, color: Colors.grey),
            )),
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String title;
  final Function function;
  var iconData;
  SettingsOption(
      {Key? key,
      required this.title,
      required this.function,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: iconData,
          title: Text(
            title,
            style: TextStyle(fontFamily: "FrutigerLTArabic", fontSize: 16),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            return function();
          },
        ),
        Divider()
      ],
    );
  }
}

class CircleCheckBox extends StatelessWidget {
  bool select;
  ValueChanged<bool> onValueChanged;

  CircleCheckBox({
    required this.select,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        select = !select;

        onValueChanged(select);

        print(select);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5.h),
        child: Row(
          children: [
            Center(
                child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: select ? color1 : Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: select
                    ? Icon(
                        Icons.check,
                        size: 22.0.sp,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
                        size: 22.0.sp,
                        color: select ? color1 : Colors.white,
                      ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
