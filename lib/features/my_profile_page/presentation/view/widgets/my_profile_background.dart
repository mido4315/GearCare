import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/shared_preferences.dart';
import 'package:gear_care/widgets/simple_app_bar.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/styles.dart';

class ProfileBackground extends StatelessWidget {
  const ProfileBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: AppColors.kPrimaryColor.withOpacity(.85),
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            "Your Profile",
            style: Styles.textStyle26normal
                .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: context.getHeight(givenHeight: 120),
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor.withOpacity(.85),
              ),
            ),
            Positioned(
              top: context.getHeight(givenHeight: 30),
              right: context.getWidth(givenWidth: 200),
              child: Container(
                height: context.getHeight(givenHeight: 180),
                width: context.getWidth(givenWidth: 180),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 5),
                  image: DecorationImage(
                    image: NetworkImage(
                      getIt.get<SharedPrefs>().photoId,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.height * 0.07,
        ),
      ],
    );
  }
}