import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart' as intel;

import 'package:rest_cafe/modules/card_screen/cardScreen.dart';
import 'package:rest_cafe/modules/card_screen_2/cubit/delivery_cubit.dart';
import 'package:rest_cafe/modules/card_screen_2/cubit/delivery_state.dart';
import 'package:rest_cafe/modules/card_screen_3/cardScreen3.dart';
import 'package:rest_cafe/modules/detail_screen/cubit/detial_cubit.dart';
import 'package:rest_cafe/shared/Model/set_order_model.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/localstroage.dart';
import 'dart:math' as math;
import 'package:rest_cafe/shared/styles/colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
// import 'package:searchable_dropdown/searchable_dropdown.dart';

class CardScreen2 extends StatelessWidget {
  final bool? hasCar;
  final bool? hasTabol;

  CardScreen2({
    this.hasCar = false,
    this.hasTabol = false,
  });

  bool isChecked1 = true;
  bool isChecked2 = true;
  bool isChecked3 = true;
  int carIndex = 0;

  @override
  Widget build(BuildContext context) {
    carIndex = DeliveryCubit.get(context).CarIndex;
    if (hasTabol == true) isChecked3 = false;
    if (hasCar == true) isChecked1 = false;

    return BlocConsumer<DeliveryCubit, DeliveryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => state is CarsLoadingState
                ? Center(child: CircularProgressIndicator())
                : Container(
                    height: .91.sh,
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: .14.sw),
                            myTitle(
                              title: "Delivery".tr(),
                              font: 16.sp,
                            ),
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
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      child: CardScreen(),
                                    ), //AddScreen()
                                    barrierDismissible: true,
                                  );
                                })
                          ],
                        ),
                        SizedBox(height: 15),
                        Center(
                            child: Transform(
                                transform: LocalStorage.getData(key: "lang") == "en"
                                    ? Matrix4.rotationY(math.pi)
                                    : Matrix4.rotationY(2 * math.pi),
                                alignment: Alignment.center,
                                child: Image.asset("assets/images/card2.png"))),
                        SizedBox(height: 15.h),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                // height: 100.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(20.sp)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        children: [
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
                                                    // color: Colors.black12,
                                                    size: 30.sp,
                                                  )
                                                : Icon(
                                                    Icons.circle,
                                                    color: color1,
                                                    size: 30.sp,
                                                  ),
                                          ),
                                          myTitle(
                                              title: "To car".tr(),
                                              // color: Colors.black,
                                              font: 16.sp),
                                          Spacer(),
                                          Container(
                                              height: 50.h,
                                              width: 40.w,
                                              child: Image.asset("assets/images/ic_delivery_car.png"))
                                        ],
                                      ),
                                    ),
                                    if (hasCar! || isChecked1 == false)
                                      Column(
                                        children: [
                                          Divider(
                                            color: Colors.black38,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context, rootNavigator: true).pop();
                                              DeliveryCubit.get(context).getBrands(context);
                                              showDialog(
                                                barrierColor: Colors.white10,
                                                //AddScreen()

                                                context: context,
                                                builder: (_) => Dialog(
                                                  insetPadding: EdgeInsets.all(20),
                                                  shape:
                                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                  child: DeliveryScreen(),
                                                ),
                                                //AddScreen()
                                                barrierDismissible: true,
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                SizedBox(width: 40.w),
                                                myTitle(
                                                    title: DeliveryCubit.get(context).cars.isEmpty
                                                        ? "Add car".tr()
                                                        : "${DeliveryCubit.get(context).cars[carIndex].plateNumber} | ${DeliveryCubit.get(context).cars[carIndex].color} | ${DeliveryCubit.get(context).cars[carIndex].brandModel!.brand!.name}",
                                                    // color: Colors.black38,
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
                              SizedBox(height: 15),
                              Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(20.sp)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    children: [
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
                                                // color: Colors.black12,
                                                size: 30.sp,
                                              )
                                            : Icon(
                                                Icons.circle,
                                                color: color1,
                                                size: 30.sp,
                                              ),
                                      ),
                                      myTitle(
                                          title: "Pick up".tr(),
                                          // color: Colors.black,
                                          font: 16.sp),
                                      Spacer(),
                                      Image.asset("assets/images/m2.png")
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(20.sp)),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Row(
                                            children: [
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
                                                        // color: Colors.black12,
                                                        size: 30.sp,
                                                      )
                                                    : Icon(
                                                        Icons.circle,
                                                        color: color1,
                                                        size: 30.sp,
                                                      ),
                                              ),
                                              myTitle(
                                                  title: "Reserve a table".tr(),
                                                  // color: Colors.black,
                                                  font: 16.sp),
                                              Spacer(),
                                              Image.asset("assets/images/3.png")
                                            ],
                                          ),
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
                                                  Navigator.of(context, rootNavigator: true).pop();

                                                  showDialog(
                                                    barrierColor: Colors.white10, //AddScreen()

                                                    context: context,
                                                    builder: (_) => Dialog(
                                                      insetPadding: EdgeInsets.all(20),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20)),
                                                      child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(context).requestFocus(new FocusNode());
                                                          },
                                                          child: BookingScreen()),
                                                    ), //AddScreen()
                                                    barrierDismissible: false,
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    // SizedBox(width: 40.w),
                                                    myTitle(
                                                        title: DeliveryCubit.get(context).setorder.reservation != null
                                                            ? "${DeliveryCubit.get(context).setorder.reservation!.date.toString()} | ${DeliveryCubit.get(context).setorder.reservation!.time} | ${DeliveryCubit.get(context).setorder.reservation!.persons} "
                                                            : "Complete reservation data".tr(),
                                                        // color: Colors.black38,
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
                                  if (isChecked1 == false && DeliveryCubit.get(context).cars.isNotEmpty) {
                                    DeliveryCubit.get(context).setorder.vehicle_id =
                                        DeliveryCubit.get(context).cars[carIndex].id;
                                  }
                                  if (isChecked3 && isChecked2 && isChecked1)
                                    Fluttertoast.showToast(msg: "Please select first".tr());
                                  else if (isChecked1 == false && DeliveryCubit.get(context).cars.isEmpty)
                                    Fluttertoast.showToast(msg: "Add car".tr());
                                  else if (isChecked3 == false &&
                                      DeliveryCubit.get(context).setorder.reservation == null)
                                    Fluttertoast.showToast(msg: "Complete reservation data".tr());
                                  else {
                                    Navigator.of(context, rootNavigator: true).pop();
                                    DeliveryCubit.get(context).setorder.type = isChecked1 == false
                                        ? "vehicle"
                                        : isChecked2 == false
                                            ? "pickup"
                                            : "reservation";

                                    showDialog(
                                      barrierColor: Colors.white10, //AddScreen()

                                      context: context,
                                      builder: (_) => Dialog(
                                        insetPadding: EdgeInsets.all(20),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        child: CardScreen3(),
                                      ), //AddScreen()
                                      barrierDismissible: true,
                                    );
                                  }
                                },
                                child: mainBottom(title: "Next".tr(), width: 150.w, height: 60)),
                            InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).pop();

                                showDialog(
                                  barrierColor: Colors.white10, //AddScreen()

                                  context: context,
                                  builder: (_) => Dialog(
                                    insetPadding: EdgeInsets.all(20),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    child: CardScreen(),
                                  ), //AddScreen()
                                  barrierDismissible: true,
                                );
                              },
                              child: Container(
                                height: 60.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                    borderRadius: BorderRadius.circular(15.sp),
                                    color: Colors.white10),
                                child: Center(
                                  child: Text(
                                    "Back".tr(),
                                    style: TextStyle(fontSize: 16, fontFamily: "FrutigerLTArabic"),
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
          );
        });
  }
}

class DeliveryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DeliveryScreenState();
  }
}

class DeliveryScreenState extends State<DeliveryScreen> {
  Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  var carModelController = TextEditingController();
  var carNumberController = TextEditingController();
  var carColorController = TextEditingController();
  ItemScrollController _itemScrollController = ItemScrollController();
  bool isOld = true;
  String? selectedValue;
  String? color;
  String? selectedValue2;
  @override
  void initState() {
    // TODO: implement initState
    DeliveryCubit.get(context).getModel(context, "048da139-fd72-4f3a-8cc1-4a3b92bbf3c2");
    DeliveryCubit.get(context).getBrands(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      listener: (context, state) {},
      builder: (context, state) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: .15.sw),
                  Center(
                      child: myTitle(
                    title: "Delivery by car".tr(),
                    font: 16.sp,
                  )),
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                      title: "Saved Vehicle data".tr(),
                      font: 16.sp,
                    ),
                    DeliveryCubit.get(context).cars.isEmpty
                        ? SizedBox(
                            height: 30.h,
                          )
                        : Container(
                            width: 1.sw,
                            alignment: Alignment.center,
                            height: 155,
                            child: ScrollablePositionedList.builder(
                              scrollDirection: Axis.horizontal,
                              initialScrollIndex: 0,

                              itemScrollController: _itemScrollController,
                              // physics: NeverScrollableScrollPhysics(),

                              itemCount: DeliveryCubit.get(context).cars.length,
                              itemBuilder: (context, index) => Container(
                                width: .86.sw,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          DeliveryCubit.get(context).CarIndex = index;
                                          DeliveryCubit.get(context).setorder.vehicle_id =
                                              DeliveryCubit.get(context).cars[index].id!;
                                          Navigator.of(context).pop();
                                          showDialog(
                                            barrierColor: Colors.white10, //AddScreen()

                                            context: context,
                                            builder: (_) => Dialog(
                                              insetPadding: EdgeInsets.all(20),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                              child: CardScreen2(
                                                hasCar: true,
                                              ),
                                            ), //AddScreen()
                                            barrierDismissible: true,
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.sp),
                                              border: Border.all(color: Colors.black12)),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 10.0.sp,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    myTitle(title: "Car brand".tr(), font: 16.sp),
                                                    myTitle(
                                                        title: DeliveryCubit.get(context)
                                                            .cars[index]
                                                            .brandModel!
                                                            .brand!
                                                            .name,
                                                        color: Colors.grey,
                                                        font: 14.sp),
                                                    myTitle(title: "Plate number".tr(), font: 16.sp),
                                                    myTitle(
                                                        title: DeliveryCubit.get(context).cars[index].plateNumber,
                                                        color: Colors.grey,
                                                        font: 14.sp),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 10.0.sp,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    myTitle(title: "Model".tr(), font: 16.sp),
                                                    myTitle(
                                                        title: DeliveryCubit.get(context).cars[index].brandModel!.name,
                                                        color: Colors.grey,
                                                        font: 14.sp),
                                                    SizedBox(width: 8.w),
                                                    myTitle(title: "Car color".tr(), font: 16.sp),
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
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                if (index - 1 >= 0)
                                                  _itemScrollController.jumpTo(
                                                    index: index - 1,
                                                  );
                                              },
                                              icon: Icon(Icons.arrow_back_ios_outlined)),
                                          IconButton(
                                              onPressed: () {
                                                _itemScrollController.jumpTo(index: index + 1);
                                              },
                                              icon: Icon(Icons.arrow_forward_ios)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  myTitle(title: "Add car".tr(), font: 16.sp),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), border: Border.all(width: 1, color: Colors.grey)),
                        width: .76.sw,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SearchableDropdown.single(
                            //   icon: ImageIcon(
                            //     AssetImage(
                            //       "assets/images/4.png",
                            //     ),
                            //     color: color1,
                            //   ),
                            //   closeButton: "close".tr(),
                            //   items: DeliveryCubit.get(context)
                            //       .brands
                            //       .map((e) => DropdownMenuItem(
                            //             child: Row(
                            //               children: [
                            //                 Text(e.name.toString()),
                            //                 SizedBox(
                            //                   width: 2,
                            //                 ),
                            //                 Image.network(
                            //                   e.logo.toString(),
                            //                   width: 20,
                            //                   height: 30,
                            //                 ),
                            //               ],
                            //             ),
                            //             value: e.name,
                            //           ))
                            //       .toList(),
                            //   value: selectedValue,
                            //   hint: "Car brand".tr(),
                            //   searchHint: "Car brand".tr(),
                            //   displayClearIcon: false,
                            //   underline: Container(),
                            //   onChanged: (value) {
                            //     setState(() {
                            //       selectedValue = value;
                            //       DeliveryCubit.get(context).getModel(
                            //           context,
                            //           DeliveryCubit.get(context)
                            //               .brands
                            //               .firstWhere((element) =>
                            //                   element.name == value)
                            //               .id
                            //               .toString());
                            //     });
                            //   },
                            //   displayItem: (item, selected) {
                            //     return (Row(
                            //       children: [item],
                            //     ));
                            //   },
                            //   isExpanded: true,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), border: Border.all(width: 1, color: Colors.grey)),
                        width: .76.sw,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SearchableDropdown.single(
                            //   items: DeliveryCubit.get(context)
                            //       .models
                            //       .map((e) => DropdownMenuItem(
                            //             child: Text(e.name.toString()),
                            //             value: e.name,
                            //           ))
                            //       .toList(),
                            //   icon: Icon(Icons.expand_more),
                            //   value: selectedValue,
                            //   hint: "Model".tr(),
                            //   closeButton: "close".tr(),
                            //   searchHint: "Model".tr(),
                            //   displayClearIcon: false,
                            //   underline: Container(),
                            //   onChanged: (value) {
                            //     setState(() {
                            //       selectedValue2 = value;
                            //     });
                            //   },
                            //   displayItem: (item, selected) {
                            //     return (Row(
                            //       children: [item],
                            //     ));
                            //   },
                            //   isExpanded: true,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                              width: .35.sw,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              alignment: Alignment.center,
                              height: (carNumberController.text.isEmpty && color == null) ? 50 : 70,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: carNumberController.text.length > 4 ? Colors.red : Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: carNumberController,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                    decoration: InputDecoration(
                                      hintText: "Plate number".tr(),
                                      border: InputBorder.none,
                                    )),
                              )),
                        ],
                      ),
                      SizedBox(width: 20),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), border: Border.all(width: 1, color: Colors.grey)),
                        width: .35.sw,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SearchableDropdown.single(
                            //   items: DeliveryCubit.get(context).colors.map((e) {
                            //     return DropdownMenuItem(
                            //       child: Row(
                            //         children: [
                            //           Container(
                            //               width: 50.w,
                            //               child: Text(e.name.toString())),
                            //           SizedBox(
                            //             width: 5.w,
                            //           ),
                            //           Container(
                            //             width: 25,
                            //             height: 25,
                            //             decoration: BoxDecoration(
                            //                 color: colorFromHex(e.hex!),
                            //                 borderRadius:
                            //                     BorderRadius.circular(100),
                            //                 border: Border.all(
                            //                     width: 1, color: Colors.grey)),
                            //           )
                            //         ],
                            //       ),
                            //       value: e.name,
                            //     );
                            //   }).toList(),
                            //   icon: Icon(Icons.expand_more),
                            //   value: selectedValue,
                            //   hint: "Car color".tr(),
                            //   closeButton: "close".tr(),
                            //   searchHint: "Car color".tr(),
                            //   displayClearIcon: false,
                            //   underline: Container(),
                            //   onChanged: (value) {
                            //     setState(() {
                            //       color = value;
                            //     });
                            //   },
                            //   displayItem: (item, selected) {
                            //     return (Row(
                            //       children: [item],
                            //     ));
                            //   },
                            //   isExpanded: true,
                            // ),
                          ],
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
                  InkWell(
                      onTap: () async {
                        if (selectedValue == null ||
                            selectedValue2 == null ||
                            color == null ||
                            carNumberController.text.isEmpty)
                          Fluttertoast.showToast(msg: "Compelte required data".tr());
                        else if (carNumberController.text.length != 4)
                          Fluttertoast.showToast(msg: "Plate number is 4 numbers".tr());
                        else {
                          DeliveryCubit.get(context)
                              .addCar(
                                  context: context,
                                  brand: DeliveryCubit.get(context)
                                      .models
                                      .firstWhere((element) => element.name != selectedValue)
                                      .id
                                      .toString(),
                                  plate: carNumberController.text,
                                  color: DeliveryCubit.get(context)
                                      .colors
                                      .firstWhere((element) => element.name != color)
                                      .id
                                      .toString())
                              .then((v) {});
                          Navigator.of(context, rootNavigator: true).pop();

                          showDialog(
                            barrierColor: Colors.white10, //AddScreen()

                            context: context,
                            builder: (_) => Dialog(
                              insetPadding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: CardScreen2(
                                hasCar: true,
                              ),
                            ), //AddScreen()
                            barrierDismissible: true,
                          );
                        }
                      },
                      child: mainBottom(title: "Add".tr(), width: 140.w, height: 50)),
                ],
              ),
            ],
          ),
        ),
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

  String? value2;

  DateTime dateTime = DateTime.now();

  late DateTime dateTime2;

  Future<void> openTimePicker(BuildContext context) async {
    final TimeOfDay? t = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input, context: context, initialTime: TimeOfDay.now());
    if (t != null) {
      setState(() {
        value2 = t.format(context);
        if (value2!.contains("PM") || value2!.contains("م")) {
          String temp = value2!.split(":")[1].toString().split(" ")[0];
          String temp2 = (int.parse(value2!.split(":")[0]) + 12).toString();

          value2 = temp2 + ":" + temp;
        }
        print(value2);
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
        firstDate: DateTime.now(),
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
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
      child: GestureDetector(
        onTap: () {
          // FocusScope.of(context).unfocus();
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
                    Center(child: myTitle(title: "Delivery(reserve a table)".tr(), font: 16.sp, color: Colors.black)),
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
                                label: "Number of persons".tr(),
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
                                    Text((value == null) ? "Date".tr() : intel.DateFormat.yMd().format(value)),
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
                                    Text((value2 == null) ? "Time".tr() : value2.toString())
                                  ],
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
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
                            if (value == null || numberOfPersonController.text.isEmpty || value2 == null)
                              Fluttertoast.showToast(msg: "Complete required data".tr());
                            else {
                              Navigator.of(context, rootNavigator: true).pop();
                              DeliveryCubit.get(context).setorder.reservation = Reservation(
                                  date: intel.DateFormat.yMd().format(value).toString(),
                                  persons: numberOfPersonController.text,
                                  time: value2.toString());
                              showDialog(
                                barrierColor: Colors.white10, //AddScreen()
                                context: context,
                                builder: (_) => Dialog(
                                  insetPadding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  child: CardScreen2(
                                    hasTabol: true,
                                  ),
                                ), //AddScreen()
                                barrierDismissible: true,
                              );
                            }
                          },
                          child: mainBottom(title: "Add".tr(), width: 140, height: 50)),
                    ],
                  ),
                ),
              ],
            ),
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
