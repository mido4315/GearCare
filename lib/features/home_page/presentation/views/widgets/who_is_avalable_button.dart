import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';

class HowIsAvailablenowButtton extends StatefulWidget {
  const HowIsAvailablenowButtton({super.key});

  @override
  State<HowIsAvailablenowButtton> createState() => _HowIsAvailablenowButttonState();
}

class _HowIsAvailablenowButttonState extends State<HowIsAvailablenowButtton> {
  get textStyle24 => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          height: context.getHeight(givenHeight: 67),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.kPrimaryColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Who’s available now!',style: Styles.textStyle24.copyWith(fontSize: context.getWidth(givenWidth: 24,),color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
