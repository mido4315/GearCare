import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/helper/custom_snack_bar.dart';
import 'package:gear_care/core/models/product_model.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/favourite_page/presentation/view_model/get_products_cubit/get_products_cubit.dart';
import 'package:gear_care/features/favourite_page/presentation/view_model/remove_product_cubit/remove_product_cubit.dart';
import 'package:gear_care/widgets/open_whats_app_button.dart';

import '../../view_model/remove_product_cubit/remove_product_state.dart';

class FavCard extends StatelessWidget {
  const FavCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  String image() {
    if (product.pictureURL != null) {
      if (product.pictureURL!.isNotEmpty) {
        return product.pictureURL![0];
      }
    }
    return "https://commercial.bunn.com/img/image-not-available.png";
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RemoveProductCubit, RemoveProductState>(
      listener: (context, state) {
        if (state is RemoveProductSuccess) {
          BlocProvider.of<GetProductsCubit>(context).getCartProducts();
        }
      },
      child: Card(
        elevation: 15,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.2),
                child: Image.network(
                  image(),
                  height: context.getHeight(givenHeight: 100),
                  width: context.getWidth(givenWidth: 116),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(product.name ?? 'no name available',
                        style: Styles.textStyle15),
                    Text(product.description ?? 'no description available ',
                        style: Styles.textStyle15),
                    Text(
                      '${product.price} . EGP ',
                      style: Styles.textStyle15
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: (product.instock ?? true)
                              ? Text(
                                  "In Stock",
                                  style: Styles.textStyle15
                                      .copyWith(color: Colors.green),
                                )
                              : Text(
                                  "out of stock",
                                  style: Styles.textStyle15
                                      .copyWith(color: Colors.red),
                                ),
                        ),
                        Row(
                          children: [
                            BlocListener<RemoveProductCubit,
                                RemoveProductState>(
                              listener: (context, state) {
                                if (state is RemoveProductFailure) {
                                  customSnackBar(context, state.errorMessage);
                                }
                              },
                              child: IconButton(
                                onPressed: () {
                                  print("this is the product id");
                                  print(product.id);
                                  BlocProvider.of<RemoveProductCubit>(context)
                                      .removeFromCart(product.id ?? "", 1);
                                },
                                icon: const Icon(Icons.delete,
                                    color: AppColors.kPrimaryColor),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.phone,
                                  color: AppColors.kPrimaryColor),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.message,
                                  color: AppColors.kPrimaryColor),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}