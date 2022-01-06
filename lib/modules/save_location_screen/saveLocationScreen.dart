import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_place/google_place.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rest_cafe/shared/cubits/startCubit.dart';
import 'package:rest_cafe/shared/cubits/startState.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/localstroage.dart';
class  SaveLocationScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return SaveLocationScreenState();
  }
}
class SaveLocationScreenState extends State<SaveLocationScreen> {
  var _searchController = TextEditingController();

late  BitmapDescriptor mapMarker;
double ?lat,long;

List<Marker> markers=[];

  setCustomMarker()async{
    mapMarker=await BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/images/Oval.png");
  }
  changeLocation(String text)async{
    final c =await _controller.future;

    var googlePlace = GooglePlace("AIzaSyBdlD4WTPYOclk6wgkf0iKfEvgoHrsF5uM");
    TextSearchResponse? result = await googlePlace.search.getTextSearch(text);

    setState(() {
      lat=result!.results![0].geometry!.location!.lat!;
      long=result.results![0].geometry!.location!.lng!;
      final p= CameraPosition(target: LatLng(lat!,long!),zoom: 14);
      Marker maker=Marker(


        markerId: MarkerId("id_1"),
        position: LatLng(lat!,long!),

        infoWindow: InfoWindow(
          title: "marker 1",

          // snippet: office.address,
        ),
      );

        markers[0]=maker;

      c.animateCamera(CameraUpdate.newCameraPosition(p));
    });


  }


  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _createMarker(double latitude, double longitude) {
    return {
      Marker(

        draggable: true,
        onDragEnd: (v){
          long=v.longitude;
          lat=v.latitude;
        },

        markerId: MarkerId("id_1"),
        position: LatLng(latitude, longitude),

        infoWindow: InfoWindow(
          title: "marker 1",

          // snippet: office.address,
        ),
      ),
    };
  }
  @override
  void initState() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
  setCustomMarker();
  markers.add(Marker(

    draggable: true,
    onDragEnd: (v){
      long=v.longitude;
      lat=v.latitude;
    },
    markerId: MarkerId("id_1"),
    position: LatLng(StartCubit.get(context).location!.latitude.toDouble(), StartCubit.get(context).location!.longitude.toDouble()),

    infoWindow: InfoWindow(
      title: "marker 1",

      // snippet: office.address,
    ),
  )
  );
lat=StartCubit.get(context).location!.latitude;
  long=StartCubit.get(context).location!.longitude;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartCubit,StartState>(
      listener: (context,state){},
      builder: (context,state)=>Scaffold(
        appBar: AppBar(
          toolbarHeight: 130,
          flexibleSpace: Column(
            children: [
              SizedBox(height: 40),
              Text(
                "Delivery address".tr(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
              defaultFormField(
                  height: 40,
                  onChange: (v){
                    StartCubit.get(context).autoComplete(v);
                  },
                  controller: _searchController,
                  type: TextInputType.name,
                  label: "Search".tr(),
                  prefix: Icon(Icons.search)),
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.r),
          )),
        ),
        body: state is SavingData? Center(child: CircularProgressIndicator()):


            Stack(

              children: [
                Container(
                  width: 1.sw,
                  height: 1.sh-(180),
                  child: GoogleMap(
                      onTap: (v){  Marker maker=Marker(


                        markerId: MarkerId("id_1"),
                        position: LatLng(v.latitude,v.longitude),

                        infoWindow: InfoWindow(
                          title: "marker 1",

                          // snippet: office.address,
                        ),
                      );
                      setState(() {
                      markers[0]=maker;
                      long=v.longitude;
                      lat=v.latitude;
                      });

                      },
                      markers:Set<Marker>.of(markers) ,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);

                      },

                      initialCameraPosition: CameraPosition(

                        target: LatLng(StartCubit.get(context).location!.latitude.toDouble(),StartCubit.get(context).location!.longitude),
                        zoom: 13,
                      ),),
                ),state is AutoCompeleteDone?
                Align(alignment: Alignment.topLeft,
                child: ListView.separated(shrinkWrap: true,itemBuilder: (context,index)=>Container(child: Container(color: Colors.white,
                  child: ListTile(tileColor: Colors.white,title: Text(state.data[index].description!),leading: Icon(Icons.add_location_rounded),onTap: (){




               changeLocation(state.data[index].description!);
               _searchController.clear();
               StartCubit.get(context).autoComplete("");
               },),
                )), separatorBuilder: (context,index)=>Divider(height: 0,color: Colors.grey,), itemCount: state.data.length)):Container(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        // color: Colors.white10,
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.sp),
                            topLeft: Radius.circular(30.sp))),
                    width: double.infinity,
                    // height: 120.h,
                    child: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,

                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () async{
                             await DioHelper.getData(endpoint: "api/v1/geocoder", context: context,setParamars: {"latlng":"${lat},${long}"}).then((v){
                                if(v is Response) {


                                  LocalStorage.saveData(
                                      key: "Location", value: json.encode(v.data));
                                 print( LocalStorage.getData(
                                      key: "Location"));
                                }
                              });
                              navigateTo(
                                  context, LayoutScreen(selectedPageIndex: 0));
                            },
                            child: mainBottom(
                                title: "Confirm and save address".tr(),
                                height: 50.h,
                                width: .8.sw),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],

        ),
      ),
    );
  }
}
