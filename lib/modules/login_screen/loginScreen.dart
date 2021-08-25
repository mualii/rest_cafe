import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:rest_cafe/modules/verify_OTP_screen/verify_OTP_screen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  var _userPhoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PhoneNumber number = PhoneNumber(isoCode: "SA");
  @override
  Widget build(BuildContext context) {
    print("phone ${_userPhoneController.text}");
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myTitle(title: "RESTCAFE", font: 50.sp, color: color1),
              SizedBox(height: .1.sh),
              Container(
                height: 49.h,
                width: .94.sw,
                child: InternationalPhoneNumberInput(
                  textAlign: TextAlign.right,
                  inputDecoration: InputDecoration(
                    hintText: "رقم الهاتف",
                    hintStyle: TextStyle(
                      color: Color(0xffAAAAAA),
                      fontSize: 16.sp,
                    ),
                    labelStyle: TextStyle(
                      color: Color(0xffAAAAAA),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onInputChanged: (PhoneNumber number) {
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
                onTap: () => navigateAndFinish(
                    context,
                    PinCodePhoneScreen(
                        PhoneUser: _userPhoneController.text.toString(),
                        timerStart: 20)),
              ),
              SizedBox(height: 70.h),
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
                    child: Image.asset("assets/images/inista.png"),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myTitle(
                      title: "ليس لديك حساب؟",
                      font: 18.sp,
                      color: Colors.black),
                  myTitle(title: "انشاء حساب", font: 18.sp, color: color1),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
