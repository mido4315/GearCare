import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/api_service.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/favourite_page/data/cart_repo/cart_repo_impl.dart';
import 'package:gear_care/features/shop_page/presentation/view%20model/add_product_cubit/add_product_cubit.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/product_body.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/service_locator.dart';
import '../favourite_page/presentation/view_model/remove_product_cubit/remove_product_cubit.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
    required this.id,
    required this.name,
    required this.pictureURL,
    required this.price,
    required this.newPrice,
    required this.description,
    required this.instock,
    required this.deleted,
    required this.sellerId,
    required this.categoryid,
    required this.seller,
    required this.discount,
    required this.categorys,
    required this.photos,
    required this.productShoppingcart,
  }) : super(key: key);

  final String id;
  final String name;
  final List<String> pictureURL;
  final int price;
  final int newPrice;
  final String description;
  final bool instock;
  final bool deleted;
  final String sellerId;
  final String categoryid;
  final String seller;
  final int discount;
  final String categorys;
  final String photos;
  final String productShoppingcart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.getHeight(givenHeight: 80),
        elevation: 7,
        backgroundColor: AppColors.kPrimaryColor,
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: context.getHeight(givenHeight: 32),
            )),
        title: Text(
          name,
          style: Styles.textStyle26normal
              .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AddProductCubit(CartRepoImpl(getIt.get<APIService>())),
          ),
          BlocProvider(
            create: (context) =>
                RemoveProductCubit(CartRepoImpl(getIt.get<APIService>())),
          ),
        ],
        child: ProductBody(
          id: id,
          name: name,
          description: description,
          price: price,
          productShoppingcart: productShoppingcart,
          categoryid: categoryid,
          categorys: categorys,
          deleted: deleted,
          discount: discount,
          instock: instock,
          newPrice: newPrice,
          photos: photos,
          pictureURL: pictureURL,
          seller: seller,
          sellerId: sellerId,
        ),
      ),
    );
  }
}