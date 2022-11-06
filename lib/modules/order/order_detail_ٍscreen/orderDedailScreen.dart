import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:rest_cafe/modules/order/chat_order_screen/chatOrderScreen.dart';
import 'package:rest_cafe/modules/order/order_detail_%D9%8Dscreen/order_detail_state.dart';
import 'package:rest_cafe/shared/Model/order_details_model.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/localstroage.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

import 'order_detail_cubit.dart';

class OrderDetailScreen extends StatelessWidget {
  String id;
int rate=1;
TextEditingController rateController = TextEditingController();
  OrderDetailScreen(this.id);


  /// Get map image provider from controller.
  /// You can also get image url by accessing
  /// `_controller.url` property.

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocProvider(
        create: (context) => OrderDetailsCubit()..getOrderDetails(context, id),
        child: BlocConsumer<OrderDetailsCubit, OrderDetailState>(
          listener: (context, state) {

          if(  state is !OrderDetailsLoading){
if(OrderDetailsCubit.get(context).details!.status_id==6 && OrderDetailsCubit.get(context).details!.review==null)
          showModalBottomSheet(isDismissible: false,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) => Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
color: Colors.black87,
          borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.sp),
          topLeft: Radius.circular(40.sp))),
          height: 390.h,
          child: Directionality(
          textDirection: TextDirection.rtl,
          child:Column(

            children: [
              myTitle(
                  title: "تقييم الطلب",
                  font: 18.sp,
               ),
              SizedBox(height: 20.h),
              RatingBar.builder(
                initialRating: 3,
                minRating: rate.toDouble(),
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                  rate=rating.toInt();
                },
              ),
              SizedBox(height: 10.h,),
              defaultFormField(controller: rateController, type: TextInputType.name,
                height: 150.h,
                maxLines: 10,
                hint: "اكتب تقييمك هنا"


              ),
              Spacer(),
              InkWell(
                onTap: ()async{
                 var response= await DioHelper.postData(endpoint:"api/v1/orders/rate" ,formData: {"order_id":id,"rate":rate,

"review":rateController.text
                 }, context: context);
                  if(response is Response)
                    Fluttertoast.showToast(msg: "شكرا لتقيمك");
                    Navigator.of(context).pop();
                },
                child: mainBottom(
                    title: "قيم",
                    height: 50.h,
                    width: .8.sw),
              ),
            ],
          ))));


          }},
          builder: (context, state) {
            return state is OrderDetailsLoading
                ? Center(child: CircularProgressIndicator())
                : Scaffold(

              appBar: AppBar(
                toolbarHeight: 265.h,
                flexibleSpace: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.grey,
                              ),
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xffDADADA)),
                                      borderRadius:
                                      BorderRadius.circular(20.sp)),
                                  child: Image.network(
                                      OrderDetailsCubit
                                          .get(context)
                                          .details!
                                          .branch!
                                          .logo
                                          .toString(),height: 100.h,),
                                ),
                                myTitle(
                                    title: OrderDetailsCubit
                                        .get(context)
                                        .details!
                                        .branch!
                                        .name,
                                    font: 16.sp,
                                    ),
                              ],
                            ),

                            Container(
                              height: 40.h,
                              // child: InkWell(
                              //   onTap: () {
                              //     navigateTo(context, ChatOrderScreen());
                              //   },
                              //   child: Image.asset("assets/images/11.png"),
                              // ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),

                      Divider(
                        height: 3.h,

                      ),

                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                                padding: EdgeInsets.only(bottom: 1),
                                decoration: BoxDecoration(

                                    borderRadius:
                                    BorderRadius.circular(10.sp),
                                    border: Border.all(color: Colors.grey)),
                                child: myTitle(

                                    font: 14.sp,
                                    title: OrderDetailsCubit
                                        .get(context)
                                        .details!
                                        .status)),

                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "mins".tr(),
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.brown,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "  30-40",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.brown,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Prep time".tr(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.sp),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                myTitle(
                                    title: OrderDetailsCubit
                                        .get(context)
                                        .details!.deliveryType=="PICKUP"?"Pick up".tr():OrderDetailsCubit
                                        .get(context)
                                        .details!.deliveryType=="VEHICLE"?"To car".tr():"Reserve a table".tr(),

                                    font: 12.sp), Container(
                                  height: 20,
                                  width: 20,
                                  child:
                                  Image.asset("assets/images/dilevery1.png"),
                                ),
                              ],
                            ),

                          ],
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                automaticallyImplyLeading: false,

              ),
              body: 
                Container(
                  padding: EdgeInsets.all(20.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myTitle(
                                title: OrderDetailsCubit.get(context).address,
                                font: 14.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: .16.sh,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffDADADA)),
                              borderRadius: BorderRadius.circular(20.sp)),
                          child: InkWell(
                            onTap: (){
                              MapsLauncher.launchCoordinates( OrderDetailsCubit
                                  .get(context)
                                  .details!
                                  .branch!
                                  .lat!,  OrderDetailsCubit.get(context)
                                  .details!
                                  .branch!
                                  .lng!,OrderDetailsCubit.get(context)
                                  .details!
                                  .branch!.name);
                            },
                            child:Image(

                              image: StaticMapController(
                                googleApiKey: "AIzaSyDAc-y-9PWVagF01ChYsf0Goo50Pybdli0",
                                width: 200,
                                height: 200,
                                zoom: 10,markers:  <Marker>[
                              /// Define marker style
                              Marker(
                              color: Colors.red,
                                label: "A",size: MarkerSize.small,
                                locations: [
                                  /// Provide locations for markers of a defined style
                                  Location(OrderDetailsCubit.get(context).details!.branch!.lat!, OrderDetailsCubit.get(context).details!.branch!.lng!),

                                ],
                              ),],
                                center: Location(OrderDetailsCubit.get(context).details!.branch!.lat!, OrderDetailsCubit.get(context).details!.branch!.lng!),
                              ).image,fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myTitle(
                                title: "Products".tr(),
                                font: 14.sp,
                                ),
                          ],
                        ),
                        SizedBox(height: 10),

                           ListView.separated(
                              shrinkWrap: true,
                              physics:NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) =>
                                  ListModle(OrderDetailsCubit
                                      .get(context)
                                      .details!
                                      .orderLine![index]),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                  SizedBox(height: 15.h),
                              itemCount: OrderDetailsCubit
                                  .get(context)
                                  .details!
                                  .orderLine!.length),

                        SizedBox(height:80.h ,)
                      ],
                    ),
                  ),
                ),

              // bottomSheet: Container(
              //   padding: EdgeInsets.all(20.h),
              //   height: 100,
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       // border: Border.all(color: Colors.black38),
              //       borderRadius: BorderRadius.only(
              //           topRight: Radius.circular(40.sp),
              //           topLeft: Radius.circular(40.sp))),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       mainBottom(
              //           title: "End order".tr(), height: 50.h, width: .4.sw),
              //
              //       Container(
              //           height: 30,
              //           child: Image.asset("assets/images/pay (1).jpg")),
              //
              //       Text(
              //           "${OrderDetailsCubit
              //               .get(context)
              //               .details!
              //               .total
              //               .toString()} "+"SAR".tr()),
              //     ],
              //   ),
              // ),
            );

          }),
      ),
    );
  }
}

class ListModle extends StatelessWidget {
  OrderLine item;

  ListModle(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(

          border: Border.all(color: Color(0xffDADADA)),
          borderRadius: BorderRadius.circular(20.sp)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) => Container(
                    padding: EdgeInsets.all(20.h),
                    decoration: BoxDecoration(
color: LocalStorage.getData(key: "theme")=="light"? Colors.white:Colors.black,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.sp),
                            topLeft: Radius.circular(40.sp))),
                    height: .5.sh,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Center(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  child:
                                  Image.network(item.image.toString()),
                                  height: 70.h,
                                ),
                                myTitle(
                                    title: item.name,
                                    font: 14.sp ,
                                    lines: 1,

                                 ),
                                // SizedBox(height: 5.h),
                                myTitle(
                                    title: "Extras".tr(),
                                    font: 14.sp,
                                 ),


                                ListView.separated(shrinkWrap: true,
                                    itemBuilder: (context,index)=>Row(
                                      children: [
                                        myTitle(
                                            title: item.extras![index].price.toString(),
                                            font: 14.sp,
                                            ),
                                        Spacer(),
                                        myTitle(
                                            title: item.extras![index].name,
                                            font: 14.sp,
                                          ),
                                      ],
                                    ),
                                    separatorBuilder: (context,index)=> Divider(color: Colors.grey),
                                    itemCount: item.extras!.length)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ));
            },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


                  Row(

                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.grey),
                      myTitle(
                           font: 14.sp, title: "Extras".tr()),]),
                      Column(
                        children: [
                          myTitle(title: item.name, font: 14.sp, ),
                          Row(
                            children: [
                              myTitle(
                                  title: "${item.unitPrice} "+"SAR".tr(),
                                  font: 14.sp,
                                  ),
                              myTitle(
                                  title: "${item.quantity}x", font: 14.sp, color: color1),

                            ],
                          ),
                        ],
                      ),

                    Container(
                            height: 80,
                            width: 70,
                            child: Image.network(item.image.toString())),

                    ],
                  ),
        ),
      )






    );
  }
}
