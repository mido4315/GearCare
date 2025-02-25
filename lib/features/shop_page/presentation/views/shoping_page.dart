import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/api_service.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/favourite_page/data/cart_repo/cart_repo_impl.dart';
import 'package:gear_care/features/shop_page/presentation/view%20model/add_product_cubit/add_product_cubit.dart';
import 'package:gear_care/features/shop_page/presentation/view%20model/shop_cubit/shop_cubit.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/app_bar_custom_search_button.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/best_seller_item.dart';

import '../../../../core/utils/service_locator.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({
    super.key,
  });

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const AppBarCustomSearchButton(),
        backgroundColor: AppColors.kPrimaryColor,
        toolbarHeight: context.getHeight(givenHeight: 80),
        elevation: 7,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Text(
              'Our Products',
              style: Styles.textStyle26,
            ),
            const Expanded(child: BestSellerItemListView())
          ],
        ),
      ),
    );
  }
}

class BestSellerItemListView extends StatelessWidget {
  const BestSellerItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        if (state is ShopSuccess) {
          if(state.products.isEmpty){
            return const Center(
              child: Text(
                "There is no products",
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
              ),
            );
          }
          return GridView.builder(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 266.h, // Set the height of each item
            ),
            scrollDirection: Axis.vertical,
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              List<String> productImages = [
                "https://cdn.productimages.abb.com/9PAA00000017978_720x540.jpg"
              ];
              if (state.products[index].pictureURL != null &&
                  state.products[index].pictureURL!.isNotEmpty) {
                productImages = state.products[index].pictureURL!;
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocProvider(
                  create: (context) =>
                      AddProductCubit(CartRepoImpl(getIt.get<APIService>())),
                  child: BestSellerItems(
                    id: state.products[index].id ?? "ID not found",
                    name: state.products[index].name ?? "Name not found",
                    pictureURL: productImages,
                    price: state.products[index].price ?? 0,
                    newPrice: state.products[index].newPrice ?? 0,
                    description: state.products[index].description ??
                        "Description not found",
                    instock: state.products[index].instock ?? false,
                    deleted: state.products[index].deleted ?? false,
                    sellerId:
                        state.products[index].sellerId ?? "Seller ID not found",
                    categoryid: state.products[index].categoryid ??
                        "Category ID not found",
                    seller: state.products[index].seller ?? "Seller not found",
                    discount: state.products[index].discount ?? 0,
                    categorys:
                        state.products[index].categorys ?? "Category not found",
                    photos: state.products[index].photos ?? "Photos not found",
                    productShoppingcart:
                        state.products[index].productShoppingcart ??
                            "Product shopping cart not found",
                  ),
                ),
              );
            },
          );
        } else if (state is ShopFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: Styles.textStyle24,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}