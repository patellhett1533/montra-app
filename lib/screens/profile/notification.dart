import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montra_app/constants/colors.dart';

class NotificatioSetting extends StatefulWidget {
  const NotificatioSetting({super.key});

  @override
  State<NotificatioSetting> createState() => _NotificatioSettingState();
}

class _NotificatioSettingState extends State<NotificatioSetting> {
  bool _expenseAlert = false;
  bool _budgetAlert = false;
  bool _tipsArticles = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expense Alert",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text("Get notification about your expense")
                    ],
                  ),
                  CupertinoSwitch(
                      value: _expenseAlert,
                      activeColor: AppColors.violet[100],
                      onChanged: (bool value) {
                        setState(() {
                          _expenseAlert = value;
                        });
                      }),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Budget Alert",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text("Get notification when you cross budget")
                    ],
                  ),
                  CupertinoSwitch(
                      value: _budgetAlert,
                      activeColor: AppColors.violet[100],
                      onChanged: (bool value) {
                        setState(() {
                          _budgetAlert = value;
                        });
                      }),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tips & Articles",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text("Useful tips and articles about finance")
                    ],
                  ),
                  CupertinoSwitch(
                      value: _tipsArticles,
                      activeColor: AppColors.violet[100],
                      onChanged: (bool value) {
                        setState(() {
                          _tipsArticles = value;
                        });
                      }),
                ],
              ),
            ],
          ),
        ));
  }
}
