import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:rest_cafe/layout/LayoutScreen.dart';
import 'package:rest_cafe/modules/home_screen/cubit/HomeCubit.dart';
import 'package:rest_cafe/modules/save_location_screen/saveLocationScreen.dart';
import 'package:rest_cafe/modules/splash_screen/splashScreen.dart';
import 'package:rest_cafe/modules/verify_OTP_screen/verify_OTP_screen.dart';

import 'package:rest_cafe/shared/Model/user_model.dart';
import 'package:rest_cafe/shared/apple_login_helper.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/cubits/startCubit.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/localstroage.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  signInWithGoogle() async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    GoogleSignIn _googleSignIn = new GoogleSignIn(
      scopes: ['email', 'profile'],
    );
    // Trigger the authentication flow
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleSignInAccount!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("credential accessToken = " + credential.accessToken!);
    print("credential idToken = " + credential.idToken!);
    User? user = (await _firebaseAuth.signInWithCredential(credential)).user;

    print("User = " + user!.providerData.toString());
    Response response = await DioHelper.postData(
        endpoint: "/api/v1/auth/google-login",
        context: context,
        formData: {
          "token": credential.accessToken!,
        });
    if (response.statusCode == 200) {
      StartCubit.get(context).saveNumber(response);
      navigateAndFinish(context, SaveLocationScreen());
    } else {
      print("error from server");
    }
  }

  var _userPhoneController = TextEditingController();
  String language =
      LocalStorage.getData(key: "lang") == "ar" ? "English" : "العربية";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PhoneNumber number = PhoneNumber(isoCode: "SA");
  bool validate = false;
  String? lang;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(onChange: (bool change) {
      if (change == false) FocusScope.of(context).unfocus();
    });
    print(LocalStorage.getData(key: "lang"));
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = true;
    KeyboardVisibilityNotification().addNewListener(onHide: (bool hide) {
      print("hidden");
      focusNode.unfocus();
    });
    print("phone ${_userPhoneController.text}");
    return Scaffold(
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

                                HomeCubit.get(context).user=ClientUser(name: "user".tr());
                                navigateAndFinish(context,
                                    SaveLocationScreen());
                              },
                              child: myTitle(
                                  font: 18.sp,
                                  title: "Skip".tr(),
                                  color: Colors.black)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 100.h),
                Text(
                  "FastMenu",
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
                  child: InternationalPhoneNumberInput(
                    textAlign: TextAlign.right,
                    focusNode: focusNode,
                    maxLength: 10,
                    inputDecoration: InputDecoration(
                      errorText: validate == true
                          ? "Phone number is not valid".tr()
                          : null,
                      hintText: "Phone".tr(),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
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
                        validate = false;
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
                      title: "Sign in".tr(), width: .90.sw, height: 50.h),
                  onTap: () {
                    if (_userPhoneController.text.length > 9 &&
                        _userPhoneController.text.length < 12) {
                      DioHelper.postData(
                          endpoint: "/api/v1/auth/send-otp",
                          context: context,
                          formData: {"phone": _userPhoneController.text});
                      navigateTo(
                          context,
                          PinCodePhoneScreen(
                              PhoneUser: _userPhoneController.text.toString(),
                              timerStart: 20));
                    } else {
                      validate = true;
                      setState(() {});
                    }
                  },
                ),

                SizedBox(height: 80.h),
                Platform.isIOS
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Image.asset("assets/images/Apple.png"),
                            onTap: () async {
                              await AppleLogin()
                                  .signInWithApple(context: context);
                            },
                          ),
                          SizedBox(width: 40.w),
                          InkWell(
                            child: Image.asset("assets/images/google.png"),
                            onTap: () async {
                              await signInWithGoogle();
                            },
                          ),
                        ],
                      )
                    : InkWell(
                        child: Image.asset("assets/images/google.png"),
                        onTap: () async {
                          await signInWithGoogle();
                        },
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
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade300)),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  if (language == "English") {
                                    LocalStorage.saveData(
                                        key: "lang", value: "en");
                                    context.setLocale(Locale('en'));
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SplashScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  } else {
                                    LocalStorage.saveData(
                                        key: "lang", value: "ar");
                                    context.setLocale(Locale('ar'));
                                    LocalStorage.saveData(
                                        key: "lang", value: "ar");
                                    context.setLocale(Locale('ar'));
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SplashScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  }
                                });

                                // await context.setLocale(EasyLocalization.of(context)!.supportedLocales[1]);
                              },
                              child: Text(language),
                            )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
