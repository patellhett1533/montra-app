import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';

class BudgetDetail extends StatelessWidget {
  const BudgetDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Detail'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    FittedBox(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.yellow[20],
                                  borderRadius: BorderRadius.circular(16)),
                              padding: const EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                AppIcons.shoppingLogo,
                                width: 25,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text("Shopping",
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Remaining",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "0.00",
                      style:
                          TextStyle(fontSize: 64, fontWeight: FontWeight.w700),
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
                          width:
                              MediaQuery.of(context).size.width * (800 / 800),
                          decoration: BoxDecoration(
                            color: AppColors.yellow[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text("You have exceed the limit !",
                        style:
                            TextStyle(fontSize: 16, color: AppColors.red[100]!))
                  ],
                ),
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
                    "Edit",
                    style: TextStyle(fontSize: 18, color: AppColors.light[80]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
