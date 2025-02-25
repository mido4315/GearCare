import 'package:flutter/material.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../my_profile_page/presentation/view/my_profile_page.dart';
import '../../../posts/presentation/views/posts_view.dart';

class MerchantBottomNavBarView extends StatefulWidget {
  const MerchantBottomNavBarView({Key? key}) : super(key: key);

  @override
  State<MerchantBottomNavBarView> createState() =>
      _MerchantBottomNavBarViewState();
}

class _MerchantBottomNavBarViewState extends State<MerchantBottomNavBarView> {
  final List<Widget> _widgets = [
    const PostsView(),
    const MyProfileView(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.kPrimaryColor,
        margin: EdgeInsets.fromLTRB(
            context.width * 0.11, 12, context.width * 0.11, 12),
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              Icons.post_add_outlined,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            activeIcon: Icon(
              Icons.post_add,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            title: Text(
              "Add Product",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
          // SalomonBottomBarItem(
          //   icon: Icon(
          //     Icons.shopping_cart_outlined,
          //     size: MediaQuery.of(context).size.width * 0.06,
          //   ),
          //   activeIcon: Icon(
          //     Icons.shopping_cart,
          //     size: MediaQuery.of(context).size.width * 0.06,
          //   ),
          //   title: Text(
          //     "Shop",
          //     style: TextStyle(
          //       fontSize: MediaQuery.of(context).size.width * 0.04,
          //     ),
          //   ),
          // ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            activeIcon: Icon(
              Icons.person,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   height: context.getHeight(givenHeight: 100),
      //   child: const TabBarTabs(),
      // ),
    );
  }
}