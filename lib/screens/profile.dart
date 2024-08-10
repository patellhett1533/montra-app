import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:montra_app/constants/images.dart';
import 'package:montra_app/screens/profile/export.dart';
import 'package:montra_app/screens/profile/setting.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void _showRepeatTransaction() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8),
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const Text("Are you sure do you wanna logout?",
                        style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: FittedBox(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 60),
                              decoration: BoxDecoration(
                                  color: AppColors.violet[20],
                                  borderRadius: BorderRadius.circular(16)),
                              child: Text(
                                textAlign: TextAlign.center,
                                "No",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.violet[100]),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {},
                          child: FittedBox(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 60),
                              decoration: BoxDecoration(
                                  color: AppColors.violet[100],
                                  borderRadius: BorderRadius.circular(16)),
                              child: Text(
                                textAlign: TextAlign.center,
                                "Yes",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.light[80]),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.violet[100]!, width: 1.5),
                            borderRadius: BorderRadius.circular(999)),
                        child: ClipOval(
                          child: Image.asset(AppImages.userPhoto,
                              width: 80, height: 80, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Username",
                            style: TextStyle(
                                fontSize: 16, color: AppColors.dark[25]),
                          ),
                          Text("Rudra Patel",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.dark[100],
                                  fontWeight: FontWeight.w700))
                        ],
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.editLogo))
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColors.light[100],
                  borderRadius: BorderRadius.circular(24)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Setting()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.violet[20],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: SvgPicture.asset(AppIcons.settingLogo),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Setting",
                            style: TextStyle(
                                fontSize: 20, color: AppColors.dark[100]),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.light[40],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExportData()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.violet[20],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: SvgPicture.asset(AppIcons.uploadLogo),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Export Data",
                            style: TextStyle(
                                fontSize: 20, color: AppColors.dark[100]),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.light[40],
                  ),
                  GestureDetector(
                    onTap: () {
                      _showRepeatTransaction();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.red[20],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: SvgPicture.asset(AppIcons.logoutLogo),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 20, color: AppColors.dark[100]),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
