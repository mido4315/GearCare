import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/features/identify_service/presentation/views/widgets/widgets/identify_service_form.dart';
import 'package:google_fonts/google_fonts.dart';

class IdentifyServiceBody extends StatelessWidget {
  const IdentifyServiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.kPrimaryGredientColor,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 39, right: 14, left: 14),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  AssetData.identifyServiceImage,
                  height: context.height * .2558685,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: context.height * 0.1,
                  child: Text(
                    'GearCare',
                    style: GoogleFonts.akshar(
                      fontSize: 64,
                    ).copyWith(
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * .023,
                ),
                const IdentifyServiceForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
