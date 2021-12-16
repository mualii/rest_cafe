import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/modules/branches_screen/cubit.dart';
import 'package:rest_cafe/modules/branches_screen/states.dart';
import 'package:rest_cafe/modules/detail_screen/detailScreen.dart';
import 'package:rest_cafe/shared/Model/Resturants_model.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/styles/colors.dart';
import 'package:sliding_sheet/sliding_sheet.dart';


class BranchesScreen extends StatefulWidget{
  String id ;

  BranchesScreen(this.id);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
return BranchesScreenState();
  }
}
class BranchesScreenState extends State<BranchesScreen> {

  List<Datum>data=[];
  Uint8List? dataBytes;
bool expand=false;
SheetController controller =SheetController();

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _createMarker(double latitude, double longitude) {

    return {
      Marker(

       icon: BitmapDescriptor.fromBytes(dataBytes!.buffer.asUint8List()),
        markerId: MarkerId("id_1"),
        position: LatLng(latitude, longitude),

        infoWindow: InfoWindow(
          title: "marker 1",

          // snippet: office.address,
        ),
      ),
    };
  }@override
  void initState() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BranchesCubit()..getBranches(context, widget.id),
      child: BlocConsumer<BranchesCubit, BranchesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = BranchesCubit.get(context);
          data=cubit.data;
          dataBytes=cubit.dataBytes;
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
            body:state is BranchesLoadingState? Center(child: CircularProgressIndicator()) : StatefulBuilder(
              builder:(context,setState)=> SlidingSheet(
                elevation: 8,
controller: controller,
                cornerRadius: 16,
                snapSpec:  SnapSpec(
                  // Enable snapping. This is true by default.


                  // Set custom snapping points.

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
                              title:data[0].name,
                              font: 14.sp,
                              color: Color(0xff3D3D3D)),
                          SizedBox(width: 20.w),
                          Text(
                           data.length.toString(),
                            style: TextStyle(
                              fontFamily: "FrutigerLTArabic",
                            ),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                               setState((){
                            expand==true? controller.collapse():    controller.expand();
                                 expand=!expand;
                               });
                              },
                              icon:Image.asset(expand==false?  "assets/images/ic_expand.png":"assets/images/0.png"))
                        ],
                      ),
                    ),
                  );
                },
                // The body widget will be displayed under the SlidingSheet
                // and a parallax effect can be applied to it.
                body: Center(
                  child: GoogleMap(

                    markers:_createMarker(data[0].lat!, data[0].lng!) ,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);

                    },

                    initialCameraPosition: CameraPosition(

                      target: LatLng(data[0].lat!,data[0].lng!),
                      zoom: 13,
                    ),),
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
                                        BranchesCubit.get(context)
                                            .changeListItem(index);
                                        navigateTo(context, DetailScreen(id: data[index].id,distance:data[index].distance.toString(),name: data[0].name,number: data.length.toString() ,));
                                      },
                                      child: LabolOfSecondListView(
                                        item: data[index],
                                        index: index,
                                      )),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 10.h),
                                  itemCount: data.length),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
  final Datum? item;
  final int? index;

  const LabolOfSecondListView({Key? key, this.item,this.index}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        border: index == BranchesCubit.get(context).currentIndex
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
              child: Image.network(item!.logo!),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(" ${item!.name} $index",
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
                  Text(item!.distance.toString(),
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
                              item!.canPickupOrder!?Image.asset(
                                "assets/images/ic_delivery_cafe.png",
                                height: 20,
                              ):Container(),
                              SizedBox(width: 5.w),
                              item!.canDeliverToCar!?  Image.asset(
                                "assets/images/ic_delivery_car.png",
                                height: 20,
                              ):Container(),
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
