


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/helper/custom_snack_bar.dart';
import '../../../../../../core/utils/styles.dart';
import '../../view model/WinchGetAllRepairOrdersCubit/WinchGetAllRepairOrdersCubit.dart';
import '../../view model/WinchHandleOrderActionCubit/WinchHandleOrderActionCubit.dart';


class WinchHandleOrderButtons extends StatelessWidget {
  const WinchHandleOrderButtons({
    super.key,
    required this.orderId,
  });

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WinchHandleOrderActionCubit, WinchHandleOrderActionState>(
      listener: (context, state) {
        if (state is WinchHandleOrderActionSuccess) {
          customSnackBar(context, state.message);
          BlocProvider.of<WinchGetAllRepairOrdersCubit>(context)
              .getAllRepairOrders();
        } else if (state is WinchHandleOrderActionError) {
          customSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is WinchHandleOrderActionLoading) {
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
                BlocProvider.of<WinchHandleOrderActionCubit>(context)
                    .handleOrderAction(orderId, "Accept");
              },
              child: Text(
                'Accept',
                style: Styles.textStyle20.copyWith(color: Colors.white),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kSecondryColor,
                ),
                onPressed: () {
                  BlocProvider.of<WinchHandleOrderActionCubit>(context)
                      .handleOrderAction(orderId, "Cancel");

                  // context
                  //     .read<HandleOrderActionCubit>()
                  //     .handleOrderAction(order.orderId!, 'Decline');
                },
                child: Text(
                  'Decline',
                  style: Styles.textStyle20,
                )),
          ],
        );
      },
    );
  }
}