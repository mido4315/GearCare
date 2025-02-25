


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gear_care/features/service_providers/current_order/presentation/view%20model/CurrentOrderCubit.dart';
import 'package:gear_care/features/service_providers/history/presentation/view%20model/MyOrdersHistoryCubit/MyOrdersHistoryCubit.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/helper/custom_snack_bar.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../service_providers_home/presentation/view model/GetAllRepairOrdersCubit/GetAllRepairOrdersCubit.dart';
import '../../../../service_providers_home/presentation/view model/HandleOrderActionCubit/HandleOrderActionCubit.dart';


class CompleteOrderButton extends StatelessWidget {
  const CompleteOrderButton({
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
          BlocProvider.of<CurrentOrderCubit>(context)
              .getCurrentOrder("status");

        } else if (state is HandleOrderActionError) {
          customSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is HandleOrderActionLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
          ),
          onPressed: () {
            BlocProvider.of<HandleOrderActionCubit>(context)
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