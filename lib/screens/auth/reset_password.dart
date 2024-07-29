import 'package:flutter/material.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPassword extends StatefulWidget {
  static const route = '/login';
  const ResetPassword({super.key});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Reset Password",
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
                Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "New Password",
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
                              value.length < 8) {
                            return 'Please enter a password with at least 8 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Retype New Password",
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
                              value.length < 8) {
                            return 'Please enter a password with at least 8 characters';
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
