import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/modules/Payment_screens/second_payment_screen.dart';
import 'package:rest_cafe/shared/components/components.dart';

import 'Cubit/payment_cubit.dart';

class PaymentScreen1 extends StatefulWidget {
  @override
  _PaymentScreen1State createState() => _PaymentScreen1State();
}

class _PaymentScreen1State extends State<PaymentScreen1> {
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
      body: BlocProvider<PaymentCubit>(
        create: (context) => PaymentCubit(),
        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            PaymentCubit paymentCubit = PaymentCubit.getObject(context);

            return ListView.builder(
              shrinkWrap: true,
              padding:
                  EdgeInsets.symmetric(horizontal: 0.08.sw, vertical: 0.02.sh),
              itemCount: 3,
              itemBuilder: (context, index) {
                return PaymentMethod(
                  paymentCubit: paymentCubit,
                  select: paymentCubit.listPaymentModel[index].isSelect,
                  index: index,
                  title: paymentCubit.listPaymentModel[index].title,
                  image: paymentCubit.listPaymentModel[index].image,
                  functionLong: () {
                    modalBottomSheetMenu(context: context);
                  },
                );
              },
              // children: [
              //
              //   PaymentMethod(
              //     select: false,
              //     index:2,
              //     title: "Paypal",
              //     image: 'assets/images/pay (2).png',
              //     functionLong: () {
              //       modalBottomSheetMenu(context: context);
              //     },
              //   ),
              //   PaymentMethod(
              //       index:3 ,
              //     select: false,
              //     title: 'فيزا 5689****',
              //     image: 'assets/images/pay (1).jpg',
              //     functionLong: () {
              //       modalBottomSheetMenu(context: context);
              //     }
              //   ),
              // ],
            );
          },
        ),
      ),
    );
  }

  void modalBottomSheetMenu({required BuildContext context}) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        context: context,
        builder: (builder) {
          return new Container(
            height: 0.35.sw,
            alignment: Alignment.center,
            //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/22.png"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("تعديل")
                    ],
                  ),
                  VerticalDivider(
                    thickness: 2,
                    indent: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/21.png"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("جعلة مفضل")
                    ],
                  ),
                  VerticalDivider(
                    thickness: 2,
                    indent: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/20.png"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("حذف")
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class PaymentMethod extends StatelessWidget {
  final String image;
  final String title;
  bool select;
  int index;
  PaymentCubit paymentCubit;
  final void Function() functionLong;

  PaymentMethod({
    required this.paymentCubit,
    required this.title,
    required this.index,
    required this.select,
    required this.image,
    required this.functionLong,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        paymentCubit.changeSelect(index: index);
      },
      onLongPress: functionLong,
      child: Container(
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
            ),
            Spacer(),
            CircleCheckBox(
              select: select,
              onValueChanged: (bool value) {},
            )
          ],
        ),
      ),
    );
  }
}
