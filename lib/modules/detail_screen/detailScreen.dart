import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/Screens/cart_state.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/cart_cubit.dart';
import 'package:rest_cafe/modules/add_screen/addScreen.dart';
import 'package:rest_cafe/modules/branches_screen/BranchesScreen.dart';
import 'package:rest_cafe/modules/branches_screen/cubit.dart';
import 'package:rest_cafe/modules/card_screen/cardScreen.dart';
import 'package:rest_cafe/modules/favorites_screen/favourites_cubit.dart';
import 'package:rest_cafe/modules/home_screen/cubit/HomeCubit.dart';
import 'package:rest_cafe/shared/Model/details_model.dart';

import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

import 'cubit/detail_state.dart';
import 'cubit/detial_cubit.dart';

class DetailScreen extends StatelessWidget {
  String? id, distance, number, name;

  DetailScreen({this.id, this.distance, this.number, this.name});

  @override
  Widget build(BuildContext context) {
    DetailCubit.get(context).getDetails(context, id!);
    return BlocConsumer<DetailCubit, DetailState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 230.h,

              flexibleSpace: SafeArea(
                child: state is DetailsLoaded
                    ? Column(
                        children: [
                          SizedBox(height: 20.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 40.w,
                                  child: InkWell(
                                      onTap: () {
                                        if (DetailCubit.get(context)
                                                .details!
                                                .isOpen ==
                                            false)
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                    title: Text(
                                                      "المطعم مغلق الان ",
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0)),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("حسنا"))
                                                    ],
                                                  ));
                                        else {
                                          if (CartCubit.get(context)
                                              .cart
                                              .isEmpty)
                                            Fluttertoast.showToast(
                                                msg: 'Cart is empty'.tr());
                                          else
                                            showDialog(
                                              barrierDismissible: true,
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  insetPadding:
                                                      EdgeInsets.all(20),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: CardScreen(),
                                                );
                                              },
                                              // barrierColor:
                                              //     Colors.white10, //AddScreen()
                                            );
                                        }
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 40.h,
                                            width: 40.w,
                                            child: Icon(
                                              FontAwesomeIcons.cartPlus,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Positioned(
                                              top: -.5,
                                              right: -0.5,
                                              child: BlocConsumer<CartCubit,
                                                      CartState>(
                                                  listener: (context, state) {},
                                                  builder: (context, state) =>
                                                      CartCubit.get(context)
                                                                  .cart
                                                                  .length ==
                                                              0
                                                          ? Container()
                                                          : CircleAvatar(
                                                              child: Text(
                                                                CartCubit.get(
                                                                        context)
                                                                    .cart
                                                                    .length
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.red,
                                                              foregroundColor:
                                                                  Colors.white,
                                                              radius: 11,
                                                            )))
                                        ],
                                      )),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(20.sp)),
                                      child: Image.network(
                                        state.details!.logo.toString(),
                                        height: 100.h,
                                      ),
                                    ),
                                    myTitle(
                                      title: state.details!.name,
                                      font: 16.sp,
                                    ),
                                    Row(children: [
                                      Container(
                                          height: 20.h,
                                          child: HomeCubit.get(context)
                                                      .currentIndex ==
                                                  0
                                              ? Container()
                                              : Image.network(
                                                  HomeCubit.get(context)
                                                      .types[
                                                          HomeCubit.get(context)
                                                              .currentIndex]
                                                      .icon
                                                      .toString())),
                                      Text(state.details!.cuisine.toString(),
                                          style: TextStyle(
                                              fontFamily: "FrutigerLTArabic",
                                              // color: Colors.black54,
                                              fontSize: 12.sp)),
                                    ]),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Divider(
                              height: 2,
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 20,
                                      child: Image.asset(
                                          "assets/images/ic_location.png")),
                                  // myTitle(
                                  //     color: Color(0xff717171),
                                  //     font: 12.sp,
                                  //     title: "km"),
                                  SizedBox(width: 4),
                                  Text(
                                    "km",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      // color: Color(0xff717171),
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    distance!,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      // color: Color(0xff717171),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_time_filled,
                                      color: color1, size: 20.sp),
                                  Text(
                                    state.details!.preparationTime.toString(),
                                    style: TextStyle(
                                      // color: Color(0xff717171),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  myTitle(
                                      color: color1,
                                      font: 12.sp,
                                      title: DetailCubit.get(context)
                                                  .details!
                                                  .isOpen ==
                                              true
                                          ? "Open".tr()
                                          : "Closed".tr()),
                                  Icon(Icons.circle,
                                      color: DetailCubit.get(context)
                                                  .details!
                                                  .isOpen ==
                                              true
                                          ? color1
                                          : Colors.red,
                                      size: 15.sp),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
              ),
              automaticallyImplyLeading: false,
              // backgroundColor: Colors.white,
            ),
            body: state is DetailsLoaded
                ? Padding(
                    padding: EdgeInsets.all(20.0.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: false,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      DetailCubit.get(context)
                                          .changeListItem(index);
                                    },
                                    child: LabolOfFristListView(
                                      index: index,
                                      text: state
                                          .details!.categories![index].name
                                          .toString(),
                                      icon: FontAwesomeIcons.utensils,
                                    ),
                                  ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 10),
                              itemCount: state.details!.categories!.length),
                        ),
                        Divider(),
                        Expanded(
                          child: ListView.separated(
                              shrinkWrap: false,
                              itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    print(index);
                                    showDialog(
                                      context: context,
                                      builder: (_) => Dialog(
                                        insetPadding: EdgeInsets.all(20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: AddScreen(
                                            id!,
                                            state
                                                .details!
                                                .categories![
                                                    DetailCubit.get(context)
                                                        .currentIndex]
                                                .items![index]
                                                .id
                                                .toString(),
                                            state
                                                .details!
                                                .categories![
                                                    DetailCubit.get(context)
                                                        .currentIndex]
                                                .items![index]
                                                .price!,
                                            state
                                                .details!
                                                .categories![
                                                    DetailCubit.get(context)
                                                        .currentIndex]
                                                .items![index]
                                                .IsFavourite!,
                                            true),
                                      ), //AddScreen()
                                      barrierDismissible: true,
                                    );
                                  },
                                  child: LabolOfSecondListView(state
                                      .details!
                                      .categories![
                                          DetailCubit.get(context).currentIndex]
                                      .items![index])),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10),
                              itemCount: state
                                  .details!
                                  .categories![
                                      DetailCubit.get(context).currentIndex]
                                  .items!
                                  .length),
                        ),
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
            // backgroundColor: Color(0xffF7F7F7),
            // bottomSheet: Container(
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //           topRight: Radius.circular(30.sp),
            //           topLeft: Radius.circular(30.sp))),
            //   width: double.infinity,
            //   height: 90.h,
            //   child: Paddin0g(
            //     padding: EdgeInsets.all(10.sp),
            //     child: Row(
            //       children: [
            //         myTitle(
            //             title: " فروع ${name}",
            //             font: 14.sp,
            //             color: Color(0xff3D3D3D)),
            //         SizedBox(width: 20.w),
            //         Text(
            //           number!,
            //           style: TextStyle(
            //             fontFamily: "FrutigerLTArabic",
            //           ),
            //         ),
            //
            //       ],
            //     ),
            //   ),
            // ),
          ),
        );
      },
    );
  }
}

class LabolOfSecondListView extends StatelessWidget {
  Item item;

  LabolOfSecondListView(this.item);

  @override
  Widget build(BuildContext context) {
    bool isFav = item.IsFavourite!;

    return Container(
      height: 100.h,
      decoration: BoxDecoration(
          // color: Colors.white,
          border: Border.all(color: Color(0xffDADADA)),
          borderRadius: BorderRadius.circular(20.sp)),
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Row(
          children: [
            Container(
              height: 100.h,
              width: 90.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
              child: Image.network(item.image.toString()),
            ),
            SizedBox(width: 30.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name.toString(),
                      maxLines: 1,
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: "FrutigerLTArabic",
                      )),
                  Row(children: [
                    Text(item.price.toString(),
                        style: TextStyle(
                            fontFamily: "FrutigerLTArabic",
                            // color: Colors.black54,
                            fontSize: 12.sp)),
                  ]),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) => Row(
                    children: [
                      IconButton(
                        icon: (!isFav)
                            ? Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.grey,
                              )
                            : Icon(
                                Icons.favorite,
                                color: color1,
                              ),
                        onPressed: () async {
                          setState(() {
                            isFav = !isFav;
                            item.IsFavourite = !item.IsFavourite!;
                            // if(item.IsFavourite!)
                            //   DetailCubit.get(context).favourites.add(item);
                            // else
                            //   DetailCubit.get(context).favourites.remove(item);
                          });
                          if (isFav)
                            await DioHelper.postData(
                                endpoint: "api/v1/favourites/${item.id}",
                                context: context);
                          else
                            await DioHelper.delete(
                                endpoint: "api/v1/favourites/remove/${item.id}",
                                context: context);

                          // DetailCubit.get(context).getDetails(context, DetailCubit.get(context).details!.id!);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LabolOfFristListView extends StatelessWidget {
  final IconData? icon;
  final String text;
  final int index;

  const LabolOfFristListView(
      {Key? key, this.icon, required this.text, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      decoration: BoxDecoration(
        // border:,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(),
              )
            ],
          ),
          index == DetailCubit.get(context).currentIndex
              ? Divider(
                  color: color1,
                  height: 16,
                  thickness: 2,
                )
              : Container()
        ],
      ),
    );
  }
}
