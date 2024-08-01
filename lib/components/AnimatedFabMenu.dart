import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';

class AnimatedFabMenu extends StatefulWidget {
  const AnimatedFabMenu({super.key});

  @override
  _AnimatedFabMenuState createState() => _AnimatedFabMenuState();
}

class _AnimatedFabMenuState extends State<AnimatedFabMenu> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FloatingActionButton(
          shape: const CircleBorder(),
          splashColor: AppColors.violet[100],
          onPressed: () {},
          backgroundColor: AppColors.violet[100],
          child: SvgPicture.asset(AppIcons.addLogo),
        ),
      ],
    );
  }
}
