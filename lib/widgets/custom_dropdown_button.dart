import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/utils/styles.dart';

Container customDropDownButton({
  required List<String> itemList,
  required String? selectedItem,
  required ValueChanged<String?> onChanged,
  required String hintText,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
    ),
    child: DropdownButton<String>(
      value: selectedItem,
      hint: Text(
        hintText,
        style: Styles.textStyle24.copyWith(color: AppColors.kPrimaryColor),
      ),
      iconSize: 48,
      iconEnabledColor: AppColors.kPrimaryColor,
      isExpanded: true,
      underline: const SizedBox.shrink(),
      items: itemList.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: Styles.textStyle20.copyWith(color: AppColors.kPrimaryColor),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    ),
  );
}