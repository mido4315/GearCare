import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/models/service_provider_model.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/profile_page/presentation/view/widgets/profile_card.dart';

import '../../../../home_page/presentation/view model/home_view_cubit/home_view_cubit.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    super.key,
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
    required this.initialLocation,
    required this.initialCarType,
    required this.id,
  });

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
  final String initialLocation;
  final String initialCarType;

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  double myRate = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileCard(
          name: widget.name,
          number: widget.number,
          email: widget.email,
          location: widget.location,
          photoId: widget.photoId,
          rate: widget.rate,
          specialization: widget.specialization,
          carTypeToRepair: widget.carTypeToRepair,
          available: widget.available,
          userType: widget.userType,
          initialLocation: widget.initialLocation,
          initialCarType: widget.initialCarType,
          id: widget.id,
        ),
        SizedBox(
          height: context.getHeight(givenHeight: 25),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'More suggestions',
                style: Styles.textStyle24Bold
                    .copyWith(color: AppColors.kPrimaryColor),
              ),
               SizedBox(
                height: 90.h,
              ),
              Center(
                
                child: SizedBox(
                    height: context.getHeight(givenHeight: 155),
                    child: const Text(
                      "There is no suggestions",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    )),
              )
              // SizedBox(
              //   height: context.getHeight(givenHeight: 155),
              //   child: BlocProvider.of<HomeViewCubit>(context)
              //               .serviceProviders
              //               .length == 1
              //       ? const Text("There is no suggestions",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),)
              //       : ListView.builder(
              //           itemCount: BlocProvider.of<HomeViewCubit>(context)
              //               .serviceProviders
              //               .length,
              //           scrollDirection: Axis.horizontal,
              //           itemBuilder: (context, index) {
              //
              //               return SuggestProfile(
              //                 serviceProviderModel:
              //                     BlocProvider.of<HomeViewCubit>(context)
              //                         .serviceProviders[index],
              //               );
              //
              //             return null;
              //           },
              //         ),
              // ),
            ],
          ),
        )
      ],
    );
  }
}

class SuggestProfile extends StatelessWidget {
  const SuggestProfile({super.key, required this.serviceProviderModel});

  final ServiceProviderModel serviceProviderModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.kPrimaryColor.withOpacity(.3),
      elevation: 4,
      child: Container(
        decoration: const BoxDecoration(),
        height: context.getHeight(givenHeight: 135),
        width: context.getWidth(givenWidth: 115),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetData.accountImage4,
                height: context.getHeight(givenHeight: 77),
                width: context.getWidth(givenWidth: 84)),
            const SizedBox(
              height: 6,
            ),
            Text(
              'ahmed hossam',
              style: Styles.textStyle14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.online_prediction,
                  color: Color(0xff15CB70),
                ),
                Text(
                  'avilable now',
                  style: Styles.textStyle15
                      .copyWith(color: const Color(0xff0D6073)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}