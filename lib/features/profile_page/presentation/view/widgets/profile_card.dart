import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/widgets/open_whats_app_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../../widgets/chat_buttons.dart';
import '../../../../../widgets/custom_rating_bar.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
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

  String specializationsToString() {
    String specializations = "";
    int j = 2;
    if (specializations.length < j) {
      j = specializations.length;
    }
    for (int i = 0; i < j; i++) {
      if (specializations.length - 1 == i) {
        specializations = specialization[i];
      }
      specializations = "${specialization[i]} and";
    }
    return specializations;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.getHeight(givenHeight: 36),
      ),
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: context.getHeight(givenHeight: 326),
          width: context.getWidth(givenWidth: 326),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    photoId,
                    width: context.getWidth(givenWidth: 150),
                    height: context.getHeight(givenHeight: 170),
                    errorBuilder: (context, error, stackTrace) {
                      // Return your alternative widget here
                      return SizedBox(
                        width: context.getWidth(givenWidth: 150),
                        height: context.getHeight(givenHeight: 170),
                        child: const Center(
                            child:
                                Text('Image not found')), // Example placeholder
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      // width: context.getWidth(givenWidth: 150),
                      // height: context.getHeight(givenHeight: 170),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: Styles.textStyle20.copyWith(fontSize: 18),
                            maxLines: 1,
                          ),
                          Text(
                            maxLines: 3,
                            location,
                            style: Styles.textStyle14.copyWith(
                              color: AppColors.kPrimaryColor.withOpacity(.5),
                            ),
                          ),
                          Text(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            'a $userType with specialization in ${specializationsToString()}',
                            //'an integrated workshop for repairing all car breakdowns',
                            style: TextStyle(
                              fontSize: context.getWidth(
                                givenWidth: 14,
                              ),
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                          CustomRatingBar(
                            rating: rate,
                          ),
                          // const RatingStars(
                          //   size: 17,
                          //   fontSize: 12,
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  const Icon(
                    Icons.online_prediction,
                    color: Color(0xff15CB70),
                  ),
                   SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    available ? 'Available Now' : 'Not Available Right Now',
                    style: Styles.textStyle15
                        .copyWith(color: const Color(0xff0D6073)),
                  )
                ],
              ),
               SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  OrderButton(
                    initialLocation: initialLocation,
                    initialCarType: initialCarType,
                    id: id,
                    userType: userType,
                  ),
                  ChatButtons(number: number, size: 40.r, height: context.getHeight(givenHeight: 50), width: context.getWidth(givenWidth: 58),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
    required this.initialLocation,
    required this.initialCarType,
    required this.id,
    required this.userType,
  });

  final String initialLocation;
  final String initialCarType;
  final String id;
  final String userType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Remove borders
            ),
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kCreateOrderView, extra: {
              'initialLocation': initialLocation,
              'initialCarType': initialCarType,
              'serviceProviderId': id,
              'userType': userType,
            });
          },
          child: SizedBox(
            height: context.getHeight(givenHeight: 50),
            width: context.getWidth(givenWidth: 50),
            child: Center(
              child: Text(
                'Order',
                style: Styles.textStyle26.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 17.sp,
                ),
              ),
            ),
          )),
    );
  }
}