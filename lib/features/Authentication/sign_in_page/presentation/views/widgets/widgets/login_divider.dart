import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/styles.dart';

class LogInDivider extends StatelessWidget {
  const LogInDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
            child: Divider(
          thickness: 1.5,
          color: AppColors.kPrimaryColor,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'or',
            style: Styles.textStyle24.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
        const Expanded(
            child: Divider(
          thickness: 1.5,
          color: AppColors.kPrimaryColor,
        )),
      ],
    );
  }
}


