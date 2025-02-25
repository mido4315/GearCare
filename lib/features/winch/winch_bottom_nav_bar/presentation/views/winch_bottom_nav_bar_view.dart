import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/features/service_providers/history/presentation/view%20model/MyOrdersHistoryCubit/MyOrdersHistoryCubit.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../my_profile_page/presentation/view/my_profile_page.dart';
import '../../../winch_history/data/repos/winch_history_repo_impl.dart';
import '../../../winch_history/presentation/view model/WinchOrdersHistoryCubit/WinchOrdersHistoryCubit.dart';
import '../../../winch_history/presentation/views/winch_history_view.dart';
import '../../../winch_home/data/repos/winch_home_repo_impl.dart';
import '../../../winch_home/presentation/view model/WinchGetAllRepairOrdersCubit/WinchGetAllRepairOrdersCubit.dart';
import '../../../winch_home/presentation/views/winch_home_view.dart';


class WinchBottomNavBarView extends StatefulWidget {
  const WinchBottomNavBarView({Key? key}) : super(key: key);

  @override
  State<WinchBottomNavBarView> createState() =>
      _WinchBottomNavBarViewState();
}

class _WinchBottomNavBarViewState
    extends State<WinchBottomNavBarView> {
  final List<Widget> _widgets = [
    BlocProvider(
      create: (context) => WinchOrdersHistoryCubit(
        WinchHistoryRepoImpl(getIt.get<APIService>()),
      )..getMyOrdersHistory("status"),
      child: const WinchHistoryView(),
    ),
    BlocProvider(
      create: (context) => WinchGetAllRepairOrdersCubit(
        WinchHomeRepoImpl(getIt.get<APIService>()),
      )..getAllRepairOrders(),
      child: const WinchHomeView(),
    ),
    const MyProfileView(),
  ];

  int _currentIndex = 1;

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
              Icons.history_edu_outlined,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            activeIcon: Icon(
              Icons.history_edu,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            title: Text(
              "History",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            activeIcon: Icon(
              Icons.home,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
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