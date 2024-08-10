import 'package:flutter/material.dart';
import 'package:montra_app/constants/colors.dart';

class ExportData extends StatefulWidget {
  const ExportData({super.key});

  @override
  State<ExportData> createState() => _ExportDataState();
}

class _ExportDataState extends State<ExportData> {
  String? _selectedExportType;
  String? _selectedExportDate;
  String? _selectedExportFormat;
  final List<String> _exportType = <String>[
    "All",
    "Expense",
    "Income",
    "Transactions"
  ];
  final List<String> _exportDate = <String>[
    "All",
    "Today",
    "Yesterday",
    "Last Week",
    "Last Month",
    "Last 3 Month",
    "Last Quarter",
    "Last Year",
  ];
  final List<String> _exportFormat = <String>[
    "CSV",
    "JSON",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export Data'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "What data do you want to export?",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  value: _selectedExportType,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF2F4F5)),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF2F4F5)),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    hintText: "Select what to export",
                    hintStyle: TextStyle(
                      color: AppColors.dark[25],
                    ),
                  ),
                  items:
                      _exportType.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedExportType = value!;
                    });
                  },
                  dropdownColor: AppColors.light[100],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "What date range's data do you want to export?",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  value: _selectedExportDate,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF2F4F5)),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF2F4F5)),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    hintText: "Select date range",
                    hintStyle: TextStyle(
                      color: AppColors.dark[25],
                    ),
                  ),
                  items:
                      _exportDate.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedExportDate = value!;
                    });
                  },
                  dropdownColor: AppColors.light[100],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "What format do you want to export?",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  value: _selectedExportFormat,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF2F4F5)),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF2F4F5)),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    hintText: "Select format",
                    hintStyle: TextStyle(
                      color: AppColors.dark[25],
                    ),
                  ),
                  items: _exportFormat
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedExportFormat = value!;
                    });
                  },
                  dropdownColor: AppColors.light[100],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                    color: AppColors.violet[100],
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  textAlign: TextAlign.center,
                  "Export",
                  style: TextStyle(fontSize: 18, color: AppColors.light[80]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
