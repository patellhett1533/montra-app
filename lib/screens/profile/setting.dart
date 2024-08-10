import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:montra_app/screens/profile/currency.dart';
import 'package:montra_app/screens/profile/language.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            _settingMenuBox('Currency', 'INR', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Currency()));
            }),
            _settingMenuBox('Language', 'English', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Language()));
            }),
            _settingMenuBox('Theme', 'Light', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Language()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _settingMenuBox(String title, String subtitle, Function ontap) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            Row(
              children: [
                Text(subtitle,
                    style:
                        TextStyle(fontSize: 16, color: AppColors.light[20]!)),
                SvgPicture.asset(AppIcons.rightArrowActive)
              ],
            )
          ],
        ),
      ),
    );
  }
}
