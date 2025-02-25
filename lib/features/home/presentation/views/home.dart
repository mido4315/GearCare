import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/features/favourite_page/data/cart_repo/cart_repo_impl.dart';
import 'package:gear_care/features/favourite_page/presentation/view_model/get_products_cubit/get_products_cubit.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../chats_page/presentation/views/chats_page.dart';
import '../../../favourite_page/presentation/views/favourite_page.dart';
import '../../../home_page/data/repos/home_repo_impl.dart';
import '../../../home_page/presentation/view model/home_view_cubit/home_view_cubit.dart';
import '../../../home_page/presentation/views/home_view.dart';
import '../../../shop_page/presentation/views/shoping_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _widgets = [
    BlocProvider(
      create: (context) => HomeViewCubit(
        HomeRepoImpl(
          getIt.get<APIService>(),
        ),
      ),
      child: const Homepage(),
    ),
    const ShoppingPage(),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetProductsCubit(CartRepoImpl(getIt.get<APIService>()))
                ..getCartProducts(),
        ),
      ],
      child: const FavouritePage(),
    ),
    // const ChatsPage(),
    // const Center(child: Text("orderHistory"),)
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.kPrimaryColor,
        margin:  EdgeInsets.fromLTRB(context.height * 0.06, 12, context.height * 0.06, 12),
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
              Icons.shopping_cart_outlined,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            activeIcon: Icon(
              Icons.shopping_cart,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            title: Text(
              "Shop",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            activeIcon: Icon(
              Icons.favorite,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            title: Text(
              "Favourites",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
          // SalomonBottomBarItem(
          //   icon: Icon(
          //     Icons.chat_outlined,
          //     size: MediaQuery.of(context).size.width * 0.06,
          //   ),
          //   activeIcon: Icon(
          //     Icons.chat,
          //     size: MediaQuery.of(context).size.width * 0.06,
          //   ),
          //   title: Text(
          //     "Chat",
          //     style: TextStyle(
          //       fontSize: MediaQuery.of(context).size.width * 0.04,
          //     ),
          //   ),
          // ),
          // SalomonBottomBarItem(
          //   icon: Icon(
          //     Icons.history_edu_outlined,
          //     size: MediaQuery.of(context).size.width * 0.06,
          //   ),
          //   activeIcon: Icon(
          //     Icons.history_edu,
          //     size: MediaQuery.of(context).size.width * 0.06,
          //   ),
          //   title: Text(
          //     "Orders",
          //     style: TextStyle(
          //       fontSize: MediaQuery.of(context).size.width * 0.04,
          //     ),
          //   ),
          // ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   height: context.getHeight(givenHeight: 100),
      //   child: const TabBarTabs(),
      // ),
    );
  }
}