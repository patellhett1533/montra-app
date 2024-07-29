import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  _VerifyAccountState createState() => _VerifyAccountState();
}

void _verify() {
  print("Verify");
}

class _VerifyAccountState extends State<VerifyAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.left_arrow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Verification",
          style: TextStyle(
              fontSize: 24,
              color: AppColors.dark[50],
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Text(
                  "We send verification code to your email brajaoma*****@gmail.com. You can check your inbox.",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.dark[50],
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  "Enter Your Verification Code",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.dark[50],
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                OtpTextField(
                  numberOfFields: 4,
                  borderColor: const Color(0xffEEE5FF),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    if (code.length == 4) {
                      print("code $code");
                    }
                  },
                  onSubmit: (String verificationCode) {
                    print("verificationCode $verificationCode");
                  }, // end onSubmit
                ),
                const SizedBox(height: 20),
                Text(
                  '04:29',
                  style: TextStyle(fontSize: 18, color: AppColors.violet[100]),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    print("Verify");
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
                      "Verify",
                      style:
                          TextStyle(fontSize: 18, color: AppColors.light[80]),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't receive the code? "),
                    TextButton(onPressed: _verify, child: Text("Resend"))
                  ],
                )
              ],
            )),
      ),
    ));
  }
}
