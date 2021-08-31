import 'package:flutter/material.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularQuestionsScreen extends StatelessWidget {
  const PopularQuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomisedAppBar(
        title: 'الاسئلة الشائعة',
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0.04.sh,
            ),
            Container(
              height: 0.08.sh,
              padding: EdgeInsets.symmetric(vertical: 0.01.sh),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  QuestionCategory(
                    category: 'وسائل الدفع',
                    isSelected: true,
                  ),
                  QuestionCategory(
                    category: 'العروض',
                    isSelected: false,
                  ),
                  QuestionCategory(
                    category: 'الحساب',
                    isSelected: false,
                  ),
                  QuestionCategory(
                    category: 'المنتجات',
                    isSelected: false,
                  ),
                  QuestionCategory(
                    category: 'وسائل الدفع',
                    isSelected: false,
                  ),
                ],
              ),
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              padding:
                  EdgeInsets.only(top: 0.03.sh, right: 0.05.sw, left: 0.05.sw),
              shrinkWrap: true,
              children: [
                QuestionItem(
                  question: 'كيف أستخدم ريست كافي؟',
                ),
                QuestionItem(
                  question: 'لماذا يجب عليك إنشاء صفحة الأسئلة الشائعة',
                ),
                QuestionItem(
                  question: 'متى تكون صفحة الأسئلة الشائعة مناسبة؟',
                ),
                QuestionItem(
                  question: 'كيف تصنع صفحة أسئلة وأجوبة',
                ),
                QuestionItem(
                  question: 'ما هي الأسئلة الأكثر شيوعاً؟',
                ),
                QuestionItem(
                  question: 'ماذا تعني رتبة المبيعات؟',
                ),
                QuestionItem(
                  question: 'كيف أجد معلومات مبيعات لقبي؟',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionCategory extends StatelessWidget {
  final String category;
  final bool isSelected;
  QuestionCategory({required this.category, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? Color(0xff707070) : Colors.grey.shade300),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade700,
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class QuestionItem extends StatelessWidget {
  final String question;
  QuestionItem({required this.question});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                question,
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 26,
                color: Color(0xff4CB379),
              )
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
