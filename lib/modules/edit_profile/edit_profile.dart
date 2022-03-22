import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rest_cafe/modules/home_screen/cubit/HomeCubit.dart';
import 'package:rest_cafe/shared/Model/profile_model.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class EditProfile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return EditProfileState();
  }
  
}
class EditProfileState extends State<EditProfile> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomisedAppBar(
        title: 'Edit profile'.tr(),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.06.sw),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            CircleAvatar(
              minRadius: 30,
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.person,
                size: 70,
                color: Colors.white,
              ),
            ),
            DetailsField(
              disable:false,
              controller: nameController,
              title: HomeCubit.get(context).user!.name??"Next".tr(),
              iconData: Icon(Icons.person_outline, size: 25, color: color1),
            ),
            DetailsField(
              disable: HomeCubit.get(context).user!.email!=null?true:false ,
              controller: emailController,
              title:HomeCubit.get(context).user!.email??"Email".tr(),
              iconData: Icon(Icons.email_outlined, size: 25, color: color1),
            ),
            Row(
              children: [
                Container(
                  height: 0.075.sh,
                  width: 0.2.sw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Center(
                      child: Text(
                        '966+',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                Spacer(),
                Container(
                  width: 0.65.sw,
                  child: DetailsField(
                      disable: HomeCubit.get(context).user!.phone!=null?true:false,
                      title: HomeCubit.get(context).user!.phone!=null?HomeCubit.get(context).user!.phone!:'Phone'.tr(),
                    iconData: Icon(Icons.call, size: 25, color: color1),
                    isIcon: false,
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: 0.95.sw,
              height: 0.06.sh,
              child: ElevatedButton(
                onPressed: () async{
                  print(emailController.text);
                 if(  nameController.text=="")
                   Fluttertoast.showToast(msg: "Complete required data".tr());
                 else{
               var response=   await DioHelper.update(endpoint: "api/v1/users/edit", setParamars:{"name":nameController.text,"email":emailController.text}, context: context);
               if(response is Response) {
                 Fluttertoast.showToast(msg: "Saved".tr());
                 Navigator.of(context).pop();
                 HomeCubit.get(context).user!.name=User.fromJson(response.data).name;
               }
                }},
                child: Text('Edit'.tr()),
                style: ElevatedButton.styleFrom(primary: Color(0xff4CB379)),
              ),
            ),
            SizedBox(
              height: 0.03.sh,
            ),
          ],
        ),
      ),
    );
  }
}