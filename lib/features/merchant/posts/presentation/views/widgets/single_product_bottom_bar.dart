import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gear_care/core/helper/custom_snack_bar.dart';

import '../../../../../../core/helper/show_alert_dialog.dart';
import '../../../../../../core/models/product_model.dart';
import '../../view model/posts cubit/posts_cubit.dart';

class SingleProductBottomBar extends StatelessWidget {
  const SingleProductBottomBar({
    super.key,
    required this.theProduct,
  });

  final ProductModel theProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120.w,
            child: Text(
              theProduct.name ?? "name not found",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            onPressed: () {
              showAlertDialog(
                context: context,
                onOk: () async {
                  if (theProduct.id != null) {
                    await BlocProvider.of<PostsCubit>(context)
                        .deleteProduct(theProduct.id!);

                    BlocProvider.of<PostsCubit>(context).getProducts();
                  }else {
                    customSnackBar(context, "Product ID Is Wrong");
                  }
                  Navigator.pop(context);
                },
                txtHead: 'Delete Product',
                txtMsg: 'Are you sure? to delete this product',
              );
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}