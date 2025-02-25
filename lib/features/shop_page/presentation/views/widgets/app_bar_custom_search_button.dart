import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/features/shop_page/presentation/view%20model/shop_cubit/shop_cubit.dart';
import 'package:go_router/go_router.dart';

class AppBarCustomSearchButton extends StatelessWidget {
  const AppBarCustomSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .3),
      child: Container(
        padding: const EdgeInsets.only(left: 24),
        height: context.getHeight(givenHeight: 45),
        // decoration: BoxDecoration(
        //     border: Border.all(
        //         width: 2,
        //         color: Colors.white
        //
        //     ),
        //     boxShadow: const [
        //       BoxShadow(
        //         color: AppColors.kPrimaryColor,
        //         offset: Offset(1.0, 1.0),
        //         blurRadius: 1.0,
        //         spreadRadius: -1.0,
        //       ),
        //     ],
        //     borderRadius: BorderRadius.circular(24)),
        child: TextField(
          onSubmitted: (value){
            BlocProvider.of<ShopCubit>(context).getProducts(searchString: value);
          },

          style: const TextStyle(
              color: Colors.white, decoration: TextDecoration.none),
          decoration: InputDecoration(
            hintText: "Search Product..",
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
            contentPadding: const EdgeInsets.only(top: 10),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.white),
            ),
            prefixIcon: const Icon(
              color: Colors.white,
              Icons.search,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}