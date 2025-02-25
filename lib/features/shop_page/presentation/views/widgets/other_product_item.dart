import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/rating_stars.dart';

class OtherProductItem extends StatefulWidget {
  const OtherProductItem({super.key});

  @override
  State<OtherProductItem> createState() => _OtherProductItemState();
}

class _OtherProductItemState extends State<OtherProductItem> {
  bool isClicked = false;
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.65354,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: context.getHeight(givenHeight: 130.63),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor.withOpacity(.08),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AssetData.productImage2),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                'ChuLian New diamond leather',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14.copyWith(color: Colors.black.withOpacity(.65)),
              ),
            ),

            const SizedBox(height: 2),
            const RatingStarsOfProduct(size: 18,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.5),
              child: Text('16 reviews',style: Styles.textStyle13.copyWith(color: Colors.black,)),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.5),
              child: Text(
                '500 . EGP',
                style: Styles.textStyle14.copyWith(color: Colors.red),
              ),
            ),
            const SizedBox(width: 16),

          ],
        ),
      ),
    );
  }
}