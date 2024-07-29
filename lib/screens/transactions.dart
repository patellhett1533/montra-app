import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.light[20],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Filter Transactions",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.dark[100])),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.violet[20],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text("Reset",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.violet[100])),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text("Filter By",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.dark[100])),
                        Flexible(
                            child: Row(
                          children: [],
                        ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Month", style: TextStyle(fontSize: 20)),
                        IconButton(
                            onPressed: () {
                              _showFilterBottomSheet();
                            },
                            icon: SvgPicture.asset(AppIcons.sortLogo))
                      ],
                    ),
                  )),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  print("report");
                },
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  decoration: BoxDecoration(
                      color: AppColors.violet[20],
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "See your financial report",
                        style: TextStyle(
                            fontSize: 16, color: AppColors.violet[100]),
                      ),
                      SvgPicture.asset(AppIcons.rightArrowActive, width: 25)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Today",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark[100],
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: <Widget>[
                  _TransactionCard(
                    AppColors.yellow[20]!,
                    "Shopping",
                    "buy some grocery",
                    "-\$200",
                    "10:00 AM",
                    AppIcons.shoppingLogo,
                    AppColors.red[80]!,
                  ),
                  const SizedBox(height: 20),
                  _TransactionCard(
                    AppColors.violet[20]!,
                    "Subscription",
                    "disney + anuanl",
                    "-\$80",
                    "02:46 PM",
                    AppIcons.billLogo,
                    AppColors.red[80]!,
                  ),
                  const SizedBox(height: 20),
                  _TransactionCard(
                    AppColors.red[20]!,
                    "Food",
                    "buy a pizza",
                    "-\$32",
                    "07:30 PM",
                    AppIcons.foodLogo,
                    AppColors.red[80]!,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Yesterday",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark[100],
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: <Widget>[
                  _TransactionCard(
                    AppColors.green[20]!,
                    "Salary",
                    "salary for july",
                    "+\$2500",
                    "04:27 AM",
                    AppIcons.salaryLogo,
                    AppColors.green[80]!,
                  ),
                  const SizedBox(height: 20),
                  _TransactionCard(
                    AppColors.blue[20]!,
                    "Transportation",
                    "service and washing",
                    "-\$18",
                    "02:46 PM",
                    AppIcons.transportationLogo,
                    AppColors.red[80]!,
                  ),
                  const SizedBox(height: 20),
                  _TransactionCard(
                    AppColors.red[20]!,
                    "Food",
                    "buy a pizza",
                    "-\$32",
                    "07:30 PM",
                    AppIcons.foodLogo,
                    AppColors.red[80]!,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget _TransactionCard(Color color, String title, String subtitle,
      String amount, String datem, String icon, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.light[80],
        borderRadius: BorderRadius.circular(24),
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(icon),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.dark[75],
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    subtitle,
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.dark[50],
                    ),
                  )
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                    fontSize: 18,
                    color: textColor,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                datem,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.light[20],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _Button(String text, Color? color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text,
          style: TextStyle(fontSize: 16, color: AppColors.violet[100])),
    );
  }
}
