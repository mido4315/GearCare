
import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/utils/styles.dart';


AppBar simpleAppBar({required String title}) {
  return AppBar(
    backgroundColor: AppColors.kPrimaryColor,
    title: Text(
      title,
      style: Styles.textStyle26normal
          .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
    ),
    centerTitle: true,
  );
}