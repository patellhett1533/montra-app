import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  String? _selectedValue;
  String? _selectedWallet;
  bool _isRepeat = false;
  File? pickedFile;
  String? _selectedFrequency;
  DateTime? _selectedDate;

  final List<String> _options = ["shopping", "food", "travel", "other"];
  final List<String> _wallets = ["Cash", "Bank", "Credit Card"];
  final List<String> _frequency = [
    "Daily",
    "Weekly",
    "Monthly",
    "Quarterly",
    "Yearly"
  ];

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      setState(() {
        pickedFile = File(result.paths.first!);
      });
    } else {
      print("No file selected");
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      _selectedDate = picked;
    }
  }

  void _showCompletePopup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text("Expense added successfully"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/transactions'),
                child: const Text('History'),
              ),
            ],
          );
        });
  }

  void _showRepeatTransaction() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.8),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    DropdownButtonFormField(
                      value: _selectedFrequency,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.light[20]!),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.light[20]!),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                        ),
                        hintText: "Frequency",
                        hintStyle: TextStyle(
                          color: AppColors.dark[25],
                        ),
                      ),
                      items: _options
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedFrequency = value!;
                        });
                      },
                      dropdownColor: AppColors.light[100],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      //add attachment button same as input field
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.light[20]!,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              _selectedDate != null
                                  ? _selectedDate.toString().split(' ')[0]
                                  : 'Select Date',
                              style: TextStyle(
                                  color: AppColors.dark[25],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
                          "Next",
                          style: TextStyle(
                              fontSize: 18, color: AppColors.light[80]),
                        ),
                      ),
                    )
                  ]),
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Expense",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        centerTitle: true,
        backgroundColor: AppColors.red[100],
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.whiteLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: AppColors.red[100],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How much ?",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.light[100]!.withOpacity(0.8)),
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
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 1.5,
                  ),
                  child: SingleChildScrollView(
                    child: Container(
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
                            TextField(
                              decoration: InputDecoration(
                                  hintText: "Description",
                                  hintStyle:
                                      TextStyle(color: AppColors.light[20]),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      borderSide:
                                          BorderSide(color: Color(0xffF2F4F5))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F4F5)))),
                            ),
                            const SizedBox(height: 20),
                            DropdownButtonFormField(
                              value: _selectedWallet,
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
                                hintText: "Wallet",
                                hintStyle: TextStyle(
                                  color: AppColors.dark[25],
                                ),
                              ),
                              items: _wallets.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedWallet = value!;
                                });
                              },
                              dropdownColor: AppColors.light[100],
                            ),
                            const SizedBox(height: 20),
                            pickedFile == null
                                ? GestureDetector(
                                    onTap: () {
                                      _pickFile();
                                    },
                                    //add attachment button same as input field
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 12),
                                      decoration: BoxDecoration(
                                        color: AppColors.light[100],
                                        border: Border.all(
                                          color: AppColors.light[40]!,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              AppIcons.attachmentLogo),
                                          const SizedBox(width: 12),
                                          Text(
                                            "Add Attachment",
                                            style: TextStyle(
                                                color: AppColors.dark[25],
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    width: double.infinity,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Image.file(
                                          pickedFile!,
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          top: -10,
                                          left: 50,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.dark[100],
                                            ),
                                            padding: const EdgeInsets.all(2),
                                            child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    pickedFile = null;
                                                  });
                                                },
                                                icon: SvgPicture.asset(
                                                  AppIcons.crossLogo,
                                                  width: 15,
                                                  height: 15,
                                                )),
                                          ),
                                        ),
                                      ],
                                    )),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Repeat",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text("Automate Transaction")
                                  ],
                                ),
                                CupertinoSwitch(
                                    value: _isRepeat,
                                    activeColor: AppColors.violet[100],
                                    onChanged: (bool value) {
                                      setState(() {
                                        _isRepeat = value;
                                      });

                                      if (value == true) {
                                        _showRepeatTransaction();
                                      }
                                    }),
                              ],
                            ),
                            const SizedBox(height: 40),
                            GestureDetector(
                              onTap: () {
                                _showCompletePopup();
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
                                  "Countinue",
                                  style: TextStyle(
                                      fontSize: 18, color: AppColors.light[80]),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
