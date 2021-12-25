import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/Screens/cart_state.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/cart_cubit.dart';
import 'package:rest_cafe/modules/add_screen/cubit/cubit.dart';
import 'package:rest_cafe/modules/add_screen/cubit/states.dart';
import 'package:rest_cafe/modules/detail_screen/cubit/detial_cubit.dart';
import 'package:rest_cafe/modules/detail_screen/detailScreen.dart';
import 'package:rest_cafe/modules/favorites_screen/favourites_cubit.dart';
import 'package:rest_cafe/shared/Model/cart_model.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class AddScreen extends StatelessWidget {
  String id;
  String branchId;
bool favorite;
  int price;
  bool details;
  AddScreen(this.branchId,this.id,this.price,this.favorite,this.details);

  bool  isFav=false ;


  int count = 1;
  @override
  Widget build(BuildContext context) {
    isFav=favorite;
    return BlocProvider(
      create: (context) => AddCubit()..getSides(context, id,price),
      child: BlocConsumer<AddCubit, AddState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state is DataLoaded? Container(
            height: .9.sh,
            padding: EdgeInsets.all(7.sp),

              child: Column(
                children: [
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) => Row(
                      children: [
                        IconButton(
                          icon: (!isFav ) ? Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.grey,
                          )
                              : Icon(
                            Icons.favorite,
                            color: color1,
                          ),

                          onPressed: () async{
                            setState(() {


                              isFav = !isFav;
                            });
                            if(isFav)
                              await DioHelper.postData(endpoint: "api/v1/favourites/${id}", context: context);
                            else
              
                              await DioHelper.delete(endpoint: "api/v1/favourites/remove/${id}", context: context);
                            
                            details==true?
DetailCubit.get(context).getDetails(context, DetailCubit.get(context).details!.id!):FavoutiresCubit.get(context).getFavourties(context);
                          },
                        ),
                        SizedBox(width: .6.sw),
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
                  ),
                  Center(child: Image.network(state.sideDish!.image.toString(),height: 240,)),
                  Center(
                      child: myTitle(
                          title: state.sideDish!.name,
                          font: 16.sp,
                          color: Colors.black)),
                  Expanded(


                      child: ListView.separated(shrinkWrap: true,
                        itemBuilder:  (context,index)=>
                          ListTile(
                            title: myTitle(
                                title: state.sideDish!.extras![index].name, color: Colors.black, font: 14.sp),
                            trailing: myTitle(
                                title:state.sideDish!.extras![index].price.toString() , color: Colors.grey, font: 14.sp),
                            leading: Checkbox(
                                value: AddCubit.get(context).choises[index],
                                activeColor: color1,
                                onChanged: (bool? value) {
                                  bool i = AddCubit.get(context)
                                      .onChangedCheckBox(AddCubit.get(context).choises[index],index);
                                  AddCubit.get(context).choises[index] = i;
                                }),
                          ),
                     itemCount: state.sideDish!.extras!.length,
                        separatorBuilder: (context,index)=>Divider(),

                      ),
                    ),


                  // SizedBox(height: 15.h),
                 Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async{
                            if(CartCubit.get(context).mainId==null  )
                              CartCubit.get(context).mainId=branchId;
                          if (CartCubit.get(context).mainId==branchId){



                          var response= await DioHelper.postData(endpoint: "api/v1/carts", context: context,formData: {
                              "item_id":id,"quantity":AddCubit.get(context).counter,"extras":AddCubit.get(context).ids
                            });
                          if(response is Response)
                          CartCubit.get(context).updateCart(response);
                          Navigator.of(context).pop();
                          } else{
                            AwesomeDialog(
                              context: context,
                              //dialogType: DialogType.INFO,
                              customHeader: Image.asset(
                                  "assets/images/ic_delete_item_popup.png"),
                              animType: AnimType.BOTTOMSLIDE,

                              body: Column(
                                children: [
                                  Text(
                                    "حذف السله",
                                    style: TextStyle(
                                      color: color1,
                                      fontFamily: "FrutigerLTArabic",
                                    ),
                                  ),
                                  Text(
                                    "لا يمكك الطلب من متجرين مختلفين هل تريد حذف السلة؟  ",
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
                                  "تراجع",
                                  style: TextStyle(color: Color(0xff4CB379)),
                                ),
                              ),

                              btnCancel: ElevatedButton(
                                onPressed: () async{
                                 CartCubit.get(context).mainId=branchId;
                                  var response= await DioHelper.postData(endpoint: "api/v1/carts/clear", context: context,
                                  );
                                  if(response is Response)
                                    CartCubit.get(context).updateCart(response);
                                   response= await DioHelper.postData(endpoint: "api/v1/carts", context: context,formData: {
                                    "item_id":id,"quantity":AddCubit.get(context).counter,"extras":AddCubit.get(context).ids
                                  });
                                  if(response is Response)
                                    CartCubit.get(context).updateCart(response);
                                  Navigator.of(context).pop();
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
                                  "حذف",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )..show();

                          }}
                         ,
                          child: mainBottom(
                              title: "اضافة ${AddCubit.get(context).total}   ريال ", height: 50.h, width: 140.w),
                        ),
                        SizedBox(width: 20.w),
                        InkWell(
                          onTap: () {
                            count = AddCubit.get(context).addOneItemFromCard(count);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
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
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: Center(
                              child: myTitle(
                                  color: color1, title: "$count", font: 25.sp),
                            )),
                        InkWell(
                          onTap: () {
                            count =
                                AddCubit.get(context).MinusOneItemFromCard(count);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xffE7E7E7),
                            ),
                            child: Icon(FontAwesomeIcons.minus,
                                color: Colors.black38, size: 17.sp),
                          ),
                        ),
                      ],
                    ),

                ],
              ),

          ):Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
