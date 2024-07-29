import 'package:flutter/material.dart';
import 'package:montra_app/components/BottomNavigation.dart';
import 'package:montra_app/screens/auth/forgot_password.dart';
import 'package:montra_app/screens/auth/login.dart';
import 'package:montra_app/screens/auth/reset_password.dart';
import 'package:montra_app/screens/auth/sent_email.dart';
import 'package:montra_app/screens/auth/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montra_app/screens/auth/verify_account.dart';
import 'package:montra_app/screens/expense/add_expense.dart';
import 'package:montra_app/screens/home.dart';
import 'package:montra_app/screens/income/add_income.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.workSansTextTheme()),
      home: const BottomNavigation(),
    );
  }
}
