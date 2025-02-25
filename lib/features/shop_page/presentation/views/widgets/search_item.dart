import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  bool isClicked = false;
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: context.getHeight(givenHeight: 32),
        top: context.getHeight(givenHeight: 24),
        bottom: context.getHeight(givenHeight: 24),
        left: context.getHeight(givenHeight: 8),
      ),
      decoration: BoxDecoration(
        color: AppColors.bestSellerBackGroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                AssetData.bestSellerImageBng,
                height: 150,
                width: 123,
              ),
              Positioned(
                bottom: context.getHeight(givenHeight: 85),
                left: context.getWidth(givenWidth: 99),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isClicked = !isClicked;
                    });
                  },
                  icon: Icon(
                    isClicked ? Icons.favorite : Icons.favorite_outline,
                    color: Colors.red,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pennzoil Motor Oil - 5W-20',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14.copyWith(fontSize: context.getHeight(givenHeight: 14)),
              ),
              const SizedBox(height: 4),
              Text(
                'Added by: Ahmed Fathy',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle13.copyWith(color: AppColors.kSecondryColor,fontSize: context.getHeight(givenHeight: 13)),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    '500 EGP',
                    style: Styles.textStyle13,
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.kPrimaryColor),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity = quantity > 0 ? quantity - 1 : 0;
                            });
                          },
                          child: const Icon(
                            Icons.remove,
                            size: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text('$quantity'),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              CustomAddToCartButton(
                onTap: () {
                  // Handle add to cart functionality here
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomAddToCartButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomAddToCartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: context.getHeight(givenHeight: 36),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.kPrimaryColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              'Add to Cart',
              textAlign: TextAlign.center,
              style: Styles.textStyle16.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
