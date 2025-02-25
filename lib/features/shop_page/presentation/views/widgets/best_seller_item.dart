import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/api_service.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/service_locator.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/favourite_page/presentation/view_model/remove_product_cubit/remove_product_cubit.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/custom_add_to_card_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/custom_snack_bar.dart';
import '../../../../../core/utils/shared_preferences.dart';
import '../../view model/add_product_cubit/add_product_cubit.dart';
import '../../view model/add_product_cubit/add_product_state.dart';

class BestSellerItems extends StatefulWidget {
  const BestSellerItems({
    super.key,
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
  });

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
  State<BestSellerItems> createState() => _BestSellerItemsState();
}

class _BestSellerItemsState extends State<BestSellerItems> {
  bool isClicked = false;

  void isFavorite() async {

    final String? token = getIt.get<SharedPrefs>().getData(key: 'token');
    var result = await getIt.get<APIService>().get(
      path: "ApplicationUser/CheckProductInShoppingCart/${widget.id}",
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print('result["message"]');
    print(result["message"]);
    if (result["message"] == "True") {
      setState(() {
        isClicked = true;
      });
    }
  }

  @override
  void initState() {
    isFavorite();
    super.initState();
  }

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.65354,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.kProductPage,
            extra: {
              'id': widget.id,
              'name': widget.name,
              'pictureURL': widget.pictureURL,
              'price': widget.price,
              'newPrice': widget.newPrice,
              'description': widget.description,
              'instock': widget.instock,
              'deleted': widget.deleted,
              'sellerId': widget.sellerId,
              'categoryid': widget.categoryid,
              'seller': widget.seller,
              'discount': widget.discount,
              'categorys': widget.categorys,
              'photos': widget.photos,
              'productShoppingcart': widget.productShoppingcart,
            },
          );
        },
        child: Container(
            height: context.getHeight(givenHeight: 284.63),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
                color: AppColors.bestSellerBackGroundColor,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: Image.network(
                        widget.pictureURL[0],
                        height: 126,
                        width: 123,
                      ),
                    ),
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
                        return Positioned(
                          bottom: 84.h,
                          left: 110.w,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isClicked = !isClicked;
                                });
                                if (isClicked) {
                                  BlocProvider.of<AddProductCubit>(context)
                                      .addToCart(widget.id, quantity);
                                } else {
                                  BlocProvider.of<RemoveProductCubit>(context)
                                      .removeFromCart(widget.id, quantity);
                                }
                              },
                              icon: isClicked == false
                                  ? const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.favorite_outline,
                                        color: AppColors.kPrimaryColor,
                                        size: 32,
                                      ),
                                    )
                                  : const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 32,
                                      ),
                                    )),
                        );
                      },
                    ),
                  ],
                ),
                Text(
                  widget.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle20,
                ),
                Text(
                  '${widget.price} .EGP',
                  style: Styles.textStyle18,
                ),

                const SizedBox(
                  height: 6,
                ),
                Text(
                  'sold by : ${widget.seller}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle18,
                ),
                // const Row(
                //   children: [
                //
                //     // const SizedBox(
                //     //   width: 16,
                //     // ),
                //
                //     // Container(
                //     //   height: 20,
                //     //   decoration: BoxDecoration(
                //     //       borderRadius: BorderRadius.circular(8),
                //     //       border: Border.all(color: AppColors.kPrimaryColor)),
                //     //   child: Row(
                //     //     children: [
                //     //       GestureDetector(
                //     //           onTap: () {
                //     //             setState(() {
                //     //               quantity = quantity > 1 ? quantity - 1 : 0;
                //     //             });
                //     //           },
                //     //           child: const Icon(
                //     //             Icons.remove,
                //     //             size: 14,
                //     //           )),
                //     //       const SizedBox(
                //     //         width: 8,
                //     //       ),
                //     //       Text('$quantity'),
                //     //       const SizedBox(
                //     //         width: 8,
                //     //       ),
                //     //       GestureDetector(
                //     //           onTap: () {
                //     //             setState(() {
                //     //               quantity = quantity + 1;
                //     //             });
                //     //           },
                //     //           child: const Icon(
                //     //             Icons.add,
                //     //             size: 14,
                //     //           )),
                //     //     ],
                //     //   ),
                //     // ),
                //   ],
                // ),
                // const Expanded(
                //   child: SizedBox(
                //     height: 6,
                //   ),
                // ),
              ],
            )),
      ),
    );
  }
}