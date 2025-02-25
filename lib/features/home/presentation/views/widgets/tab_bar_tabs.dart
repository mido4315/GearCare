import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';

class TabBarTabs extends StatefulWidget {
  const TabBarTabs({
    super.key,
  });

  @override
  State<TabBarTabs> createState() => _TabBarTabsState();
}

class _TabBarTabsState extends State<TabBarTabs> {
  final List<Map<String, dynamic>> tabData = const [
    {"text": 'Home', "icon": Icons.home_outlined},
    {"text": 'Shop', "icon": Icons.shop_outlined},
    {"text": 'Favourite', "icon": Icons.favorite_outline},
    {"text": 'Message', "icon": Icons.email_outlined},
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.kPrimaryColor.withOpacity(0),
      labelColor: AppColors.kPrimaryColor,
      unselectedLabelColor: AppColors.kSecondryColor,
      tabs: List.generate(
          4,
          (index) => TabBarTab(
                icon: tabData[index]['icon']!,
                index: index,
              )),
    );
  }
}

class TabBarTab extends StatelessWidget {
  const TabBarTab({
    super.key,
    required this.icon,
    required this.index,
  });
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 32,
    );
  }
}