import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/styles.dart';

class RequestServiceButton extends StatelessWidget {
  const RequestServiceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: AppColors.kPrimaryColor),
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.all(6),
          width: double.infinity,
          child: Center(
            child: Text(
              'Service Request',
              style: Styles.textStyle24Alegreya.copyWith(color: Colors.white),
            ),
          ),
        ));
  }
}
