import 'package:flutter/material.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassword extends StatefulWidget {
  static const route = '/login';
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

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
            "Forgot Password",
            style: TextStyle(
                fontSize: 24,
                color: AppColors.dark[50],
                fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Text(
                  "Don't worry.",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.dark[50],
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Enter your email and we'll send you a link to reset your password.",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.dark[50],
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 40),
                Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: AppColors.light[20]),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide:
                                    BorderSide(color: Color(0xffEEE5FF))),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide:
                                    BorderSide(color: Color(0xffEEE5FF)))),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@')) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          print('Forgot Password');
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
                            "Continue",
                            style: TextStyle(
                                fontSize: 18, color: AppColors.light[80]),
                          ),
                        ),
                      )
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
