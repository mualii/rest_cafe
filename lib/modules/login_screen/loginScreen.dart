import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/modules/verify_OTP_screen/verify_OTP_screen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/styles/colors.dart';
class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return LoginScreenState();
  }
}
class LoginScreenState extends State<LoginScreen>  {


  var _userPhoneController = TextEditingController();
  String v="العربيه";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PhoneNumber number = PhoneNumber(isoCode: "SA");
  bool validate=false;
  String ?lang;
  final FocusNode focusNode=FocusNode();
@override
  void initState() {

    super.initState();

    KeyboardVisibilityNotification().addNewListener(

    onChange: (bool change){
     if(change==false)

          FocusScope.of(context).unfocus();
    }
    );

  }



  @override
  Widget build(BuildContext context) {
    bool isArabic = true;
    KeyboardVisibilityNotification().addNewListener(
        onHide: (bool hide){
          print("hidden");
          focusNode.unfocus();
        }
    );
    print("phone ${_userPhoneController.text}");
    return  Scaffold(
        body: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  navigateAndFinish(
                                      context, LayoutScreen(selectedPageIndex: 0));
                                },
                                child: myTitle(
                                    font: 18.sp,
                                    title: "تخطي",
                                    color: Colors.black)),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h),
                  Text(
                    "RESTCAFE",
                    style: TextStyle(
                      fontFamily: "Superclarendon",
                      color: Color(0xff4CB278),
                      fontSize: 45.sp,
                      // fontWeight: FontWeight.w700,
                      // fontStyle: FontStyle.normal,
                    ),
                  ),
                  //   myTitle(title: "RESTCAFE", font: 50.sp, color: color1,),
                  SizedBox(height: .15.sh),
                  Container(

                    width: .91.sw,

                    child:  InternationalPhoneNumberInput(
                        textAlign: TextAlign.right,focusNode: focusNode,
                        inputDecoration: InputDecoration(


                          errorText: validate==true?"برجاء ادخال رقم الجوال الصحيح":null,
                          hintText: "رقم الهاتف",
                        focusedErrorBorder: OutlineInputBorder(

                          borderSide: BorderSide(
                            color: Colors.red
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                          hintStyle: TextStyle(
                            color: Color(0xffAAAAAA),
                            fontSize: 16.sp,
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xffAAAAAA),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),

                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        onInputChanged: (PhoneNumber number) {
                          setState(() {
                            validate=false;
                          });
                          print(number.phoneNumber);
                        },
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,


                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: TextStyle(color: Colors.black),
                        initialValue: number,
                        textFieldController: _userPhoneController,
                        formatInput: false,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputBorder: OutlineInputBorder(),
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                    ),

                  SizedBox(height: 20.h),
                   InkWell(
                      child: mainBottom(
                          title: "تسجيل دخول", width: .90.sw, height: 50.h),
                      onTap: () { if(_userPhoneController.text.length>9 && _userPhoneController.text.length<12){
                        DioHelper.postData(endpoint: "/api/v1/auth/send-otp", context: context,formData: {"phone":_userPhoneController.text});
                        navigateAndFinish(
                            context,
                            PinCodePhoneScreen(
                                PhoneUser: _userPhoneController.text.toString(),
                                timerStart: 20));
                      }
                      else {  validate=true;
                        setState((){

                        });
                      }

                      },
                    ),

                  SizedBox(height: 80.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Image.asset("assets/images/Apple.png"),
                      ),
                      SizedBox(width: 40.w),
                      InkWell(
                        child: Image.asset("assets/images/google.png"),
                      ),
                      SizedBox(width: 40.w),
                      InkWell(
                        child: Image.asset("assets/images/ic_insta.png"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     myTitle(
                  //         title: "ليس لديك حساب؟",
                  //         font: 18.sp,
                  //         color: Colors.black),
                  //
                  //     Text(
                  //       "انشاء حساب",
                  //       style: TextStyle(
                  //         fontFamily: "FrutigerLTArabic",
                  //         fontSize: 18.sp,
                  //         color: color1,
                  //         decoration: TextDecoration.underline,
                  //       ),
                  //     )
                  //     // myTitle(title: "انشاء حساب", font: 18.sp, color: color1),
                  //   ],
                  // ),
                  SizedBox(height: 10.h),
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) =>
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),border: Border.all(width: 1,color: Colors.grey.shade300)
                         ),
                         child: DropdownButtonHideUnderline(
                           
                           child: DropdownButton( borderRadius: BorderRadius.circular(8),hint:  Container(padding: EdgeInsets.all(10),child: Text("اللغة")),value: lang,onChanged:(v){
                             setState((){
                               lang=v as String?;
                             });
                           },items: [
                             DropdownMenuItem(child: Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Text("العربيه"),
                             ),value: "العربيه",),

                             DropdownMenuItem(child: Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Text("English"),
                             ),value: ("English"),),
                           ]),
                         ),
                       ))
                ],
              ),
            ),
          ),
        ),

    );
  }
}
