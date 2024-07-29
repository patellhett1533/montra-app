import 'package:flutter/material.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra_app/constants/images.dart';

class SentEmail extends StatefulWidget {
  static const route = '/login';
  const SentEmail({super.key});

  @override
  _SentEmailState createState() => _SentEmailState();
}

class _SentEmailState extends State<SentEmail> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Image.asset(AppImages.emailSent,
                    width: double.infinity / 1.5, height: 200),
                const SizedBox(height: 20),
                Text(
                  "Your email is on the way",
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColors.dark[50],
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                Text(
                  "Check your email test@test.com and follow the instructions to reset your password",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.dark[50],
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    print('sent email');
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                        color: AppColors.violet[100],
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Back to login",
                      style:
                          TextStyle(fontSize: 18, color: AppColors.light[80]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
