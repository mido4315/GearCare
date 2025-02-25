


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/helper/custom_snack_bar.dart';
import '../../../../../../core/utils/styles.dart';
import '../../view model/GetAllRepairOrdersCubit/GetAllRepairOrdersCubit.dart';
import '../../view model/HandleOrderActionCubit/HandleOrderActionCubit.dart';

class HandleOrderButtons extends StatelessWidget {
  const HandleOrderButtons({
    super.key,
    required this.orderId,
  });

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HandleOrderActionCubit, HandleOrderActionState>(
      listener: (context, state) {
        if (state is HandleOrderActionSuccess) {
          customSnackBar(context, state.message);
          BlocProvider.of<GetAllRepairOrdersCubit>(context)
              .getAllRepairOrders();
        } else if (state is HandleOrderActionError) {
          customSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is HandleOrderActionLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
              ),
              onPressed: () {
                BlocProvider.of<HandleOrderActionCubit>(context)
                    .handleOrderAction(orderId, "Accept");
              },
              child: Text(
                'Accept',
                style: Styles.textStyle18.copyWith(color: Colors.white),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kSecondryColor,
                ),
                onPressed: () {
                  BlocProvider.of<HandleOrderActionCubit>(context)
                      .handleOrderAction(orderId, "Cancel");

                  // context
                  //     .read<HandleOrderActionCubit>()
                  //     .handleOrderAction(order.orderId!, 'Decline');
                },
                child: Text(
                  'Decline',
                  style: Styles.textStyle18,
                )),
          ],
        );
      },
    );
  }
}