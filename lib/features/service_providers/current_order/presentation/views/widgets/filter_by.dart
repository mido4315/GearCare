
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/features/service_providers/current_order/presentation/view%20model/CurrentOrderCubit.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../history/presentation/view model/MyOrdersHistoryCubit/MyOrdersHistoryCubit.dart';

class CurrentOrderFilterByButton extends StatefulWidget {
   const CurrentOrderFilterByButton({
    super.key,
  });

  @override
  State<CurrentOrderFilterByButton> createState() => _CurrentOrderFilterByButtonState();
}

class _CurrentOrderFilterByButtonState extends State<CurrentOrderFilterByButton> {
  int isSelected = 0;

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
            backgroundColor: isSelected == 0 ? AppColors.kPrimaryColor : Colors.transparent,
          ),
          onPressed: () {
            setState(() {
              isSelected = 0;
            });
            BlocProvider.of<CurrentOrderCubit>(context)
                .getCurrentOrder("time");
          },
          child: Text(
            'Date',
            style: Styles.textStyle20.copyWith(color: Colors.white),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected == 1 ? AppColors.kPrimaryColor : Colors.transparent,
            ),
            onPressed: () {
              setState(() {
                isSelected = 1;
              });
              BlocProvider.of<CurrentOrderCubit>(context)
                  .getCurrentOrder("status");
            },
            child: Text(
              'Status',
              style: Styles.textStyle20.copyWith(color: Colors.white),
            )),
      ],
    );
  }
}