import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:montra_app/constants/images.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
            child: Column(
              children: [
                PreferredSize(
                    preferredSize: const Size.fromHeight(60),
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.violet[100]!, width: 1.5),
                            ),
                            child: ClipOval(
                              child: Image.asset(AppImages.userPhoto,
                                  width: 40, height: 40, fit: BoxFit.cover),
                            ),
                          ),
                          const Text("October", style: TextStyle(fontSize: 20)),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(AppIcons.notificationLogo))
                        ],
                      ),
                    )),
                const SizedBox(height: 10),
                Text(
                  "Account Balance",
                  style: TextStyle(fontSize: 16, color: AppColors.light[20]),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$9400",
                  style: TextStyle(
                      fontSize: 32,
                      color: AppColors.dark[100],
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.green[100],
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.light[80],
                                borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(AppIcons.incomeLogo),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                "Income",
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.light[80]),
                              ),
                              Text(
                                "\$5000",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: AppColors.light[80],
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.red[100],
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.light[80],
                                borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(AppIcons.expenseLogo),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                "Expense",
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.light[80]),
                              ),
                              Text(
                                "\$1200",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: AppColors.light[80],
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                            color: AppColors.yellow[20],
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Today",
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.yellow[100],
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Week",
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.light[20],
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Month",
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.light[20],
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                            color: AppColors.yellow[20],
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Year",
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.yellow[100],
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Transactions",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.dark[100],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        decoration: BoxDecoration(
                            color: AppColors.violet[20],
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "See All",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.violet[100],
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    _TransactionCard(
                      AppColors.yellow[20]!,
                      "Shopping",
                      "buy some grocery",
                      "-\$200",
                      "10:00 AM",
                      AppIcons.shoppingLogo,
                    ),
                    const SizedBox(height: 20),
                    _TransactionCard(
                      AppColors.violet[20]!,
                      "Subscription",
                      "disney + anuanl",
                      "-\$80",
                      "02:46 PM",
                      AppIcons.billLogo,
                    ),
                    const SizedBox(height: 20),
                    _TransactionCard(
                      AppColors.red[20]!,
                      "Food",
                      "buy a pizza",
                      "-\$32",
                      "07:30 PM",
                      AppIcons.foodLogo,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _TransactionCard(Color color, String title, String subtitle,
      String amount, String datem, String icon) {
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
                    color: AppColors.red[80],
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
}
