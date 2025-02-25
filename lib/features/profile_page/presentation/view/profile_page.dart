import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/api_service.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/service_locator.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/profile_page/presentation/view/widgets/profile_body.dart';
import 'package:go_router/go_router.dart';

import '../../../home_page/data/repos/home_repo_impl.dart';
import '../../../home_page/presentation/view model/home_view_cubit/home_view_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        toolbarHeight: context.getHeight(givenHeight: 80),
        elevation: 7,
        title: Text(
          'Profile Details',
          style: Styles.textStyle26normal
              .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: context.getHeight(givenHeight: 30),
          ),
        ),
      ),
      body: ProfileBody(
        name: name,
        number: number,
        email: email,
        location: location,
        photoId: photoId,
        rate: rate,
        specialization: specialization,
        carTypeToRepair: carTypeToRepair,
        available: available,
        userType: userType,
        initialLocation: initialLocation,
        initialCarType: initialCarType,
        id: id,
      ),
    );
  }
}