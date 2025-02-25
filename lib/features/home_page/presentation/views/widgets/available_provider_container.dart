import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

import '../../view model/home_view_cubit/home_view_cubit.dart';

class AvailableProvidersContainer extends StatefulWidget {
  const AvailableProvidersContainer({
    super.key,
    this.onTap,
    required this.name,
    required this.number,
    required this.email,
    required this.location,
    required this.photoId,
    required this.rate,
    required this.specialization,
    required this.carTypeToRepair,
    required this.available,
    required this.userType,
    required this.id,
  });

  final void Function()? onTap;
  final String id;
  final String name;
  final String number;
  final String email;
  final String location;
  final String photoId;
  final double rate;
  final List<String> specialization;
  final String carTypeToRepair;
  final bool available;
  final String userType;

  @override
  State<AvailableProvidersContainer> createState() =>
      _AvailableProvidersContainerState();
}

class _AvailableProvidersContainerState
    extends State<AvailableProvidersContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.kOthersProfile,
              extra: {
                'name': widget.name,
                'number': widget.number,
                'email': widget.email,
                'location': widget.location,
                'photoId': widget.photoId,
                'rate': widget.rate,
                'specialization': widget.specialization,
                'carTypeToRepair': widget.carTypeToRepair,
                'available': widget.available,
                'userType': widget.userType,
                'initialLocation':
                    BlocProvider.of<HomeViewCubit>(context).location,
                'initialCarType':
                    BlocProvider.of<HomeViewCubit>(context).carType,
                'id': widget.id
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            height: context.getHeight(givenHeight: 75),
            width: context.getWidth(givenWidth: 364),
            decoration: const BoxDecoration(color: AppColors.kPrimaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      widget.photoId,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: Styles.textStyle24.copyWith(
                            fontSize: context.getWidth(
                              givenWidth: 24,
                            ),
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis),
                        textAlign: TextAlign.left,
                      ),
                      const Icon(
                        Icons.online_prediction,
                        size: 35,
                        color: Color(0xff15CB70),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.white,
          thickness: 1,
        )
      ],
    );
  }
}