import 'package:flutter/material.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  static const route = '/login';
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

void _login() {
  print('Login');
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Login",
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.dark[50],
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 30,
                    )
                  ],
                ),
                const SizedBox(height: 80),
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
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: AppColors.light[20]),
                            suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(AppIcons.gray_eye)),
                            suffixIconConstraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
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
                      const SizedBox(height: 10),
                      TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Password?")),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          print("Login");
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
                            "Login",
                            style: TextStyle(
                                fontSize: 18, color: AppColors.light[80]),
                          ),
                        ),
                      )
                    ])),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(onPressed: _login, child: Text("Signup"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
