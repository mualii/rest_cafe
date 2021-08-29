import 'package:flutter/material.dart';
import 'package:rest_cafe/shared/components/components.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomisedAppBar(
        title: 'الاشعارات',
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NotificationItem(),
              NotificationItem(),
              NotificationItem(),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.check,
                color: Colors.black,
              ),
              backgroundColor: Colors.grey.shade200,
            ),
            title: Text(
              'تم التوصيل',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: Wrap(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'تم توصيل الطلب من قبل جملة نايف ابن محمد',
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                    children: <TextSpan>[
                      TextSpan(
                        text: '#68464577',
                        style: TextStyle(
                          color: Color(0xff4CB379),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'July 20.2020 (08:00 pm)',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
            trailing: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: 4,
              decoration: BoxDecoration(color: Color(0xff4CB379)),
            ),
          ),
        ),
      ),
    );
  }
}
