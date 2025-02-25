import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../widgets/simple_app_bar.dart';
import '../../../../../widgets/single_product.dart';
import '../view model/posts cubit/posts_cubit.dart';
import 'widgets/single_product_bottom_bar.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Products'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kAddNewProduct);
        },
        backgroundColor: AppColors.kPrimaryColor,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is PostsSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.productsList.length,
              itemBuilder: (context, index) {
                final theProduct = state.productsList[index];
                String productImage =
                    "https://static.vecteezy.com/system/resources/previews/005/337/799/non_2x/icon-image-not-found-free-vector.jpg";
                if (theProduct.pictureURL != null) {
                  if (theProduct.pictureURL!.isNotEmpty) {
                    productImage = theProduct.pictureURL![0];
                  }
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 120,
                      width: 190,
                      child: SingleProduct(
                        image: productImage,
                      ),
                    ),
                    SingleProductBottomBar(theProduct: theProduct)
                  ],
                );
              },
            );
          } else if (state is PostsFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(fontSize: 50),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}