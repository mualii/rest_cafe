import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/modules/add_screen/addScreen.dart';
import 'package:rest_cafe/modules/branches_screen/BranchesScreen.dart';
import 'package:rest_cafe/modules/card_screen/cardScreen.dart';
import 'package:rest_cafe/modules/detail_screen/cubit/cubit.dart';
import 'package:rest_cafe/modules/detail_screen/cubit/states.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCubit(),
      child: BlocConsumer<DetailCubit, DetailState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 190.h,
              flexibleSpace: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: .03.sw),
                        IconButton(
                          onPressed: () {
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
                          },
                          icon: Icon(FontAwesomeIcons.cartPlus),
                          color: Colors.grey,
                        ),
                        SizedBox(width: .29.sw),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffDADADA)),
                                  borderRadius: BorderRadius.circular(20.sp)),
                              child: Image.asset("assets/images/mac.png"),
                            ),
                            myTitle(
                                title: "ماكدونالد ",
                                font: 16.sp,
                                color: Colors.black),
                            Row(children: [
                              Icon(
                                FontAwesomeIcons.utensils,
                                color: color1,
                                size: 20.sp,
                              ),
                              Text("امريكي",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12.sp)),
                            ]),
                          ],
                        ),
                        SizedBox(width: .29.sw),
                        InkWell(
                          onTap: () {
                            navigateAndFinish(context, LayoutScreen());
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Divider(
                        height: 3.h,
                        color: Color(0xffD8D8D8),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        SizedBox(width: 20.w),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.black, size: 20.sp),
                            myTitle(
                                color: Color(0xff717171),
                                font: 12.sp,
                                title: "5 km")
                          ],
                        ),
                        SizedBox(width: 30.w),
                        Row(
                          children: [
                            Icon(Icons.access_time_outlined,
                                color: color1, size: 20.sp),
                            myTitle(
                                color: Color(0xff717171),
                                font: 12.sp,
                                title: "45 دقيقة")
                          ],
                        ),
                        SizedBox(width: 90.w),
                        Row(
                          children: [
                            myTitle(color: color1, font: 12.sp, title: "مفتوح"),
                            Icon(Icons.circle, color: color1, size: 15.sp),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 50.h,
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
                                  text: "كل المنتجات",
                                  icon: FontAwesomeIcons.utensils,
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10.w),
                          itemCount: 7),
                    ),
                    Divider(),
                    Container(
                      height: .52.sh,
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
                                    child: AddScreen(),
                                  ), //AddScreen()
                                  barrierDismissible: false,
                                ).then((value) => Navigator.pop(context));
                              },
                              child: LabolOfSecondListView(index: index)),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10.h),
                          itemCount: 10),
                    ),
                  ],
                ),
              ),
            ),
            bottomSheet: Container(
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.sp),
                      topLeft: Radius.circular(30.sp))),
              width: double.infinity,
              height: 70.h,
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Row(
                  children: [
                    myTitle(
                        title: "فروع ماكدونالد",
                        font: 14.sp,
                        color: Color(0xff3D3D3D)),
                    SizedBox(width: 20.w),
                    Text("57"),
                    SizedBox(width: .45.sw),
                    IconButton(
                        onPressed: () {
                          navigateTo(context, BranchesScreen());
                        },
                        icon: Icon(Icons.arrow_circle_up))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LabolOfSecondListView extends StatelessWidget {
  const LabolOfSecondListView({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
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
              child: Image.asset("assets/images/Bourger.png"),
            ),
            SizedBox(width: 30.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("سموكي باربكيو",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp)),
                SizedBox(height: 10.h),
                Row(children: [
                  Text("15 ريال",
                      style: TextStyle(color: Colors.black54, fontSize: 12.sp)),
                ]),
              ],
            ),
            SizedBox(width: 20.w),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(children: [
                  index == DetailCubit.get(context).currentIndex2
                      ? IconButton(
                          onPressed: () {
                            DetailCubit.get(context)
                                .changeFavorites(true, index!);
                          },
                          icon: Icon(Icons.favorite, color: color1),
                        )
                      : IconButton(
                          onPressed: () {
                            DetailCubit.get(context)
                                .changeFavorites(false, index!);
                          },
                          icon: Icon(Icons.favorite_border),
                        )
                ]),
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
      width: 90.w,
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
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          index == DetailCubit.get(context).currentIndex
              ? Divider(color: color1, height: 20.h)
              : Container()
        ],
      ),
    );
  }
}
