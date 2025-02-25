


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gear_care/features/service_providers/history/presentation/view%20model/MyOrdersHistoryCubit/MyOrdersHistoryCubit.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/helper/custom_snack_bar.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../winch_home/presentation/view model/WinchHandleOrderActionCubit/WinchHandleOrderActionCubit.dart';
import '../../view model/WinchOrdersHistoryCubit/WinchOrdersHistoryCubit.dart';



class WinchCompleteOrderButton extends StatelessWidget {
  const WinchCompleteOrderButton({
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
          BlocProvider.of<WinchOrdersHistoryCubit>(context)
              .getMyOrdersHistory("status");

        } else if (state is WinchHandleOrderActionError) {
          customSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is WinchHandleOrderActionLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
          ),
          onPressed: () {
            BlocProvider.of<WinchHandleOrderActionCubit>(context)
                .handleOrderAction(orderId, "Completed");
          },
          child: Text(
            textAlign: TextAlign.center,
            'Mark this order as Completed',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}