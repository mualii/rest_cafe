

import 'package:easy_localization/easy_localization.dart' as date;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/modules/notifications_screen/notfication_state.dart';
import 'package:rest_cafe/modules/notifications_screen/notification_cubit.dart';
import 'package:rest_cafe/modules/order/order_detail_%D9%8Dscreen/orderDedailScreen.dart';
import 'package:rest_cafe/shared/Model/notifications.dart';
import 'package:rest_cafe/shared/components/components.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (BuildContext context) => NotificationCubit()..getNotification(context),
      child: BlocConsumer<NotificationCubit,NotificationState>(
      listener: (context,state){},
        builder:(context, state) =>  Scaffold(
          appBar: CustomisedAppBar(
            title: 'الاشعارات',
            actions: [],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),

              child: state is NotificationLoadingState? Center(child: CircularProgressIndicator()): ListView.builder(
             itemBuilder: (context, index) => NotificationItem(notification: NotificationCubit.get(context).notifications!.data![index]),
        itemCount: NotificationCubit.get(context).notifications!.data!.length,
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
   NotificationItem({
    Key? key,required  this.notification
  }) : super(key: key);
  Datum notification;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){navigateTo(context, OrderDetailScreen(notification.orderId!));},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          // height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300)),
          child: ListTile(
              contentPadding: EdgeInsets.only(right: 10),
              leading: CircleAvatar(
                child: Image.asset("assets/images/ic_alert_packge.png"),
                backgroundColor: Colors.grey.shade200,
              ),
              title: Text(
              notification!.restaurant!,
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(

                 notification!.message!,
                      style: TextStyle(fontSize: 15,)),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

              Text(
               notification!.orderNumber!,
                style: TextStyle(
                  color: Color(0xff4CB379),
                ),
              ),
                      Text(
                        date.DateFormat('MM-dd hh:mm a').format(notification!.createdAt!)
                        ,textDirection: TextDirection.ltr,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
            ],

        ),

                    ],

                ),

              trailing: VerticalDivider(
                thickness: 4.38,
                width: 0,
                color: Color(0xff4CB379),
                indent: 0,
                endIndent: 0,
              )),
        ),
      ),
    );
  }
}
