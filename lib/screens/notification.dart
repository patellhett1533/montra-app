import 'package:flutter/material.dart';
import 'package:montra_app/constants/colors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const routeName = '/notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            _notificationBox("Shopping budget has exceeds the",
                "Your Shopping budget has exceeds the lim....", "19:28", () {}),
            _notificationBox(
                "Utilities budget has exceeds the..",
                "Your Utilities budget has exceeds the limit....",
                "19:28",
                () {}),
          ],
        ),
      ),
    );
  }

  Widget _notificationBox(
      String title, String subtitle, String time, Function ontap) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: AppColors.light[20]!,
            width: 1,
          ),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
                Text(subtitle)
              ],
            ),
            Text(time)
          ],
        ),
      ),
    );
  }
}
