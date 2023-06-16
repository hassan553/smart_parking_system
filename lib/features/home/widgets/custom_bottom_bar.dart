import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import '../../../core/resources/app_colors.dart';

class BottomBarWidget extends StatelessWidget {
  final Function function;
  final int index;
  const BottomBarWidget(
      {super.key, required this.function, required this.index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        function(index);
      },
      backgroundColor: const Color(0xffA4A4A4),
      currentIndex: index,
      
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: buildBadgeWidget(),
          label: 'notifications',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'settings',
        ),
      ],
    );
  }
}

buildBadgeWidget() {
  return badges.Badge(
    position: badges.BadgePosition.topEnd(top: -10, end: -12),
    showBadge: true,
    ignorePointer: false,
    onTap: () {},
    badgeContent: const Text(
      '12',
      style: TextStyle(fontSize: 12, color: AppColors.white),
    ),
    badgeAnimation: const badges.BadgeAnimation.rotation(
      animationDuration: Duration(seconds: 1),
      colorChangeAnimationDuration: Duration(seconds: 1),
      loopAnimation: false,
      curve: Curves.fastOutSlowIn,
      colorChangeAnimationCurve: Curves.easeInCubic,
    ),
    child: const Icon(Icons.notifications),
  );
}
