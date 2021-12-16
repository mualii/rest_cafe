import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_cafe/layout/Fuction/ScrollListener.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/Screens/OrderState.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/Screens/Order_cubit.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/Widgets/OrderCard.dart';
import 'package:rest_cafe/modules/order/order_detail_%D9%8Dscreen/orderDedailScreen.dart';
import 'package:rest_cafe/shared/Model/OrderCurrentAndEnd.dart';
import 'package:rest_cafe/shared/components/components.dart';

class OrderCurrent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    OrderCubit.get(context).getOrders(context);
    return BlocConsumer<OrderCubit,OrderState>(
      listener: (context,state){},
      builder: (context,state)=> state is OrderLoadingState? Center(child: CircularProgressIndicator()): ListView.builder(
          controller: scrollController,
          itemCount: OrderCubit.get(context).orders.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  navigateTo(context, OrderDetailScreen(OrderCubit.get(context).orders[index].id!));
                },
                child: OrderCard(order:OrderCubit.get(context).orders[index] ));
          }),
    );
  }
}

// class OrderEnd extends StatelessWidget {
//   List<ModelOrderCurrentAndEnd> listOrder = [
//     ModelOrderCurrentAndEnd(
//         name: "ماكدونالد",
//         cost: "96",
//         date: "02:16AM  06 Jan 2021 ",
//         image: "assets/images/mac.png",
//         numItem: "5",
//         statue: "الطلب مرفوض",
//         star: "3"),
//     ModelOrderCurrentAndEnd(
//       name: "هارديز",
//       cost: "96",
//       date: "02:16AM  06 Jan 2021 ",
//       image: "assets/images/mac.png",
//       numItem: "5",
//       star: "5",
//       statue: "جاري منتهى",
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         controller: scrollController,
//         itemCount: listOrder.length,
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           return OrderCard(
//             listOrder: listOrder[index],
//             haveRate: true,
//           );
//         });
//   }
// }
