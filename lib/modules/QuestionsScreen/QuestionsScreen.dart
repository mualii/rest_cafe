import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_cafe/modules/QuestionsScreen/cubit/QuestionsCubit.dart';
import 'package:rest_cafe/modules/QuestionsScreen/cubit/QuestionsState.dart';
import 'package:rest_cafe/modules/home_screen/homeScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/styles/colors.dart';

class QuestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionsCubit>(
      create: (context) => QuestionsCubit(),
      child: Scaffold(
        appBar: CustomisedAppBar(
          title: 'الاسئلة الشائعة',
          actions: [],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              RowQuestion(),
               RowTitle(title: "كيف أستخدم ريست كافي؟"),
              RowTitle(title: "لماذا يجب عليك إنشاء صفحة الأسئلة الشائعة"),
              RowTitle(title: "متى تكون صفحة الأسئلة الشائعة مناسبة؟"),
              RowTitle(title: "كيف تصنع صفحة أسئلة وأجوبة"),
              RowTitle(title: "ما هي الأسئلة الأكثر شيوعاً؟"),
              RowTitle(title: "ماذا تعني رتبة المبيعات؟"),
              RowTitle(title: "كيف أجد معلومات مبيعات لقبي؟"),
              RowTitle(title: "كيف يمكنني تسهيل عثور العملاء على منتجي؟"),

            ],
          ),
        ),
      ),
    );
  }

  Widget RowTitle({required String title}) => Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),

      child: ListTile(title: Text(title),trailing: Icon(Icons.arrow_forward,color: Color(0xff4CB379),size: 30,),onTap: (){},));

  BlocConsumer<QuestionsCubit, QuestionsState> RowQuestion() {
    return BlocConsumer<QuestionsCubit, QuestionsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Container(
                height: 30.h,
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10) ,
           //     padding:EdgeInsets.symmetric(horizontal: 20,vertical: 0) ,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    itemBuilder: (context, index) =>
                        InkWell(
                          onTap: () {
                            QuestionsCubit.get(context)
                                .changeListItem(index);
                          },
                          child:Container(
                            height: 40.h,
                            width: 80.w,
                            decoration: index == QuestionsCubit.get(context).currentIndex
                                ? BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xff707070),
                            )
                                : BoxDecoration( color: Color(0xff8E8E93).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child:  Center(
                              child: Text(
                                "اسئلة شائعة",textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18.sp,
                                    color: index == QuestionsCubit.get(context).currentIndex
                                        ? Colors.white
                                        : Color(0xff8E8E93)),
                              ),
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 10.w),
                    itemCount: 7),
              );
            },
          );
  }
}


