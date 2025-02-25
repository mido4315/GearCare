import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/styles.dart';

import '../../view model/add_product_cubit/add_product_cubit.dart';
import '../../view model/shop_cubit/shop_cubit.dart';

class ProductButtonContainer extends StatelessWidget {
  const ProductButtonContainer({
    super.key,
    required this.text,
    required this.id,
    required this.quantity,
  });

  final String text;
  final String id;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<AddProductCubit>(context).addToCart(id, quantity);
      },
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.kPrimaryColor),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: Styles.textStyle24.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}