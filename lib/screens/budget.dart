import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:montra_app/screens/budget/add_budget.dart';
import 'package:montra_app/screens/budget/detail_budget.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.violet[100],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Expanded(
            child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIcons.prevLogo)),
                Text(
                  "May",
                  style: TextStyle(fontSize: 20, color: AppColors.light[100]!),
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIcons.nextLogo)),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.light[100],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBudgetCategory(
                        AppColors.red[100]!, "Food", 100, 300, context),
                    const SizedBox(height: 20),
                    _buildBudgetCategory(
                        AppColors.green[100]!, "Shopping", 1200, 1000, context),
                    const SizedBox(height: 20),
                    _buildBudgetCategory(
                        AppColors.red[100]!, "Food", 100, 300, context),
                    const SizedBox(height: 20),
                    _buildBudgetCategory(
                        AppColors.green[100]!, "Shopping", 1200, 1000, context),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddBudget()));
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
                          "Add Budget",
                          style: TextStyle(
                              fontSize: 18, color: AppColors.light[80]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ])),
      ),
    );
  }

  Widget _buildBudgetCategory(Color color, String category, int amount,
      int total, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BudgetDetail()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.light[40],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.light[20]!),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        category,
                        style:
                            TextStyle(fontSize: 18, color: AppColors.dark[100]),
                      ),
                    ],
                  ),
                ),
                amount > total
                    ? SvgPicture.asset(AppIcons.warningLogo)
                    : Container(),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Remaining \$${amount < total ? total - amount : 0}",
              style: TextStyle(fontSize: 24, color: AppColors.dark[100]),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: 10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.light[20],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width * (amount / total),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "\$$amount of \$$total",
              style: TextStyle(fontSize: 18, color: AppColors.dark[100]),
            ),
            const SizedBox(height: 10),
            amount > total
                ? Text("You have exceed the limit !",
                    style: TextStyle(fontSize: 16, color: AppColors.red[100]!))
                : Container(),
          ],
        ),
      ),
    );
  }
}
