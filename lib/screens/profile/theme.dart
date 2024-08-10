import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/icons.dart';

class ThemeSelect extends StatefulWidget {
  const ThemeSelect({super.key});

  @override
  State<ThemeSelect> createState() => _ThemeSelectState();
}

class _ThemeSelectState extends State<ThemeSelect> {
  String theme = 'Light';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _themeBox('Light'),
              _themeBox('Dark'),
              _themeBox('System'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _themeBox(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          theme = title;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            title == theme
                ? SvgPicture.asset(
                    AppIcons.successLogo,
                    width: 30,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
