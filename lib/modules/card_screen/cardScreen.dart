import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/add_screen/addScreen.dart';
import 'package:rest_cafe/modules/add_screen/cubit/cubit.dart';
import 'package:rest_cafe/modules/add_screen/cubit/states.dart';
import 'package:rest_cafe/modules/card_screen_2/cardScreen2.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class CardScreen extends StatelessWidget {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .91.sh,
      padding: EdgeInsets.all(10.sp),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: .15.sw),
                Center(
                    child: myTitle(
                        title: "المنتجات", font: 16.sp, color: Colors.black)),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    showDialog(
                      barrierColor: Colors.white10, //AddScreen()

                      context: context,
                      builder: (_) => Dialog(
                        insetPadding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: AddScreen(),
                      ), //AddScreen()
                      barrierDismissible: false,
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 10.h),
            Center(child: Image.asset("assets/images/cart1.png")),
            SizedBox(height: 10.h),
            Container(
              height: .6.sh,
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      ListViewCont(),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 10.h),
                  itemCount: 3),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      showDialog(
                        barrierColor: Colors.white10, //AddScreen()

                        context: context,
                        builder: (_) => Dialog(
                          insetPadding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: CardScreen2(),
                        ), //AddScreen()
                        barrierDismissible: false,
                      );
                    },
                    child: mainBottom(
                        title: "التالي", width: 150.w, height: 60.h)),
                InkWell(
                  onTap: () {
                    showDialog(
                      barrierColor: Colors.white10, //AddScreen()

                      context: context,
                      builder: (_) => Dialog(
                        insetPadding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.sp)),
                        child: AddScreen(),
                      ), //AddScreen()
                      barrierDismissible: false,
                    );
                  },
                  child: Container(
                    height: 60.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15.sp),
                        color: Colors.white10),
                    child: Center(
                      child: Text(
                        "تراجع",
                        style: TextStyle(fontSize: 16.sp, color: color1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}

class ListViewCont extends StatelessWidget {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(),
      child: BlocConsumer<AddCubit, AddState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            height: 90.h,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20.sp)),
            child: ListTile(
              leading: Container(
                  width: 60.w, child: Image.asset("assets/images/Bourger.png")),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                          barrierColor: Colors.white10, //AddScreen()
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => CupertinoAlertDialog(
                            title: myTitle(
                                font: 20.sp, color: color1, title: "حذف منتج"),
                            content: myTitle(
                                title:
                                    "  هل أنت متأكد من حذف سموكي باربكيو من قائمة المنتجات",
                                color: Colors.black,
                                font: 18.sp),
                            actions: [
                              CupertinoDialogAction(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white10),
                                    child: Center(
                                      child: Text(
                                        "تراجع",
                                        style: TextStyle(
                                            fontSize: 16, color: color1),
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoDialogAction(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: mainBottom(
                                    title: "حذف",
                                    height: 50.h,
                                    width: 100.w,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ), //AddScreen()
                        );
                      },
                      icon: Icon(Icons.delete_forever_sharp)),
                ],
              ),
              title: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: myTitle(
                        color: Colors.black,
                        font: 14.sp,
                        title: "سموكي باربكيو"),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 3.w),
                      InkWell(
                        onTap: () {
                          count =
                              AddCubit.get(context).addOneItemFromCard(count);
                        },
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xff494861),
                          ),
                          child: Icon(Icons.add),
                        ),
                      ),
                      Container(
                          height: 30.h,
                          width: 30.w,
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
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xffE7E7E7),
                          ),
                          child: Icon(FontAwesomeIcons.minus),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      myTitle(
                          color: Colors.black, font: 12.sp, title: "34 ريال"),
                      // myTitle()
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
