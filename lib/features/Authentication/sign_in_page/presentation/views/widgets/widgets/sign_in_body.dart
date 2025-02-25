import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sign_in_form.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.kPrimaryGredientColor,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 33, right: 14, left: 14),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  AssetData.loginImage,
                  height: context.getHeight(givenHeight: 218),
                  width: context.getWidth(givenWidth: 393),
                ),
                SizedBox(height: context.getHeight(givenHeight: 16),),
                Text(
                  'GearCare',
                  style: GoogleFonts.akshar(
                    fontSize: 64,
                  ).copyWith(color: AppColors.kPrimaryColor),
                ),
                SizedBox(height: context.getHeight(givenHeight: 18),),
                const SignInForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}