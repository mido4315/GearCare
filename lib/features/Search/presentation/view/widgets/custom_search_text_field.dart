import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12),
        enabledBorder: buildOUtlineInputBorder(),
        focusedBorder: buildOUtlineInputBorder(),
        hintText: 'Search Products...',
        hintStyle: Styles.textStyle20.copyWith(color: AppColors.kPrimaryColor.withOpacity(.5)),
        prefixIcon: Opacity(
          opacity: .8,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search,color: AppColors.kPrimaryColor.withOpacity(.5),size: 32,),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOUtlineInputBorder() {
    return OutlineInputBorder(
      
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(
          color: AppColors.kPrimaryColor.withOpacity(.4),
          width: 2
        ));
  }
}