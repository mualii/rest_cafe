import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class PinCodeInput extends StatelessWidget {
  TextEditingController controllerPinText = TextEditingController();

  PinCodeInput({required this.controllerPinText});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        autoDisposeControllers: false,
        appContext: context,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        length: 4,
        obscureText: false,
        cursorColor: Colors.white,

        animationType: AnimationType.fade,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(15),
            fieldHeight: 60,
            fieldWidth: 60,
            activeFillColor: Color(0xff494861),
            activeColor: color1,
            inactiveColor: Color(0xffE6E6E6),
            inactiveFillColor: Color(0xff494861),
            disabledColor: Color(0xff494861),
            borderWidth: 1.5),
        animationDuration: Duration(milliseconds: 300),
        keyboardType: TextInputType.phone,
        controller: controllerPinText,
        //   enableActiveFill: true,
        onCompleted: (v) {
          controllerPinText.text = v;
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }
}
