import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/features/splash_view/presentation/views/widgets/splash_form.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.kPrimaryGredientColor,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.only(top: 24, right: 14, left: 14),
            child: Column(
              children: [
                
                SvgPicture.asset(AssetData.splashImage,height: context.getHeight(givenHeight: 269),),
                SizedBox(height: context.getHeight(givenHeight: 45),),
                Text('Welcome To ',style: GoogleFonts.akshar(fontSize: 48,color: AppColors.kPrimaryColor),),
                Text('GearCare',style: GoogleFonts.akshar(fontWeight: FontWeight.bold,fontSize: 40,color: AppColors.kPrimaryColor),),
                SizedBox(height: context.getHeight(givenHeight: 51),),
                const SplashButtons()
              ],
            
            ),
          ),
        ),
      ),
    );
  }
}
