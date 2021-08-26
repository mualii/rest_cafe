import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/detail_screen/cubit/cubit.dart';
import 'package:rest_cafe/modules/detail_screen/cubit/states.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

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
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "اختر الفرع",
                style: TextStyle(color: Colors.black54),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 1,
            ),
            body: Image.asset("assets/images/location.png"),
            bottomSheet: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.sp),
                      topLeft: Radius.circular(30.sp))),
              width: double.infinity,
              height: .36.sh,
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            myTitle(
                                title: "فروع ماكدونالد",
                                font: 14.sp,
                                color: Color(0xff3D3D3D)),
                            SizedBox(width: 20.w),
                            Text("57"),
                            SizedBox(width: .49.sw),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_drop_down_circle_sharp,
                                  size: 30.sp,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // LabolOfSecondListView()
                      Container(
                        height: .26.sh,
                        child: ListView.separated(
                            shrinkWrap: false,
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  DetailCubit.get(context)
                                      .changeListItem(index);
                                },
                                child: LabolOfSecondListView(
                                  index: index,
                                )),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10.h),
                            itemCount: 10),
                      )
                    ],
                  ),
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
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffDADADA)),
                  borderRadius: BorderRadius.circular(20.sp)),
              child: Image.asset("assets/images/mac.png"),
            ),
            SizedBox(width: 20.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("1160 Ejani Center",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp)),
                SizedBox(height: 10.h),
                Row(children: [
                  Icon(FontAwesomeIcons.utensils),
                  Text("5 km",
                      style: TextStyle(color: Colors.black54, fontSize: 12.sp)),
                ]),
              ],
            ),
            SizedBox(width: 20.w),
            Spacer(),
            Container(
              height: 30.h,
              width: 60.w,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: false,
                  itemBuilder: (context, index) =>
                      Image.asset("assets/images/Type1Rest.png"),
                  separatorBuilder: (context, index) => SizedBox(width: 3.w),
                  itemCount: 3),
            )
          ],
        ),
      ),
    );
  }
}
