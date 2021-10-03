import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/modules/detail_screen/cubit/cubit.dart';
import 'package:rest_cafe/modules/detail_screen/cubit/states.dart';
import 'package:rest_cafe/modules/detail_screen/detailScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class BranchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCubit(),
      child: BlocConsumer<DetailCubit, DetailState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = DetailCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.r),
              )),
              title: Text(
                "اختر الفرع",
                style: TextStyle(color: Colors.black54),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    navigateAndFinish(
                        context,
                        LayoutScreen(
                          selectedPageIndex: 0,
                        ));
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ),
              ],
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 1,
            ),
            body: SlidingSheet(
              elevation: 8,
              cornerRadius: 16,
              snapSpec: const SnapSpec(
                // Enable snapping. This is true by default.
                snap: true,
                // Set custom snapping points.
                snappings: [0.25, 0.6, 1.0],
                // Define to what the snappings relate to. In this case,
                // the total available space that the sheet can expand to.
                positioning: SnapPositioning.relativeToAvailableSpace,
              ),
              headerBuilder: (BuildContext context, SheetState state) {
                return Container(
                  height: 50.h,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        myTitle(
                            title: "فروع ماكدونالد",
                            font: 14.sp,
                            color: Color(0xff3D3D3D)),
                        SizedBox(width: 20.w),
                        Text(
                          "57",
                          style: TextStyle(
                            fontFamily: "FrutigerLTArabic",
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              cubit.changeBranchSize();
                            },
                            icon: Image.asset("assets/images/ic_expand.png"))
                      ],
                    ),
                  ),
                );
              },
              // The body widget will be displayed under the SlidingSheet
              // and a parallax effect can be applied to it.
              body: Center(
                child: Image.asset(
                  "assets/images/google-location-history-screenshot-1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              builder: (context, state) {
                // This is the content of the sheet that will get
                // scrolled, if the content is bigger than the available
                // height of the sheet.
                return Container(
                  height: 650.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.sp),
                          topLeft: Radius.circular(30.sp))),
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: SingleChildScrollView(
                      //  physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          // LabolOfSecondListView()
                          Container(
                            // height: 300.h,
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      DetailCubit.get(context)
                                          .changeListItem(index);
                                      navigateTo(context, DetailScreen());
                                    },
                                    child: LabolOfSecondListView(
                                      index: index,
                                    )),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10.h),
                                itemCount: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class LabolOfSecondListView extends StatelessWidget {
  @override
  final int? index;

  const LabolOfSecondListView({Key? key, this.index}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        border: index == DetailCubit.get(context).currentIndex
            ? Border(right: BorderSide(color: color1, width: 4.sp))
            : Border(right: BorderSide(color: color1, width: 0.sp)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Row(
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
              child: Image.asset("assets/images/mac.png"),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(" Ejani Center $index",
                    style: TextStyle(
                        fontFamily: "FrutigerLTArabic",
                        color: Colors.black,
                        fontSize: 14.sp)),
                // SizedBox(height: 5.h),
                Row(children: [
                  Container(
                      height: 20,
                      child: Image.asset("assets/images/ic_location.png")),
                  SizedBox(width: 10),
                  Text("5 km",
                      style: TextStyle(
                          fontFamily: "FrutigerLTArabic",
                          color: Colors.black54,
                          fontSize: 12.sp)),
                ]),
              ],
            ),
            // SizedBox(width: 80.w),
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 20.w),
              height: 30.h,
              width: 70.w,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: false,
                  itemBuilder: (context, index) => Column(
                        children: [
                          Spacer(),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/ic_delivery_cafe.png",
                                height: 20,
                              ),
                              SizedBox(width: 5.w),
                              Image.asset(
                                "assets/images/ic_delivery_car.png",
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                  separatorBuilder: (context, index) => SizedBox(width: 1.w),
                  itemCount: 1),
            )
          ],
        ),
      ),
    );
  }
}
//the 1 widget

//thw 2 widget
