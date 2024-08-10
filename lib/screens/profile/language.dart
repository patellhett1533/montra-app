import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/icons.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String language = "English";
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
              _languageBox('English'),
              _languageBox('Japanese (JP)'),
              _languageBox('France (FR)'),
              _languageBox('Hindi (HI)'),
              _languageBox('Gujarati (GU)'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _languageBox(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          language = title;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            title == language
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
