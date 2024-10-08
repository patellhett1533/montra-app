import 'package:flutter/material.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signup extends StatefulWidget {
  static const route = '/signup';
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

void _login() {
  print('Login');
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool _termsAndConditions = false;

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
                      "Sign Up",
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
                            hintText: "Name",
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
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
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
                      Row(
                        children: [
                          Checkbox(
                              activeColor: AppColors.violet[100],
                              side: const BorderSide(
                                color: Color(0xff7F3DFF),
                              ),
                              value: _termsAndConditions,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _termsAndConditions = value!;
                                });
                              }),
                          const Flexible(
                            child: Text(
                              'By signing up, you agree to the Terms of Service and Privacy Policy',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate() &&
                              _termsAndConditions) {
                            print("Signup SuccessFully");
                          } else {
                            print("Please accept terms and conditions");
                          }
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
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 18, color: AppColors.light[80]),
                          ),
                        ),
                      )
                    ])),
                const SizedBox(height: 20),
                const Text("Or With"),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    print("Google Sign Up SuccessFully");
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffEEE5FF)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.google),
                        const SizedBox(width: 10),
                        Text(
                          textAlign: TextAlign.center,
                          "Sign Up with Google",
                          style: TextStyle(
                              fontSize: 18, color: AppColors.dark[100]),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(onPressed: _login, child: Text("Login"))
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
