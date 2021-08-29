import 'package:flutter/material.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondPaymentScreen extends StatelessWidget {
  const SecondPaymentScreen({Key? key}) : super(key: key);

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
                iconData: Icons.person_outlined,
              ),
              DetailsField(
                title: 'رقم الكارت',
                iconData: Icons.payment,
              ),
              DetailsField(
                title: 'شهر/ سنة',
                iconData: Icons.calendar_today_outlined,
              ),
              SizedBox(
                width: 0.4.sw,
                child: DetailsField(
                  title: 'CVV',
                  iconData: Icons.payment,
                ),
              ),
              SizedBox(
                height: 0.1.sh,
              ),
              SizedBox(
                width: 0.95.sw,
                height: 0.06.sh,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('اضف'),
                  style: ElevatedButton.styleFrom(primary: Color(0xff4CB379)),
                ),
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

class DetailsField extends StatelessWidget {
  final String title;
  final IconData iconData;
  DetailsField({required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 12),
            filled: true,
            fillColor: Colors.white,
            hintText: title,
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              iconData,
              color: Color(0xff4CB379),
              size: 25,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0.8, color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: 0.8, color: Colors.grey.shade300),
            )),
      ),
    );
  }
}
