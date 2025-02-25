
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../winch_history/presentation/view model/WinchOrdersHistoryCubit/WinchOrdersHistoryCubit.dart';

class WinchFilterByButton extends StatelessWidget {
  const WinchFilterByButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Filter by:",
          style: Styles.textStyle24Bold,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
          ),
          onPressed: () {
            BlocProvider.of<WinchOrdersHistoryCubit>(context)
                .getMyOrdersHistory("time");
          },
          child: Text(
            'Date',
            style: Styles.textStyle20.copyWith(color: Colors.white),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kSecondryColor,
            ),
            onPressed: () {
              BlocProvider.of<WinchOrdersHistoryCubit>(context)
                  .getMyOrdersHistory("status");
            },
            child: Text(
              'Status',
              style: Styles.textStyle20,
            )),
      ],
    );
  }
}