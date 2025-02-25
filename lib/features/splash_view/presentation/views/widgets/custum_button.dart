import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:go_router/go_router.dart';



class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.route,
  });
  final String text, route;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            backgroundColor: AppColors.kPrimaryColor),
        onPressed: () {
          GoRouter.of(context).push(route);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: Styles.textStyle24.copyWith(color: Colors.white),
            ),
          ),
        ));
  }
}