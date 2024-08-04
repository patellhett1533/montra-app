import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:montra_app/constants/images.dart';

class TransactionDetail extends StatefulWidget {
  const TransactionDetail({super.key});

  @override
  State<TransactionDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  String? _selectedValue;
  String? _selectedWallet;
  bool _isRepeat = false;

  final List<String> _options = ["shopping", "food", "travel", "other"];
  final List<String> _wallets = ["Cash", "Bank", "Credit Card"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Transaction Detail",
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
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "\$100.00",
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          color: AppColors.light[100]),
                    ),
                    Text(
                      "Buy some grocery",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.light[100]),
                    ),
                    Text(
                      "Saturday 4 June 2021  16:20",
                      style:
                          TextStyle(fontSize: 16, color: AppColors.light[100]),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.light[100],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.7,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: AppColors.light[20]!,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Type",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.dark[25]),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Expense",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.dark[100]),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Category",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.dark[25]),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Shopping",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.dark[100]),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Wallet",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.dark[25]),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Wallet",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.dark[100]),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomPaint(
                            size: Size(MediaQuery.of(context).size.width, 1),
                            painter: DashedLinePainter(),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.dark[100]),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                      aspectRatio: 29 / 10,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.asset(
                                          AppImages.dummyAttachment,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
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
                                "Edit",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.light[80]),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.light[20]!
      ..strokeWidth = 1;

    double dashWidth = 10;
    double dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
