import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/shared_preferences.dart';

class EditProfileBackground extends StatelessWidget {
  const EditProfileBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: AppColors.kPrimaryColor.withOpacity(.85),
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: context.getHeight(givenHeight: 30),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              height: context.getHeight(
                givenHeight: 35,
              ),
              width: context.getWidth(givenWidth: 35),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: const Icon(
                Icons.edit,
              ),
            )
          ],
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
        const SizedBox(
          height: 12,
        ),
        Container(
          margin: const EdgeInsets.only(right: 12),
          child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: context.getHeight(givenHeight: 50),
                width: context.getWidth(givenWidth: 58),
              )),
        ),
      ],
    );
  }
}