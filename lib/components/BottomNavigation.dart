import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:montra_app/screens/budget.dart';
import 'package:montra_app/screens/home.dart';
import 'package:montra_app/screens/profile.dart';
import 'package:montra_app/screens/transactions.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  bool _showMenu = false;

  final PageStorageBucket _bucket = PageStorageBucket();
  Widget _currentScreen = const Home();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: PageStorage(
        bucket: _bucket,
        child: _currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        splashColor: AppColors.violet[100],
        onPressed: () {
          setState(() {
            _showMenu = !_showMenu;
          });
        },
        backgroundColor: AppColors.violet[100],
        child: SvgPicture.asset(AppIcons.addLogo),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Stack(
          children: [
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 0;
                              _currentScreen = const Home();
                            });
                          },
                          child: SvgPicture.asset(_selectedIndex == 0
                              ? AppIcons.homeLogoActive
                              : AppIcons.homeLogo)),
                      MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 1;
                              _currentScreen = const Transactions();
                            });
                          },
                          child: SvgPicture.asset(_selectedIndex == 1
                              ? AppIcons.transactionLogoActive
                              : AppIcons.transactionLogo)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 2;
                              _currentScreen = const Budget();
                            });
                          },
                          child: SvgPicture.asset(_selectedIndex == 2
                              ? AppIcons.budgetLogoActive
                              : AppIcons.budgetLogo)),
                      MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 3;
                              _currentScreen = const Profile();
                            });
                          },
                          child: SvgPicture.asset(_selectedIndex == 3
                              ? AppIcons.profileLogoActive
                              : AppIcons.profileLogo)),
                    ],
                  ),
                ],
              ),
            ),
            _showMenu != false
                ? AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    bottom: 0,
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 2,
                      width: MediaQuery.of(context).size.width,
                      color:
                          AppColors.dark[50]!.withOpacity(_showMenu ? 0.5 : 0),
                      child: const Text("open menu"),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    ));
  }
}
