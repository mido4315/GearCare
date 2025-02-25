import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';

class CustomShoppingButton extends StatelessWidget {
  const CustomShoppingButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getHeight(givenHeight: 46),
      width: context.getWidth(givenWidth: 144),
      child: TextButton(
          style: TextButton.styleFrom(backgroundColor: AppColors.kPrimaryColor),
          onPressed: () {},
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Styles.textStyle24.copyWith(color: Colors.white),
          )),
    );
  }
}
