import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/cart_cubit.dart';
import 'package:rest_cafe/modules/card_screen_2/cardScreen2.dart';
import 'package:rest_cafe/modules/card_screen_2/cubit/delivery_cubit.dart';
import 'package:rest_cafe/modules/card_screen_2/cubit/delivery_state.dart';
import 'package:rest_cafe/modules/card_screen_3/checkout_screen.dart';
import 'package:rest_cafe/modules/detail_screen/cubit/detial_cubit.dart';
import 'package:rest_cafe/modules/edit_profile/edit_profile.dart';
import 'package:rest_cafe/modules/home_screen/cubit/HomeCubit.dart';
import 'package:rest_cafe/shared/Model/set_order_model.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class CardScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isChecked1 = true;
    DeliveryCubit.get(context).getTotal(context);
    bool isChecked2 = true;
    // bool isChecked3 = true;
    return BlocConsumer<DeliveryCubit,DeliveryState>(

    listener:(context,state){ } ,
      builder:(context,state){


      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => state is CarsLoadingState? Center(child: CircularProgressIndicator()): Container(
          height: .91.sh,
          padding: EdgeInsets.all(10.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: .12.sw),
                    myTitle(title: "الدفع", font: 16.sp, color: Colors.black),
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
                          barrierDismissible: false,
                        );
                      },
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Center(child: Image.asset("assets/images/card3.png")),
                SizedBox(height: 15.h),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      border: Border.all(
                          color: isChecked1 ? Colors.black12 : Colors.black)),
                  child: Column(
                    children: [
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          SizedBox(width: 15.w),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isChecked1 = !isChecked1;
                                isChecked2 = true;
                                // isChecked3 = true;
                              });
                            },
                            child: isChecked1
                                ? Icon(
                                    Icons.circle_outlined,
                                    color: Colors.black12,
                                    size: 30.sp,
                                  )
                                : Icon(
                                    Icons.check_circle,
                                    color: color1,
                                    size: 30.sp,
                                  ),
                          ),
                          SizedBox(width: 15.w),
                          myTitle(
                              title: "Payment on recieving ".tr(),
                              font: 16.sp,
                              color: Colors.black),
                          // SizedBox(width: .33.sw),
                          // Container(
                          //     height: 15.h,
                          //     child: Image.asset("assets/images/pay (1).png")),
                        ],
                      ),
                      SizedBox(height: 8.h),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      border: Border.all(
                          color: isChecked2 ? Colors.black12 : Colors.black)),
                  child: Column(
                    children: [
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          SizedBox(width: 15.w),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isChecked2 = !isChecked2;
                                // isChecked3 = true;
                                isChecked1 = true;
                              });
                            },
                            child: isChecked2
                                ? Icon(
                                    Icons.circle_outlined,
                                    color: Colors.black12,
                                    size: 30.sp,
                                  )
                                : Icon(
                                    Icons.check_circle,
                                    color: color1,
                                    size: 30.sp,
                                  ),
                          ),
                          SizedBox(width: 15.w),
                          myTitle(
                              title: "Online payment".tr(), font: 16.sp, color: Colors.black),
                          // SizedBox(width: .38.sw),
                          // Container(
                          //     height: 20.h,
                          //     child: Image.asset("assets/images/pay (2).png")),
                        ],
                      ),
                      SizedBox(height: 8.h),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20.sp),
                //       border: Border.all(
                //           color: isChecked2? Colors.black12 : Colors.black)),
                //   child: Column(
                //     children: [
                //       SizedBox(height: 8.h),
                //       Row(
                //         children: [
                //           SizedBox(width: 15.w),
                //           InkWell(
                //             onTap: () {
                //               setState(() {
                //                 isChecked2 = !isChecked2;
                //
                //                 isChecked1 = true;
                //               });
                //             },
                //             child: isChecked2
                //                 ? Icon(
                //                     Icons.circle_outlined,
                //                     color: Colors.black12,
                //                     size: 30.sp,
                //                   )
                //                 : Icon(
                //                     Icons.check_circle,
                //                     color: color1,
                //                     size: 30.sp,
                //                   ),
                //           ),
                //           SizedBox(width: 8.w),
                //           myTitle(
                //               title: "فيزا", font: 16.sp, color: Colors.black),
                //           myTitle(
                //               title: "****5689",
                //               font: 16.sp,
                //               color: Colors.black38),
                //           SizedBox(width: .25.sw),
                //           Container(
                //               height: 20.h,
                //               child: Image.asset("assets/images/pay (1).jpg")),
                //         ],
                //       ),
                //       SizedBox(height: 8.h),
                //     ],
                //   ),
                // ),
                SizedBox(height: .175.sh),
                Divider(color: Colors.black38),
                Row(
                  children: [
                    myTitle(title: "Total".tr(), color: Colors.black, font: 16.sp),
                    Spacer(),
                    myTitle(
                        title: "${DeliveryCubit.get(context).price!.subtotal.toString()} ريال ", color: Colors.black38, font: 16.sp),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    myTitle(title: "Service".tr(), color: Colors.black, font: 16.sp),
                    Spacer(),
                    myTitle(title: "${DeliveryCubit.get(context).price!.serviceCharge.toString()}  ريال ", color: Colors.black38, font: 16.sp),
                  ],
                ),
                SizedBox(height: 10.h),
                Divider(color: Colors.black38),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    myTitle(
                        title: "Total price".tr(),
                        color: Colors.black,
                        font: 16.sp),
                    Spacer(),
                    myTitle(
                        title: "${DeliveryCubit.get(context).price!.total.toString()}  ريال ", color: Colors.black38, font: 16.sp),
                  ],
                ),
                SizedBox(height: 10.h),
                Divider(color: Colors.black38),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () async{






                          if(HomeCubit.get(context).user!.name==null)

                            AwesomeDialog(
                              context: context,
                              //dialogType: DialogType.INFO,
                              customHeader: Image.asset(
                                  "assets/images/ic_error.png"),
                              animType: AnimType.BOTTOMSLIDE,

                              body: Column(
                                children: [
                                  Text(
                                    "Profile is not complete".tr(),
                                    style: TextStyle(
                                      color: color1,
                                      fontFamily: "FrutigerLTArabic",
                                    ),
                                  ),
                                  Text(
                                    "Complete data so you can proceed".tr(),
                                    style: TextStyle(
                                      fontFamily: "FrutigerLTArabic",
                                    ),
                                  ),

                                ],
                              ),

                              btnOk: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 5)),
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(0),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Color(0xffC3C6D1))))),
                                child: Text(
                                  "Back".tr(),
                                  style: TextStyle(color: Color(0xff4CB379)),
                                ),
                              ),

                              btnCancel: ElevatedButton(
                                onPressed: () {

                                  Navigator.of(context).pop();
                                  navigateTo(context, EditProfile());},
                                style: ButtonStyle(

                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 5)),
                                    backgroundColor:
                                    MaterialStateProperty.all(Color(0xff4CB379)),
                                    elevation: MaterialStateProperty.all(0),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Color(0xffC3C6D1))))),
                                child: Text(
                                  "Complete required data".tr(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )..show();


                          else{

                          if(isChecked2 && isChecked1)
                            Fluttertoast.showToast(msg: "Choose payment method".tr());
                          else{
                          DeliveryCubit.get(context).setorder.branch_id=DetailCubit.get(context).details!.id;
                          DeliveryCubit.get(context).setorder.paymentMethod=isChecked1==false? "cash":"online";
                          print(DeliveryCubit.get(context).setorder.toMap());
                        var response=  await  DioHelper.postData(endpoint: "api/v1/orders",formData:DeliveryCubit.get(context).setorder.toMap() , context: context);
                        if(response is Response)
                          {
                            CartCubit.get(context).cart.clear();
                            CartCubit.get(context).mainId=null;
                          navigateAndFinish(
                          context,
                          LayoutScreen(
                          selectedPageIndex: 2,
                          ));
                           if(isChecked1)

                            navigateTo(context, CheckOutWebView(response.data["invoiceURL"].toString()));
                     }
                        }}},
                        child: mainBottom(
                            title: "Continue".tr(),
                            width: 150.w,
                            height: 50.h)),
                    InkWell(
                      onTap: () async{
                       //AddScreen()

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
                      child: Container(
                        height: 60.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15.sp),
                            color: Colors.white10),
                        child: Center(
                          child: Text(
                            "Back".tr(),
                            style: TextStyle(
                                fontFamily: "FrutigerLTArabic",
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );}
    );
  }
}
