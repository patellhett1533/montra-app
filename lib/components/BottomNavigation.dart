import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/components/ExampleFabMenu.dart';
// import 'package:montra_app/components/AnimatedFabMenu.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';
import 'package:montra_app/screens/home.dart';
import 'package:montra_app/screens/profile.dart';
import 'package:montra_app/screens/transaction_detail.dart';
import 'package:montra_app/screens/transactions.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

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
      floatingActionButton: const AnimatedFabMenu(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
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
                          _currentScreen = const TransactionDetail();
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
      ),
    ));
  }
}
