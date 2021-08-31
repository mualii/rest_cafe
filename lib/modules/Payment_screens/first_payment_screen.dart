import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/modules/Payment_screens/second_payment_screen.dart';
import 'package:rest_cafe/shared/components/components.dart';

class PaymentScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomisedAppBar(
        title: 'وسائل الدفع',
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PaymentScreen2()),
                );
              },
              icon: Icon(
                Icons.add,
                color: Colors.grey,
                size: 30,
              ))
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 0.08.sw, vertical: 0.02.sh),
        children: [
          PaymentMethod(title: 'سداد', image: 'assets/images/pay (1).png'),
          PaymentMethod(title: "Paypal", image: 'assets/images/pay (2).png'),
          PaymentMethod(
              title: 'فيزا 5689****', image: 'assets/images/pay (1).jpg'),
        ],
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  final String image;
  final String title;
  PaymentMethod({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 0.07.sh,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blueGrey.shade100)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              width: 0.12.sw,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
