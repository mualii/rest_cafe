import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/shared/components/components.dart';

class PaymentScreen2 extends StatelessWidget {
  const PaymentScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomisedAppBar(
          title: 'اضافة وسيلة دفع',
          actions: [],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.sw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/Group 2.png',
                width: 0.95.sw,
                fit: BoxFit.fill,
              ),
              DetailsField(
                title: 'الاسم بالكامل',
                iconData: Container(
                    height: 10,
                    child: Image.asset("assets/images/ic_input_user.png",)),
              ),
              DetailsField(
                title: 'رقم الكارت',
                iconData: Container(
                    height: 1,
                    width: 5,
                    child: Image.asset("assets/images/ic_input_card.png")),
                isNumeric: true,
              ),
              DetailsField(
                title: 'شهر/ سنة',
                iconData: Container(
                    height: 10,
                    child: Image.asset("assets/images/ic_input_calendar.png")),
                isNumeric: true,
              ),
              SizedBox(
                width: 0.4.sw,
                child: DetailsField(
                  title: 'CVV',
                  iconData: Container(
                      height: 20,
                      child: Image.asset("assets/images/ic_input_card.png")),
                  isNumeric: true,
                ),
              ),
              SizedBox(
                height: 0.1.sh,
              ),
              mainBottom(
                title: "اضف",
                width: .9.sw,
                height: 45.h,
              ),
              SizedBox(
                height: 0.02.sh,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
