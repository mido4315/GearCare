import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/features/home_page/presentation/views/widgets/home_body.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../../core/utils/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // drawer: Padding(
      //   padding: EdgeInsets.only(bottom: context.getHeight(givenHeight: 109)),
      //   child: Container(
      //     decoration: const BoxDecoration(borderRadius: BorderRadius.zero),
      //     width: context.getWidth(givenWidth: 329),
      //     height: context.getHeight(givenHeight: 743),
      //     child: const DrawerOfTheApp(),
      //   ),
      // ), // Add key to the scaffold
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        toolbarHeight: context.getHeight(givenHeight: 80),
        elevation: 7,
        // leading: IconButton(
        //   onPressed: () {
        //     scaffoldKey.currentState!.openDrawer();
        //   },
        //   icon: Icon(
        //     Icons.menu,
        //     size: context.getWidth(
        //       givenWidth: 40,
        //     ),
        //     color: Colors.white,
        //   ),
        // ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.width * 0.04),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kMyProfileView);
              },
              child: ClipOval(
                child: Image.network(
                  getIt.get<SharedPrefs>().photoId ?? "",
                  width: context.width * 0.16, // Set the desired width
                  height: context.width * 0.16, // Set the desired height
                  fit: BoxFit.cover, // Ensure the image covers the circle area
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported),
                ),
              ),
            ),
          ),
        ],
      ),
      body: const HomeBody(),
    );
  }
}