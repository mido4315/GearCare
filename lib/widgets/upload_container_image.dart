import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';

class UploadImageContainer extends StatelessWidget {
  const UploadImageContainer({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: context.getHeight(givenHeight: 60),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Styles.textStyle24.copyWith(color: AppColors.kPrimaryColor),
          ),
          Icon(Icons.upload,
              size: 30, color: AppColors.kPrimaryColor.withOpacity(.75))
        ],
      ),
    );
  }
}