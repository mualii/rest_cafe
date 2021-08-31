import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/add_screen/cubit/cubit.dart';
import 'package:rest_cafe/modules/add_screen/cubit/states.dart';
import 'package:rest_cafe/modules/card_screen/cardScreen.dart';
import 'package:rest_cafe/modules/detail_screen/detailScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class AddScreen extends StatelessWidget {
  bool ischange = false;
  bool ischange2 = false;
  bool ischange3 = false;
  bool ischange4 = false;
  bool ischange5 = false;
  bool ischange6 = false;
  bool ischange7 = false;

  int count = 1;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(),
      child: BlocConsumer<AddCubit, AddState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(10.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite_border_outlined),
                      SizedBox(width: .65.sw),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          navigateAndFinish(context, DetailScreen());
                        },
                      )
                    ],
                  ),
                  Center(child: Image.asset("assets/images/Bourger.png")),
                  Center(
                      child: myTitle(
                          title: "سموكي باربكيو",
                          font: 14.sp,
                          color: Colors.black)),
                  ListTile(
                    title: myTitle(
                        title: "مشروم", color: Colors.black, font: 14.sp),
                    trailing: myTitle(
                        title: "2 ريال", color: Colors.black, font: 14.sp),
                    leading: Checkbox(
                        value: ischange,
                        onChanged: (bool? value) {
                          bool i =
                              AddCubit.get(context).onChangedCheckBox(ischange);
                          ischange = i;
                        }),
                  ),
                  Divider(),
                  ListTile(
                    title:
                        myTitle(title: "بصل", color: Colors.black, font: 14.sp),
                    trailing: myTitle(
                        title: "2 ريال", color: Colors.black, font: 14.sp),
                    leading: Checkbox(
                        value: ischange2,
                        onChanged: (bool? value) {
                          bool i = AddCubit.get(context)
                              .onChangedCheckBox(ischange2);
                          ischange2 = i;
                        }),
                  ),
                  Divider(),
                  ListTile(
                    title:
                        myTitle(title: "حار", color: Colors.black, font: 14.sp),
                    trailing: myTitle(
                        title: "2 ريال", color: Colors.black, font: 14.sp),
                    leading: Checkbox(
                        value: ischange3,
                        onChanged: (bool? value) {
                          bool i = AddCubit.get(context)
                              .onChangedCheckBox(ischange3);
                          ischange3 = i;
                        }),
                  ),
                  Divider(),
                  ListTile(
                    title:
                        myTitle(title: "بيض", color: Colors.black, font: 14.sp),
                    trailing: myTitle(
                        title: "2 ريال", color: Colors.black, font: 14.sp),
                    leading: Checkbox(
                        value: ischange4,
                        onChanged: (bool? value) {
                          bool i = AddCubit.get(context)
                              .onChangedCheckBox(ischange4);
                          ischange4 = i;
                        }),
                  ),
                  Divider(),
                  ListTile(
                    title: myTitle(
                        title: "الجبن", color: Colors.black, font: 14.sp),
                    trailing: myTitle(
                        title: "2 ريال", color: Colors.black, font: 14.sp),
                    leading: Checkbox(
                        value: ischange5,
                        onChanged: (bool? value) {
                          bool i = AddCubit.get(context)
                              .onChangedCheckBox(ischange5);
                          ischange5 = i;
                        }),
                  ),
                  Divider(),
                  ListTile(
                    title: myTitle(
                        title: "هلابينو", color: Colors.black, font: 14.sp),
                    trailing: myTitle(
                        title: "2 ريال", color: Colors.black, font: 14.sp),
                    leading: Checkbox(
                        value: ischange6,
                        onChanged: (bool? value) {
                          bool i = AddCubit.get(context)
                              .onChangedCheckBox(ischange6);
                          ischange6 = i;
                        }),
                  ),
                  Divider(),
                  // SizedBox(height: 15.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                insetPadding: EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: CardScreen(),
                              );
                            },
                            barrierColor: Colors.white10, //AddScreen()
                          );

                          // navigateAndFinish(context, CardScreen());
                        },
                        child: mainBottom(
                            title: "اضافة  35  ريال",
                            height: 50.h,
                            width: 140.w),
                      ),
                      SizedBox(width: 20.w),
                      InkWell(
                        onTap: () {
                          count =
                              AddCubit.get(context).addOneItemFromCard(count);
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xff494861),
                          ),
                          child: Icon(Icons.add),
                        ),
                      ),
                      Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: Center(
                            child: myTitle(
                                color: color1, title: "$count", font: 30.sp),
                          )),
                      InkWell(
                        onTap: () {
                          count =
                              AddCubit.get(context).MinusOneItemFromCard(count);
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xffE7E7E7),
                          ),
                          child: Icon(FontAwesomeIcons.minus, size: 20.sp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
