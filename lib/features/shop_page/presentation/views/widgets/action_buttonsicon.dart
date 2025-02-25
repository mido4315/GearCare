import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';

import '../../../../../core/helper/custom_snack_bar.dart';
import '../../../../favourite_page/presentation/view_model/remove_product_cubit/remove_product_cubit.dart';
import '../../view model/add_product_cubit/add_product_cubit.dart';
import '../../view model/add_product_cubit/add_product_state.dart';

class ActionButtonsIcon extends StatefulWidget {
  const ActionButtonsIcon({
    super.key,
    required this.id,
    required this.quantity,
  });

  final String id;
  final int quantity;

  @override
  State<ActionButtonsIcon> createState() => _ActionButtonsIconState();
}

class _ActionButtonsIconState extends State<ActionButtonsIcon> {
  Icon icon = const Icon(Icons.favorite_outline);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<AddProductCubit, AddProductState>(
          listener: (context, state) {
            if (state is AddProductSuccess) {
              customSnackBar(context, state.message);
            } else if (state is AddProductFailure) {
              customSnackBar(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is AddProductLoading) {
              const Center(child: CircularProgressIndicator());
            }
            return IconButton(
              style: IconButton.styleFrom(
                iconSize: 37
              ),
              onPressed: () {
                setState(() {
                  icon = icon.icon == Icons.favorite
                      ? const Icon(
                          Icons.favorite_outline,
                        )
                      : const Icon(
                          Icons.favorite,
                          color: AppColors.kPrimaryColor,
                        );
                });
                if(icon.icon == Icons.favorite){
                  BlocProvider.of<AddProductCubit>(context)
                      .addToCart(widget.id, widget.quantity);
                }else{
                  BlocProvider.of<RemoveProductCubit>(context).removeFromCart(widget.id, widget.quantity);
                }
              },
              icon: icon,
            );
          },
        )
      ],
    );
  }
}