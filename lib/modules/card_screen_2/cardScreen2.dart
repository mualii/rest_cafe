import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rest_cafe/modules/card_screen/cardScreen.dart';
import 'package:rest_cafe/modules/card_screen_2/cubit/delivery_cubit.dart';
import 'package:rest_cafe/modules/card_screen_2/cubit/delivery_state.dart';
import 'package:rest_cafe/modules/card_screen_3/cardScreen3.dart';
import 'package:rest_cafe/shared/Model/set_order_model.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class CardScreen2 extends StatelessWidget {
  final bool? hasCar;
  final bool? hasTabol;

  const CardScreen2({
    this.hasCar = false,
    this.hasTabol = false,
  });
  @override
  Widget build(BuildContext context) {

    bool isChecked1 = true;
    bool isChecked2 = true;
    bool isChecked3 = true;
    return
 BlocConsumer<DeliveryCubit,DeliveryState>(
        listener: (context,state){},
        builder:(context,state)=> StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => state is CarsLoadingState? Center(child: CircularProgressIndicator()) :Container(
            height: .91.sh,
            padding: EdgeInsets.all(10.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: .14.sw),
                    myTitle(title: "التوصيل", font: 16.sp, color: Colors.black),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                          showDialog(
                            barrierColor: Colors.white10, //AddScreen()

                            context: context,
                            builder: (_) => Dialog(
                              insetPadding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: CardScreen(),
                            ), //AddScreen()
                            barrierDismissible: true,
                          );
                        })
                  ],
                ),
                SizedBox(height: 15.h),
                Center(child: Image.asset("assets/images/card2.png")),
                SizedBox(height: 15.h),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // height: 100.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20.sp)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10.w),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isChecked1 = !isChecked1;
                                      isChecked2 = true;
                                      isChecked3 = true;
                                    });
                                  },
                                  child: isChecked1
                                      ? Icon(
                                          Icons.circle_outlined,
                                          color: Colors.black12,
                                          size: 30.sp,
                                        )
                                      : Icon(
                                          Icons.circle,
                                          color: color1,
                                          size: 30.sp,
                                        ),
                                ),
                                myTitle(
                                    title: "للسيارة",
                                    color: Colors.black,
                                    font: 16.sp),
                                myTitle(
                                    title: "2 ريال",
                                    color: Colors.black45,
                                    font: 12.sp),
                                SizedBox(width: .32.sw),
                                Container(
                                    height: 50.h,
                                    width: 40.w,
                                    child: Image.asset(
                                        "assets/images/ic_delivery_car.png"))
                              ],
                            ),
                            if (hasCar! || isChecked1 == false)
                              Column(
                                children: [
                                  Divider(
                                    color: Colors.black38,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();

                                      showDialog(
                                        barrierColor: Colors.white10, //AddScreen()

                                        context: context,
                                        builder: (_) => Dialog(
                                          insetPadding: EdgeInsets.all(20),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: DeliveryScreen(),
                                        ), //AddScreen()
                                        barrierDismissible: true,
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(width: 40.w),
                                        myTitle(
                                            title: DeliveryCubit.get(context).cars.isEmpty? "اضف سيارة":"${DeliveryCubit.get(context).cars[0].plateNumber} | ${DeliveryCubit.get(context).cars[0].color} | ${DeliveryCubit.get(context).cars[0].brand}",
                                            color: Colors.black38,
                                            font: 16.sp),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black38,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  )
                                ],
                              ),
                          ],
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
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isChecked2 = !isChecked2;
                                  isChecked1 = true;
                                  isChecked3 = true;
                                });
                              },
                              child: isChecked2
                                  ? Icon(
                                      Icons.circle_outlined,
                                      color: Colors.black12,
                                      size: 30.sp,
                                    )
                                  : Icon(
                                      Icons.circle,
                                      color: color1,
                                      size: 30.sp,
                                    ),
                            ),
                            myTitle(
                                title: "الذهاب للمطعم",
                                color: Colors.black,
                                font: 16.sp),
                            SizedBox(width: .30.sw),
                            Image.asset("assets/images/m2.png")
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20.sp)),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    SizedBox(width: 10.w),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isChecked1 = true;
                                          isChecked2 = true;

                                          isChecked3 = !isChecked3;
                                        });
                                      },
                                      child: isChecked3
                                          ? Icon(
                                              Icons.circle_outlined,
                                              color: Colors.black12,
                                              size: 30.sp,
                                            )
                                          : Icon(
                                              Icons.circle,
                                              color: color1,
                                              size: 30.sp,
                                            ),
                                    ),
                                    myTitle(
                                        title: "حجز طاولة",
                                        color: Colors.black,
                                        font: 16.sp),
                                    SizedBox(width: .40.sw),
                                    Image.asset("assets/images/3.png")
                                  ],
                                ),
                                SizedBox(height: 10),
                                if (hasTabol! || isChecked3 == false)
                                  Column(
                                    children: [
                                      Divider(
                                        color: Colors.black38,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context, rootNavigator: true)
                                              .pop();

                                          showDialog(
                                            barrierColor:
                                                Colors.white10, //AddScreen()

                                            context: context,
                                            builder: (_) => Dialog(
                                              insetPadding: EdgeInsets.all(20),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20)),
                                              child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            new FocusNode());
                                                  },
                                                  child: BookingScreen()),
                                            ), //AddScreen()
                                            barrierDismissible: true,
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // SizedBox(width: 40.w),
                                            myTitle(
                                                title:
                                                   DeliveryCubit.get(context).setorder.reservation !=null?"${DeliveryCubit.get(context).setorder.reservation!.date.toString()} | ${DeliveryCubit.get(context).setorder.reservation!.time} | ${DeliveryCubit.get(context).setorder.reservation!.persons} ":"استكمال البيانات ",
                                                color: Colors.black38,
                                                font: 16.sp),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black38,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pop();
DeliveryCubit.get(context).setorder.type=isChecked1 == false ? "vehicle":isChecked2 == false ?"pickup":"reservation";


showDialog(
                            barrierColor: Colors.white10, //AddScreen()

                            context: context,
                            builder: (_) => Dialog(
                              insetPadding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: CardScreen3(),
                            ), //AddScreen()
                            barrierDismissible: true,
                          );
                        },
                        child:
                            mainBottom(title: "التالي", width: 150.w, height: 60)),
                    InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();

                        showDialog(
                          barrierColor: Colors.white10, //AddScreen()

                          context: context,
                          builder: (_) => Dialog(
                            insetPadding: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: CardScreen(),
                          ), //AddScreen()
                          barrierDismissible: true,
                        );
                      },
                      child: Container(
                        height: 60.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp),
                            color: Colors.white10),
                        child: Center(
                          child: Text(
                            "السابق",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "FrutigerLTArabic"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                // SizedBox(height: 15.h),
              ],
            ),
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
      height: .60.sh,
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
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();

                  showDialog(
                    barrierColor: Colors.white10, //AddScreen()

                    context: context,
                    builder: (_) => Dialog(
                      insetPadding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: CardScreen2(),
                    ), //AddScreen()
                    barrierDismissible: true,
                  );
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
                  height: 100,
                  child: ListView.builder(
                    itemCount: DeliveryCubit.get(context).cars.length,
                    itemBuilder: (context,index)=>
                      Container(
                        height: 100,
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
                                      title: DeliveryCubit.get(context).cars[index].brand,
                                      color: Colors.grey,
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
                                      title:  DeliveryCubit.get(context).cars[index].plateNumber,
                                      color: Colors.grey,
                                      font: 14.sp),
                                  SizedBox(width: 8.w),
                                  myTitle(
                                      title: "للون السيارة",
                                      color: Colors.black,
                                      font: 16.sp),
                                  myTitle(
                                      title: DeliveryCubit.get(context).cars[index].color,
                                      color: Colors.grey,
                                      font: 14.sp),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

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
              Row(
                children: [
                  SizedBox(width: 10.w),
                  Container(
                    width: .76.sw,
                    child: defaultFormField(
                        type: TextInputType.name,
                        controller: carModelController,
                        label: "نوع السيارة",
                        prefix: Image.asset("assets/images/4.png"),
                        color: color1),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(width: 10.w),
                  Container(
                    width: 140.w,
                    child: defaultFormField(
                        type: TextInputType.number,
                        controller: carNumberController,
                        label: "رقم اللوحة",
                        prefix: Image.asset("assets/images/5.png"),
                        color: color1),
                  ),
                  SizedBox(width: 20.w),
                  Container(
                    width: 140.w,
                    child: defaultFormField(
                        type: TextInputType.name,
                        controller: carColorController,
                        label: "لون السيارة",
                        prefix: Image.asset("assets/images/6.png"),
                        color: color1),
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
                  onTap: () async{
              DeliveryCubit.get(context).addCar(context: context, brand: carModelController.text, plate: carNumberController.text, color: carColorController.text);
                    Navigator.of(context, rootNavigator: true).pop();

                    showDialog(
                      barrierColor: Colors.white10, //AddScreen()

                      context: context,
                      builder: (_) => Dialog(
                        insetPadding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: CardScreen2(
                          hasCar: true,
                        ),
                      ), //AddScreen()
                      barrierDismissible: true,
                    );
                  },
                  child: mainBottom(title: "اضف", width: 140.w, height: 50)),
            ],
          ),
        ],
      ),
    );
  }
}

class BookingScreen extends StatefulWidget {
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

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var numberOfPersonController = TextEditingController();

  var value;

  var value2;

  DateTime dateTime = DateTime.now();

  late DateTime dateTime2;

  Future<void> openTimePicker(BuildContext context) async {
    final TimeOfDay? t =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (t != null) {
      setState(() {
        value2 = t.format(context);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateTime2 = DateTime.now();
  }

  Future<void> openDatePicker(BuildContext context) async {
    final DateTime? t = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(DateTime.now().year + 1),
        initialDate: dateTime2);
    if (t != null) {
      setState(() {
        value = t;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        print("tesr");
      },
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          height: .40.sh,
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
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
              SizedBox(height: 20.h),
              StatefulBuilder(
                builder: (BuildContext ctx, StateSetter setState) => Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10.w),
                        Container(
                          width: .82.sw,
                          child: defaultFormField(
                              type: TextInputType.number,
                              controller: numberOfPersonController,
                              label: "عدد الافراد",
                              prefix: Image.asset("assets/images/7.png"),
                              color: color1),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            openDatePicker(context);
                            // return BookingScreen.BookingScreen.showSheet(
                            //   context,
                            //   child: buildDatePicker(),
                            //   onClicked: () {
                            //     setState(() {
                            //       context.setLocale(Locale('ar'));
                            //
                            //       value =
                            //           DateFormat('yyyy/MM/dd').format(dateTime);
                            //     });
                            //
                            //     Navigator.pop(context);
                            //   },
                            // );
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              width: 150.w,
                              height: 50.h,
                              child: Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  Image.asset("assets/images/8.png"),
                                  SizedBox(width: 10.w),
                                  Text((value == null)
                                      ? "اليوم"
                                      : DateFormat.yMd().format(value)),
                                ],
                              )),
                        ),
                        SizedBox(width: 20.w),
                        InkWell(
                          onTap: () {
                            openTimePicker(context);
                          },
                          // onTap: () => BookingScreen.showSheet(
                          //   context,
                          //   child: buildTimePicker(),
                          //   onClicked: () {
                          //     setState(() {
                          //       value2 = DateFormat('HH:mm').format(dateTime);
                          //     });
                          //
                          //     Navigator.pop(context);
                          //   },
                          // ),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              width: 150.w,
                              height: 50.h,
                              child: Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  Image.asset("assets/images/9.png"),
                                  SizedBox(width: 10.w),
                                  Text((value2 == null)
                                      ? "الساعة"
                                      : value2.toString())
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  print("tesr");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10.w),
                    InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pop();
DeliveryCubit.get(context).setorder.reservation=Reservation(date:DateFormat.yMd().format(value).toString() ,persons: numberOfPersonController.text,time:value2.toString() );
                          showDialog(
                            barrierColor: Colors.white10, //AddScreen()
                            context: context,
                            builder: (_) => Dialog(
                              insetPadding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: CardScreen2(
                                hasTabol: true,
                              ),
                            ), //AddScreen()
                            barrierDismissible: true,
                          );
                        },
                        child: mainBottom(
                            title: "اضف", width: 140.w, height: 50.h)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildDatePicker() => StatefulBuilder(
  //       builder: (BuildContext ctx, StateSetter setState) => SizedBox(
  //         height: 180.h,
  //         child: CupertinoApp(
  //           locale: Locale("en"),
  //           debugShowCheckedModeBanner: false,
  //           home: CupertinoDatePicker(
  //             backgroundColor: Colors.white,
  //
  //             // backgroundColor: Colors.white10,
  //
  //             // minimumDate: DateTime.now().toLocal(),
  //             minimumYear: DateTime.now().year,
  //             initialDateTime: dateTime,
  //             mode: CupertinoDatePickerMode.date,
  //             onDateTimeChanged: (dateTime) =>
  //                 setState(() => this.dateTime = dateTime),
  //           ),
  //         ),
  //       ),
  //     );
  //
  // Widget buildTimePicker() =>
  //     StatefulBuilder(builder: (BuildContext ctx, StateSetter setState) {
  //       return SizedBox(
  //         height: 180.h,
  //         child: CupertinoApp(
  //           locale: Locale("en"),
  //           debugShowCheckedModeBanner: false,
  //           home: CupertinoDatePicker(
  //             backgroundColor: Colors.white,
  //             use24hFormat: false,
  //             // minimumDate: dateTime,
  //             initialDateTime: dateTime,
  //             mode: CupertinoDatePickerMode.time,
  //
  //             //use24hFormat: true,
  //             onDateTimeChanged: (dateTime) =>
  //                 setState(() => this.dateTime = dateTime),
  //           ),
  //         ),
  //       );
  //     });
} /////عيزين نسيت لوكل لودجيت واحدة بس
