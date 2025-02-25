import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/helper/show_alert_dialog.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/shared_preferences.dart';

class MyProfileInfo extends StatefulWidget {
  const MyProfileInfo({
    super.key,
  });

  @override
  State<MyProfileInfo> createState() => _MyProfileInfoState();
}

class _MyProfileInfoState extends State<MyProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 36,
        ),
        Text(
          getIt.get<SharedPrefs>().name,
          style: Styles.textStyle24.copyWith(
              color: AppColors.kPrimaryColor.withOpacity(.85),
              fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 5),
        Text("A ${getIt.get<SharedPrefs>().location}",
            style: Styles.textStyle20.copyWith(
                fontWeight: FontWeight.w100,
                color: AppColors.kPrimaryColor.withOpacity(.7))),
        SizedBox(
          height: context.getHeight(givenHeight: 70),
        ),
        GestureDetector(
          onTap: () {
            var userType = getIt.get<SharedPrefs>().userType;
            if (userType == 'Client') {
              GoRouter.of(context).push(AppRouter.kEditProfileView);
            } else if (userType == 'WinchDriver') {
              GoRouter.of(context).push(AppRouter.kWinchEditProfileView);
            } else if (userType == 'Seller') {
            } else if (userType == 'Mechanic') {
            } else {}
          },
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            height: context.getHeight(givenHeight: 47),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color(0xff071B20).withOpacity(.1),
                const Color(0xff022931).withOpacity(.1),
                const Color(0xff25A4C1).withOpacity(.1),
                const Color(0xff1199B8).withOpacity(.1),
              ]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.edit,
                  color: Color(0xff545454),
                  size: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Edit Profile',
                  style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor.withOpacity(.8)),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: context.height * 0.2,
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    backgroundColor: AppColors.kPrimaryColor),
                onPressed: () {
                  showAlertDialog(
                    context: context,
                    onOk: () {
                      getIt.get<SharedPrefs>().clearData();
                      context.pushReplacement('/');
                    },
                    txtHead: 'Do you want to log out',
                    txtMsg: '',
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: context.width *0.3,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Log Out',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}