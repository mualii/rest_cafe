import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/layout/Fuction/ScrollListener.dart';
import 'package:rest_cafe/shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomisedAppBar(
        title: 'المفضلة',
        actions: [],
      ),
      body: ListView(
        controller: scrollController,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          FavoriteItem(
            title: 'سبايسي كرانشي تشيكن',
          ),
          FavoriteItem(
            title: 'بيج تايستي',
          ),
        ],
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final String? title;
  const FavoriteItem({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      //  height: 0.16.sh,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(width: 0.3)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/Bourger.png',
              height: 100.w,
              width: 100.w,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(
                    fontFamily: "FrutigerLTArabic",
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              ),
              Text('ماكدونالد',
                  style: TextStyle(
                      fontFamily: "FrutigerLTArabic",
                      color: Colors.grey.shade600)),
              Text('15 ريال',
                  style: TextStyle(
                      fontFamily: "FrutigerLTArabic",
                      color: Colors.grey.shade600)),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.favorite,
                color: Color(0xff4CB379),
              )
            ],
          )
        ],
      ),
    );
  }
}
