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

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool _termsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(AppIcons.left_arrow)),
                  Text(
                    textAlign: TextAlign.center,
                    "Signup",
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
              const SizedBox(height: 150),
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Name',
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Color(0xffEEE5FF))),
                          focusedBorder: OutlineInputBorder(
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
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
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
                            value: _termsAndConditions,
                            onChanged: (value) {
                              setState(() {
                                _termsAndConditions = value!;
                              });
                            }),
                        const Text('you agree to the Terms of Service'),
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
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: AppColors.violet[100],
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Signup",
                          style: TextStyle(
                              fontSize: 20, color: AppColors.light[80]),
                        ),
                      ),
                    )
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
