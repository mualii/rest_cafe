import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/card_screen/cardScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class CardScreen2 extends StatelessWidget {
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
                        child: CardScreen(),
                      ), //AddScreen()
                      barrierDismissible: false,
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 15.h),
            Center(child: Image.asset("assets/images/card2.png")),
            SizedBox(height: 15.h),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.sp)),
              child: InkWell(
                onTap: () {
                  showDialog(
                    barrierColor: Colors.white10, //AddScreen()

                    context: context,
                    builder: (_) => Dialog(
                      insetPadding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: DeliveryScreen(),
                    ), //AddScreen()
                    barrierDismissible: false,
                  );
                },
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.circle_outlined,
                      color: Colors.black12,
                      size: 30.sp,
                    ),
                    myTitle(title: "للسيارة", color: Colors.black, font: 16.sp),
                    myTitle(
                        title: "2 ريال", color: Colors.black45, font: 12.sp),
                    SizedBox(width: .35.sw),
                    Image.asset("assets/images/m1.png")
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.sp)),
              child: Row(
                children: [
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.black12,
                    size: 30.sp,
                  ),
                  myTitle(
                      title: "الذهاب للمطعم", color: Colors.black, font: 16.sp),
                  SizedBox(width: .4.sw),
                  Image.asset("assets/images/m2.png")
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.sp)),
              child: InkWell(
                onTap: () {
                  showDialog(
                    barrierColor: Colors.white10, //AddScreen()

                    context: context,
                    builder: (_) => Dialog(
                      insetPadding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: BookingScreen(),
                    ), //AddScreen()
                    barrierDismissible: false,
                  );
                },
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.circle_outlined,
                      color: Colors.black12,
                      size: 30.sp,
                    ),
                    myTitle(
                        title: "حجز طاولة", color: Colors.black, font: 16.sp),
                    SizedBox(width: .4.sw),
                    Image.asset("assets/images/m3.png")
                  ],
                ),
              ),
            ),
            SizedBox(height: .4.sh),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    // onTap: () {
                    //   showDialog(
                    //     barrierColor: Colors.white10, //AddScreen()
                    //
                    //     context: context,
                    //     builder: (_) => Dialog(
                    //       insetPadding: EdgeInsets.all(20),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20)),
                    //       child: CardScreen2(),
                    //     ), //AddScreen()
                    //     barrierDismissible: false,
                    //   );
                    // },
                    child:
                        mainBottom(title: "التالي", width: 150.w, height: 60)),
                InkWell(
                  onTap: () {
                    showDialog(
                      barrierColor: Colors.white10, //AddScreen()

                      context: context,
                      builder: (_) => Dialog(
                        insetPadding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: CardScreen(),
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
                        style: TextStyle(fontSize: 16, color: color1),
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

class DeliveryScreen extends StatelessWidget {
  var carModelController = TextEditingController();
  var carNumberController = TextEditingController();
  var carColorController = TextEditingController();
  bool isOld = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: .6.sh,
      padding: EdgeInsets.all(10.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: .15.sw),
              Center(
                  child: myTitle(
                      title: "التوصيل (للسيارة)",
                      font: 16.sp,
                      color: Colors.black)),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  // showDialog(
                  //   barrierColor: Colors.white10, //AddScreen()
                  //
                  //   context: context,
                  //   builder: (_) => Dialog(
                  //     insetPadding: EdgeInsets.all(20),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20)),
                  //     child: CardScreen(),
                  //   ), //AddScreen()
                  //   barrierDismissible: false,
                  // );
                },
              )
            ],
          ),
          if (isOld == true)
            Column(
              children: [
                myTitle(
                    title: "بيانات سيارة مسجلة",
                    font: 16.sp,
                    color: Colors.black),
                Container(
                  height: 90.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.0.sp, right: 15.sp),
                        child: Row(
                          children: [
                            myTitle(
                                title: "نوع السيارة",
                                color: Colors.black,
                                font: 16.sp),
                            myTitle(
                                title: "نيسان",
                                color: Colors.black,
                                font: 14.sp),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0.sp, right: 15.sp),
                        child: Row(
                          children: [
                            myTitle(
                                title: "رقم اللوحة",
                                color: Colors.black,
                                font: 16.sp),
                            myTitle(
                                title: "345667",
                                color: Colors.black,
                                font: 14.sp),
                            SizedBox(width: 20.w),
                            myTitle(
                                title: "للون السيارة",
                                color: Colors.black,
                                font: 16.sp),
                            myTitle(
                                title: "ازرق ",
                                color: Colors.black,
                                font: 14.sp),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          SizedBox(height: 20.h),
          Column(
            children: [
              myTitle(
                  title: "اضافة سيارة جديدة", color: Colors.black, font: 16.sp),
              SizedBox(height: 10.h),
              defaultFormField(
                type: TextInputType.name,
                controller: carModelController,
                label: "نوع السيارة",
                prefix: FontAwesomeIcons.car,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(width: 10.w),
                  Container(
                    width: 140.w,
                    child: defaultFormField(
                      type: TextInputType.name,
                      controller: carModelController,
                      label: "رقم اللوحة",
                      prefix: FontAwesomeIcons.listOl,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Container(
                    width: 140.w,
                    child: defaultFormField(
                      type: TextInputType.name,
                      controller: carModelController,
                      label: "للون السيارة",
                      prefix: FontAwesomeIcons.swatchbook,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10.w),
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
                  child: mainBottom(title: "اضف", width: 150.w, height: 60)),
            ],
          ),
        ],
      ),
    );
  }
}

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();

  static void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Done'),
            onPressed: onClicked,
          ),
        ),
      );
}

class _BookingScreenState extends State<BookingScreen> {
  var carModelController = TextEditingController();

  var value;
  var value2;
  bool isOld = true;
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: .6.sh,
      padding: EdgeInsets.all(10.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: .15.sw),
              Center(
                  child: myTitle(
                      title: "التوصيل (حجز طاولة)",
                      font: 16.sp,
                      color: Colors.black)),
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
                      child: CardScreen2(),
                    ), //AddScreen()
                    barrierDismissible: false,
                  );
                },
              )
            ],
          ),
          SizedBox(height: 20.h),
          Column(
            children: [
              defaultFormField(
                type: TextInputType.name,
                controller: carModelController,
                label: "نوع عدد الافراد",
                prefix: FontAwesomeIcons.userFriends,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () => BookingScreen.showSheet(
                      context,
                      child: buildDatePicker(),
                      onClicked: () {
                        value = DateFormat('yyyy/MM/dd').format(dateTime);

                        Navigator.pop(context);
                      },
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(10.sp)),
                        width: 140.w,
                        height: 50.h,
                        child: Row(
                          children: [
                            SizedBox(width: 10.w),
                            Icon(FontAwesomeIcons.calendar),
                            SizedBox(width: 10.w),
                            Text((value == null) ? "اليوم" : value.toString()),
                          ],
                        )),
                  ),
                  SizedBox(width: 20.w),
                  InkWell(
                    onTap: () => BookingScreen.showSheet(
                      context,
                      child: buildTimePicker(),
                      onClicked: () {
                        value2 = DateFormat('HH:mm').format(dateTime);

                        Navigator.pop(context);
                      },
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(10.sp)),
                        width: 140.w,
                        height: 50.h,
                        child: Row(
                          children: [
                            SizedBox(width: 10.w),
                            Icon(FontAwesomeIcons.clock),
                            SizedBox(width: 10.w),
                            Text(
                                (value2 == null) ? "الساعة" : value2.toString())
                          ],
                        )),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10.w),
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
                  child: mainBottom(title: "اضف", width: 150.w, height: 60)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: DateTime.now().year,
          maximumYear: DateTime.now().year + 1,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
  Widget buildTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 10,
          //use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
