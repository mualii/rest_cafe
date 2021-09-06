import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_cafe/layout/Fuction/ScrollListener.dart';
import 'package:rest_cafe/modules/OrderCurrnentAndEnd/Widgets/OrderCard.dart';
import 'package:rest_cafe/shared/Model/OrderCurrentAndEnd.dart';

class OrderCurrent extends StatelessWidget {
  List<ModelOrderCurrentAndEnd> listOrder = [
    ModelOrderCurrentAndEnd(
      name: "ماكدونالد",
      cost: "96",
      date: "02:16AM  06 Jan 2021 ",
      image: "assets/images/mac.png",
      numItem: "5",
      star: "1",
      statue: "الطلب جاري",
    ),
    ModelOrderCurrentAndEnd(
      name: "هارديز",
      cost: "96",
      date: "02:16AM  06 Jan 2021 ",
      image: "assets/images/mac.png",
      numItem: "5",
      star: "4",
      statue: "جاري التحضير",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: listOrder.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return OrderCard(listOrder: listOrder[index]);
        });
  }
}

class OrderEnd extends StatelessWidget {
  List<ModelOrderCurrentAndEnd> listOrder = [
    ModelOrderCurrentAndEnd(
        name: "ماكدونالد",
        cost: "96",
        date: "02:16AM  06 Jan 2021 ",
        image: "assets/images/mac.png",
        numItem: "5",
        statue: "الطلب مرفوض",
        star: "3"),
    ModelOrderCurrentAndEnd(
      name: "هارديز",
      cost: "96",
      date: "02:16AM  06 Jan 2021 ",
      image: "assets/images/mac.png",
      numItem: "5",
      star: "5",
      statue: "جاري منتهى",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: listOrder.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return OrderCard(
            listOrder: listOrder[index],
            haveRate: true,
          );
        });
  }
}
