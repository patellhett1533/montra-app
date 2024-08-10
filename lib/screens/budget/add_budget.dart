import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';

class AddBudget extends StatefulWidget {
  const AddBudget({super.key});

  @override
  State<AddBudget> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  String? _selectedValue;
  bool _isReceiveAlert = false;
  double _receiveAlertValue = 20.0;
  final List<String> _options = ["shopping", "food", "travel", "other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Budget",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        centerTitle: true,
        backgroundColor: AppColors.violet[100],
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.whiteLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: AppColors.violet[100],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 1.5,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "How much do you want to spend ?",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        AppColors.light[100]!.withOpacity(0.8)),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "00.00",
                                    hintStyle: TextStyle(
                                      color: AppColors.light[100],
                                      fontSize: 64,
                                      fontWeight: FontWeight.w900,
                                    )),
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: AppColors.light[100],
                                    fontSize: 64,
                                    height: 1,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          decoration: BoxDecoration(
                            color: AppColors.light[100],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32)),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              DropdownButtonFormField(
                                value: _selectedValue,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffF2F4F5)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffF2F4F5)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  hintText: "Category",
                                  hintStyle: TextStyle(
                                    color: AppColors.dark[25],
                                  ),
                                ),
                                items: _options.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedValue = value!;
                                  });
                                },
                                dropdownColor: AppColors.light[100],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Receive Alert",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                          "Receive alert when reaches some point.")
                                    ],
                                  ),
                                  CupertinoSwitch(
                                      value: _isReceiveAlert,
                                      activeColor: AppColors.violet[100],
                                      onChanged: (bool value) {
                                        setState(() {
                                          _isReceiveAlert = value;
                                        });
                                      }),
                                ],
                              ),
                              _isReceiveAlert == true
                                  ? Container()
                                  : Container(),
                              const SizedBox(height: 40),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: AppColors.violet[100],
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Add Budget",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.light[80]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
