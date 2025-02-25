import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/favourite_page/presentation/views/widgets/fav_card.dart';

import '../../../../core/models/product_model.dart';
import '../view_model/get_products_cubit/get_products_cubit.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavCardListViewState();
}

class _FavCardListViewState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.favorite,
          color: Colors.white,
          size: context.getHeight(givenHeight: 32),
        ),
        title: Text(
          'Favorites',
          style: Styles.textStyle26normal
              .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        backgroundColor: AppColors.kPrimaryColor,
        toolbarHeight: context.getHeight(givenHeight: 80),
        elevation: 7,
      ),
      body: BlocBuilder<GetProductsCubit, GetProductsState>(
        builder: (context, state) {
          if (state is GetProductsLoaded) {
            print('state.products.length');
            print(state.products.length);
            if (state.products.isEmpty) {
              return const Center(
                child: Text(
                  "No Favorites",
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: FavCard(
                        product: state.products[index],
                      ),
                    );
                  }),
            );
          } else if (state is GetProductsFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(
                  fontSize: 28,
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}