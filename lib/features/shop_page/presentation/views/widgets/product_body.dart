import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/helper/custom_snack_bar.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/shop_page/presentation/view%20model/add_product_cubit/add_product_cubit.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/action_buttonsicon.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/identify_quantity_button.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/other_products_list_view.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/product_button_container.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/product_page_view.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/rating_stars.dart';
import 'package:gear_care/widgets/custom_rating_bar.dart';

import '../../../../../widgets/custom_dropdown_button.dart';
import '../../view model/add_product_cubit/add_product_state.dart';

class ProductBody extends StatefulWidget {
  const ProductBody(
      {Key? key,
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
      required this.productShoppingcart})
      : super(key: key);

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
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  int quantity = 1;

  double myRate = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        children: [
          Container(
            height: context.height*0.87,
            decoration:
                BoxDecoration(color: AppColors.kPrimaryColor.withOpacity(.07)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SizedBox(
                    height: context.getHeight(givenHeight: 300),
                    child: ProductPageView(
                      pictureURL: widget.pictureURL,
                    ),
                  ),
                  SizedBox(
                    height: context.getHeight(givenHeight: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: Styles.textStyle24Alegreya,
                      ),
                      Text(
                        'In Stock',
                        style: Styles.textStyle20.copyWith(color: AppColors.green),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.price} EGP',
                        style: Styles.textStyle24.copyWith(
                          color: Colors.black.withOpacity(.7),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        '${widget.discount == 0 ? '15' : widget.discount}%',
                        style: Styles.textStyle24.copyWith(
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.description,
                    style: Styles.textStyle16Alegreya,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomRatingBar(
                        rating: 3,
                      ),
                      ActionButtonsIcon(id: widget.id, quantity: 1,),
                    ],
                  ),

                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     border: Border.all(color: AppColors.kPrimaryColor),
                  //     color: Colors.white,
                  //   ),
                  //   child: DropdownButton<int>(
                  //     hint: Text(
                  //       "Quantity: $quantity",
                  //       style: Styles.textStyle24
                  //           .copyWith(color: AppColors.kPrimaryColor),
                  //     ),
                  //     padding: const EdgeInsets.symmetric(horizontal: 8),
                  //     iconSize: 48,
                  //     iconEnabledColor: AppColors.kPrimaryColor,
                  //     isExpanded: true,
                  //     underline: const SizedBox.shrink(),
                  //     items: List.generate(10, (index) => index + 1)
                  //         .map((int item) {
                  //       return DropdownMenuItem<int>(
                  //         value: item,
                  //         child: Text(
                  //           item.toString(),
                  //           style: Styles.textStyle20
                  //               .copyWith(color: AppColors.kPrimaryColor),
                  //         ),
                  //       );
                  //     }).toList(),
                  //     onChanged: (value) {
                  //       setState(() {
                  //         quantity = value ?? 1;
                  //       });
                  //     },
                  //   ),
                  // ),
                   SizedBox(
                    height: 16.h,
                  ),
                  // BlocConsumer<AddProductCubit, AddProductState>(
                  //   listener: (context, state) {
                  //     if (state is AddProductSuccess) {
                  //       customSnackBar(context, state.message);
                  //     } else if (state is AddProductFailure) {
                  //       customSnackBar(context, state.errorMessage);
                  //     }
                  //   },
                  //   builder: (context, state) {
                  //     if (state is AddProductLoading) {
                  //       const Center(child: CircularProgressIndicator());
                  //     }
                  //     return ProductButtonContainer(
                  //       text: 'Add to Cart',
                  //       id: widget.id,
                  //       quantity: quantity,
                  //     );
                  //   },
                  // ),

                  //const ProductButtonContainer(text: 'Buy now'),

                  Text("How did you like this product? Please rate it!",style: Styles.textStyle24Bold,),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RatingBar.builder(
                            initialRating: myRate,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemSize: 40.sp,
                            onRatingUpdate: (rating) {
                              setState(() {
                                myRate =rating;

                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              myRate.toString(),
                              style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(.65)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                  //   child: Text(
                  //     'you might also like',
                  //     style: Styles.textStyle20.copyWith(color: Colors.black),
                  //   ),
                  // ),
                  // const OtherProductsListView(),
                  // Center(
                  //   child: Container(
                  //     padding: const EdgeInsets.all(8),
                  //     height: MediaQuery.of(context).size.height * .9,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       border: Border.all(color: Colors.black),
                  //     ),
                  //     child: Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text('Quantity',
                  //                 style: Styles.textStyle18
                  //                     .copyWith(color: Colors.black.withOpacity(.8))),
                  //           ],
                  //         ),
                  //         Expanded(
                  //           child: ListView.builder(
                  //             itemCount: 10,
                  //             itemBuilder: (context, index) {
                  //               return GestureDetector(
                  //                 onTap: () {
                  //                   setState(() {});
                  //                 },
                  //                 child: Container(
                  //                     padding: const EdgeInsets.all(8),
                  //                     child: Column(
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text(
                  //                           (index + 1).toString(),
                  //                           style: Styles.textStyle18.copyWith(
                  //                               color: Colors.black.withOpacity(.8)),
                  //                         ),
                  //                         const Divider()
                  //                       ],
                  //                     )),
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          //identify quantity
        ],
      ),
    );
  }
}