import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/home/presentation/views/widgets/rating_stars.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight(givenHeight: 165),
      color: AppColors.kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetData.accountImage2,
            width: context.getWidth(givenWidth: 80),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Rating',
                style: Styles.textStyle24.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '5.0 ( 140 reviews )',
                style: Styles.textStyle24.copyWith(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              const RatingStars()
            ],
          )
        ],
      ),
    );
  }
}

