import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/styles.dart';

class IdentifyQuantityButton extends StatelessWidget {
  const IdentifyQuantityButton({
    super.key,
    required this.quantity,
  });

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor.withOpacity(.2),
        border: Border.all(
          color: AppColors.kPrimaryColor,
          width: 1.25,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [

              Text(
                'Quantity: ',
                style: Styles.textStyle18Alata,
              ),
              Text(
                quantity.toString(),
                style: Styles.textStyle18Alata,
              ),
            ],
          ),
          const Icon(Icons.arrow_downward),
        ],
      ),
    );
  }
}