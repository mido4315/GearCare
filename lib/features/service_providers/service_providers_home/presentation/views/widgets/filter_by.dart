
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../history/presentation/view model/MyOrdersHistoryCubit/MyOrdersHistoryCubit.dart';

class FilterBy extends StatefulWidget {
  const FilterBy({
    super.key,
  });

  @override
  State<FilterBy> createState() => _FilterByState();
}

class _FilterByState extends State<FilterBy> {

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
            BlocProvider.of<MyOrdersHistoryCubit>(context)
                .getMyOrdersHistory("time");
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
              BlocProvider.of<MyOrdersHistoryCubit>(context)
                  .getMyOrdersHistory("status");
            },
            child: Text(
              'Status',
              style: Styles.textStyle20.copyWith(color: Colors.white),
            )),
      ],
    );
  }
}