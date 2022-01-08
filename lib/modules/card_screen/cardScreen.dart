import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/Screens/cart_state.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/cart_cubit.dart';

import 'package:rest_cafe/modules/card_screen_2/cardScreen2.dart';
import 'dart:math' as math;
import 'package:rest_cafe/shared/Model/cart_model.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/localstroage.dart';

import 'package:rest_cafe/shared/styles/colors.dart';

class CardScreen extends StatelessWidget {
  int count = 1;
  bool isFav = false;
  CartCubit? cubit;
  @override
  Widget build(BuildContext context) {
    return


         BlocConsumer<CartCubit,CartState>(
          listener:(context,state){} ,
          builder:(context,state){
cubit=CartCubit.get(context);
            return state is CartLoadingState?
              Center(child: CircularProgressIndicator()):


              SingleChildScrollView(
              child: Container(
                height: .91.sh,
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState) =>
                              IconButton(
                                icon: isFav
                                    ? Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.grey,
                                )
                                    : Icon(
                                  Icons.favorite,
                                  color: color1,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isFav = !isFav;
                                  });
                                },
                              ),
                        ),
                        Center(
                            child: myTitle(
                                title: "Products".tr(), font: 18.sp, color: Colors.black)),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                          Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Center(child: Transform(
                        
                        transform: LocalStorage.getData(key: "lang")=="en"? Matrix4.rotationY(math.pi): Matrix4.rotationY(2*math.pi),
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/cart1.png"))),
                    SizedBox(height: 10),
                    Expanded(


                      child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) =>
                              ListViewCont(cubit!.cart[index]),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: 10.h),
                          itemCount: cubit!.cart.length),
                    ),

                    // SizedBox(height: 45.h),

                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                    child: CardScreen2(),
                                  ), //AddScreen()
                                  barrierDismissible: true,
                                );
                              },
                              child: mainBottom(
                                  title: "Next".tr(), width: 150.w, height: 60.h)),
                        ],
                      ),
                    ),
                    // SizedBox(height: 15.h),
                  ],
                ),
              ),
            );
          },

      );
  }
}

class ListViewCont extends StatelessWidget {
  int count = 1;
  Cart? item;
ListViewCont(this.item);
  @override
  Widget build(BuildContext context) {

          return Container(
            height: 90.h,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20.sp)),
            child: ListTile(
              leading: Container(
                  width: 60.w, child: Image.network(item!.image!)),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        //dialogType: DialogType.INFO,
                        customHeader: Image.asset(
                            "assets/images/ic_delete_item_popup.png"),
                        animType: AnimType.BOTTOMSLIDE,

                        body: Column(
                          children: [
                            Text(
                              "Delete a product".tr(),
                              style: TextStyle(
                                color: color1,
                                fontFamily: "FrutigerLTArabic",
                              ),
                            ),
                            Text(
                              "Are you sure you want to delete".tr(),
                              style: TextStyle(
                                fontFamily: "FrutigerLTArabic",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item!.name!,
                                  style: TextStyle(
                                      fontFamily: "FrutigerLTArabic",
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "from cart".tr(),
                                  style:
                                      TextStyle(fontFamily: "FrutigerLTArabic"),
                                ),
                              ],
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
              CartCubit.get(context).deleteItem(context, item!.id!);

             if( CartCubit.get(context).cart.length==1)
               Navigator.of(context).pop();
               print("yes");
               Navigator.of(context).pop();
                          },
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
                            "Delete".tr(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )..show(); //AddScreen()
                    },
                    icon: Align(
                      alignment: Alignment(-3.5, 2),
                      child: Container(
                          height: 20,
                          child:
                              Image.asset("assets/images/ic_delete_item.png")),
                    ),
                  )
                ],
              ),
              title: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: myTitle(
                        color: Colors.black,lines: 1,
                        font: 14.sp,

                        title: item!.name!),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 3.w),
                      InkWell(
                        onTap: () {

                        CartCubit.get(context).addItem(context, item!.id!, item!.quantity!);

                        },
                        child: Container(
                          height: 27.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xff494861),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                          height: 40.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: Center(
                            child: myTitle(
                                color: color1, title: item!.quantity.toString(), font: 18.sp),
                          )),
                      InkWell(
                        onTap: () {

                          CartCubit.get(context).minusItem(context, item!.id!, item!.quantity!);
                        },
                        child: Container(
                          height: 27.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xffE7E7E7),
                          ),
                          child: Icon(
                            FontAwesomeIcons.minus,
                            size: 17.sp,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      myTitle(
                          color: Colors.black38, font: 12.sp, title: item!.total!.toString()),
                      // myTitle()
                    ],
                  )
                ],
              ),
            ),
          );



  }
}
