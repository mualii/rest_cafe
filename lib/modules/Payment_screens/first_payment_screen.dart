import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          PaymentMethod(title: 'سداد', image: 'assets/images/pay (1).png',function: (){
            modalBottomSheetMenu(context: context);
          },),
          PaymentMethod(title: "Paypal", image: 'assets/images/pay (2).png',function: (){},),
          PaymentMethod(
              title: 'فيزا 5689****', image: 'assets/images/pay (1).jpg',function: (){},),
        ],
      ),
    );
  }
  void modalBottomSheetMenu({required BuildContext context}){
    showModalBottomSheet(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        context: context,
        builder: (builder){
          return new Container(
            height: 0.35.sw,
    alignment: Alignment.center,
    //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
         padding:EdgeInsets.symmetric(horizontal: 60,vertical: 10) ,
            child: Center(

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                    FaIcon(FontAwesomeIcons.trash,color: Color(0xff4CB379),),
                    SizedBox(height: 5,),
                    Text("حذف")
                  ],),
                  VerticalDivider(thickness: 2,indent: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                    FaIcon(FontAwesomeIcons.checkSquare,color: Color(0xff4CB379),),
                      SizedBox(height: 5,),
                    Text("جعلة مفضل")
                  ],),
                  VerticalDivider(thickness: 2,indent: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                    FaIcon(FontAwesomeIcons.pen,color: Color(0xff4CB379),),
                      SizedBox(height: 5,),
                    Text("تعديل")
                  ],),
                ],
              ),
            ),
          );
        }
    );
  }
}

class PaymentMethod extends StatelessWidget {
  final String image;
  final String title;
  final void Function() function;

  PaymentMethod({required this.title, required this.image ,required this.function });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
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
            )
          ],
        ),
      ),
    );
  }
}
