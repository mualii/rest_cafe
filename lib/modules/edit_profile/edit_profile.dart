import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rest_cafe/shared/components/components.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomisedAppBar(
        title: 'تعديل الملف الشخصي',
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.06.sw),
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/images/Pic.png'),
            )),
            DetailsField(
              title: 'الاسم',
              iconData: Icons.person_outline,
            ),
            DetailsField(
              title: 'الايميل',
              iconData: Icons.email_outlined,
            ),
            Row(
              children: [
                Container(
                  height: 0.075.sh,
                  width: 0.2.sw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Center(
                      child: Text(
                    '966+',
                    style: TextStyle(fontSize: 18),
                  )),
                ),
                Spacer(),
                Container(
                  width: 0.65.sw,
                  child: DetailsField(
                    title: 'رقم الهاتف',
                    iconData: Icons.call,
                    isIcon: false,
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: 0.95.sw,
              height: 0.06.sh,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('تعديل'),
                style: ElevatedButton.styleFrom(primary: Color(0xff4CB379)),
              ),
            ),
            SizedBox(
              height: 0.03.sh,
            ),
          ],
        ),
      ),
    );
  }
}
