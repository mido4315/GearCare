import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/shop_page/presentation/view%20model/add_product_cubit/add_product_cubit.dart';
import 'package:gear_care/features/shop_page/presentation/view%20model/shop_cubit/shop_cubit.dart';

class CustomAddToCardButton extends StatelessWidget {
  final String id;
  final int quantity;

  const CustomAddToCardButton(
      {super.key, required this.id, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AddProductCubit>(context).addToCart(id, quantity);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: context.getHeight(givenHeight: 36),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.kPrimaryColor),
        child: const Row(
          children: [
            Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}