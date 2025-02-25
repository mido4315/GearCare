import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';

import 'forget_password_form.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.kPrimaryGredientColor,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetData.forgetPasswordImage,
                height: context.getHeight(givenHeight: 93),
              ),
              SizedBox(
                height: context.getHeight(givenHeight: 32),
              ),
              Text(
                'Forgot your password?',
                style: Styles.textStyle20,
              ),
              Text(
                'enter Your email below to reset your password ',
                style: Styles.textStyle18,
              ),
              const SizedBox(height: 18,),
              const ForgetPasswordForm()
            ],
          ),
        ),
      ),
    );
  }
}