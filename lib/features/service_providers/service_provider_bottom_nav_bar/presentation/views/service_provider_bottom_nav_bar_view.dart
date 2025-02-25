import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/features/service_providers/current_order/data/repos/current_order_repo_impl.dart';
import 'package:gear_care/features/service_providers/current_order/presentation/view%20model/CurrentOrderCubit.dart';
import 'package:gear_care/features/service_providers/history/presentation/view%20model/MyOrdersHistoryCubit/MyOrdersHistoryCubit.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../my_profile_page/presentation/view/my_profile_page.dart';
import '../../../current_order/presentation/views/current_order_view.dart';
import '../../../history/data/repos/history_repo_impl.dart';
import '../../../history/presentation/views/history_view.dart';
import '../../../service_providers_home/data/repos/service_providers_home_repo_impl.dart';
import '../../../service_providers_home/presentation/view model/GetAllRepairOrdersCubit/GetAllRepairOrdersCubit.dart';
import '../../../service_providers_home/presentation/views/service_providers_home_view.dart';

class ServiceProvidersBottomNavBarView extends StatefulWidget {
  const ServiceProvidersBottomNavBarView({Key? key}) : super(key: key);

  @override
  State<ServiceProvidersBottomNavBarView> createState() =>
      _ServiceProvidersBottomNavBarViewState();
}

class _ServiceProvidersBottomNavBarViewState
    extends State<ServiceProvidersBottomNavBarView> {
  final List<Widget> _widgets = [
    BlocProvider(
      create: (context) => GetAllRepairOrdersCubit(
        ServiceProvidersHomeRepoImpl(getIt.get<APIService>()),
      )..getAllRepairOrders(),
      child: const ServiceProvidersHomeView(),
    ),
    BlocProvider(
      create: (context) => CurrentOrderCubit(
        CurrentOrderRepoImpl(getIt.get<APIService>()),
      )..getCurrentOrder("status"),
      child: const CurrentOrderView(),
    ),
    const MyProfileView(),
    BlocProvider(
      create: (context) => MyOrdersHistoryCubit(
        HistoryRepoImpl(getIt.get<APIService>()),
      )..getMyOrdersHistory("status"),
      child: const HistoryView(),
    ),
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
            context.width * 0.05, 12, context.width * 0.05, 12),
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
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
              Icons.incomplete_circle_outlined,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            activeIcon: Icon(
              Icons.incomplete_circle,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            title: Text(
              "Current order",
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
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   height: context.getHeight(givenHeight: 100),
      //   child: const TabBarTabs(),
      // ),
    );
  }
}